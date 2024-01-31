import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/style.dart';
import 'package:patientapp/Models/logindetail.dart';
import 'package:patientapp/resources/firebasefire.dart';
import 'package:patientapp/screens/dashboard/dashboard.dart';
import 'package:patientapp/widgets/textfield.dart';
import 'package:uuid/uuid.dart';
import 'package:patientapp/widgets/snackBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuccessReg extends StatefulWidget {
  final UserCredential userCredential;
  const SuccessReg({super.key, required this.userCredential});

  @override
  State<SuccessReg> createState() => _SuccessRegState();
}

class _SuccessRegState extends State<SuccessReg> {
  final FirestoreMethods _firestore = FirestoreMethods();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _dobcontroller = TextEditingController();
  final RegExp datePattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');
  bool _clicked = false;

  void Firesignup(
      {required String name,
      required String dob,
      required String email,
      required String mmid,
      required String phonenumber}) async {
    Logindetail post = await _firestore.signUp(
        name: name,
        dob: dob,
        email: email,
        mmid: mmid,
        phonenumber: phonenumber);
    if (post != null) {
    } else {
      snackBar(context, AppLocalizations.of(context)!.translate66);
    }
  }

  @override
  Future<void> signUp(
      {required String name,
      required String dob,
      required String email,
      required String mmid,
      required String phonenumber}) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    //String postId = Uuid().v1();

    Logindetail post = Logindetail(
        docid: Uuid().v1(),
        phonenumber: phonenumber,
        name: name,
        dob: dob,
        email: email,
        uid: mmid);

    try {
      await _firestore.collection('users').doc(post.docid).set(post.toJson());
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(logindetail: post),
        ),
        (route) => false,
      );
    } catch (error) {
      print(error);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Image(
                image: AssetImage('assets/images/sayap_africa3.png'),
                width: 250,
                height: 200,
              )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  AppLocalizations.of(context)!.translate16,
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Plasto',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldInput(
                  textEditingController: _namecontroller,
                  hint: AppLocalizations.of(context)!.translate17,
                  textInputType: TextInputType.name,
                  error: AppLocalizations.of(context)!.translate18,
                  clicked: _clicked),
              TextFieldInput(
                textEditingController: _dobcontroller,
                hint: AppLocalizations.of(context)!.translate19,
                textInputType: TextInputType.datetime,
                error: _dobcontroller.text.isNotEmpty &&
                        !datePattern.hasMatch(_dobcontroller.text)
                    ? AppLocalizations.of(context)!.translate20
                    : AppLocalizations.of(context)!.translate21,
                clicked: _clicked,
              ),
              TextFieldInput(
                textEditingController: _emailcontroller,
                hint: AppLocalizations.of(context)!.translate22,
                textInputType: TextInputType.emailAddress,
                error: AppLocalizations.of(context)!.translate23,
                clicked: _clicked,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _clicked = true;
                      });
                      if (_namecontroller.text.isNotEmpty &&
                          (_dobcontroller.text.isNotEmpty &&
                              datePattern.hasMatch(_dobcontroller.text)) &&
                          _emailcontroller.text.isNotEmpty) {
                        signUp(
                            name: _namecontroller.text,
                            dob: _dobcontroller.text,
                            email: _emailcontroller.text,
                            mmid: widget.userCredential.user!.uid,
                            phonenumber:
                                widget.userCredential.user!.phoneNumber ?? '');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(350, 50),
                        backgroundColor: Color.fromARGB(200, 8, 65, 10)),
                    child: Text(AppLocalizations.of(context)!.translate2)),
              )
            ],
          ))
        ],
      ),
    );
  }
}
