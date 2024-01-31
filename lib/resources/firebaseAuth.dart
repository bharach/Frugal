import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:patientapp/Models/verifymodel.dart';

class FirebaseAuthmethods {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<VerifyModel> verifyPhone({required String number}) async {
    String message = '';
    //String verificationid = '';
    Completer<VerifyModel> completer = Completer<VerifyModel>();

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException exep) async {
          message = exep.toString();
          print(message);
          completer.complete(VerifyModel(
            status: false,
            message: message,
            verificationId: '',
          ));
        },
        codeSent: (String verificationId, int? resendToken) async {
          completer.complete(VerifyModel(
              status: true, message: message, verificationId: verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) async {
          // Handle auto retrieval timeout if needed
        },
      );
    } catch (error) {
      print(error);
      completer.complete(VerifyModel(
        status: false,
        message: error.toString(),
        verificationId: 'verificationid',
      ));
    }

    return completer.future;
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Successfully signed out
    } catch (e) {
      // Handle sign-out errors if any
      print("Error signing out: $e");
    }
  }
}
