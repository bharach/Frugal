import 'package:flutter/material.dart';
import 'package:patientapp/widgets/customeinputfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  final String mobile;
  final String email;
  final String dob;
  final String userId;

  ProfileScreen({
    required this.name,
    required this.mobile,
    required this.email,
    required this.dob,
    required this.userId,
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.name;
    emailController.text = widget.email;
    mobileController.text = widget.mobile;
    dobController.text = widget.dob;
    super.initState();
  }

  Future<void> updateUserDetails() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      await _firestore
          .collection('users')
          .doc('0e507600-f9eb-1d25-9dc2-c51e30c57698')
          .update({
        'name': nameController.text,
        'phoneNumber': mobileController.text,
        'email': emailController.text,
        'dob': dobController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile updated successfully'),
        ),
      );
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update profile'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Column(children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.translate71,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E232C),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                CustomInputField(
                    labelText: AppLocalizations.of(context)!.translate33,
                    controller: nameController,
                    enabled: false),
                SizedBox(height: 25),
                CustomInputField(
                    labelText: AppLocalizations.of(context)!.translate34,
                    controller: mobileController,
                    enabled: true),
                SizedBox(height: 25),
                CustomInputField(
                    labelText: AppLocalizations.of(context)!.translate35,
                    controller: emailController,
                    enabled: false),
                SizedBox(height: 25),
                CustomInputField(
                    labelText: AppLocalizations.of(context)!.translate36,
                    controller: dobController,
                    enabled: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      updateUserDetails();
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width * 1,
                            MediaQuery.of(context).size.height * 0.1),
                        backgroundColor: Color.fromARGB(200, 8, 65, 10)),
                    child: Text(AppLocalizations.of(context)!.translate33),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
