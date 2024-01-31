import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:patientapp/screens/dummy.dart';
import 'package:patientapp/screens/login/loginscreen.dart';
import 'package:patientapp/screens/registration/registerscreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(),
              const Image(image: AssetImage('assets/images/sayap_africa.png')),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.translate66,
                  style: const TextStyle(
                      color: Color.fromARGB(200, 8, 65, 10),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Plasto',
                      letterSpacing: 2),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 60),
                      primary: const Color.fromARGB(200, 8, 65, 10)),
                  child: Text(AppLocalizations.of(context)!.translate1)),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 60),
                      primary: const Color.fromARGB(200, 8, 65, 10)),
                  child: Text(AppLocalizations.of(context)!.translate2)),
            ],
          ),
        )));
  }
}
