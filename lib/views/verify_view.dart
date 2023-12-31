import 'package:flutter/material.dart';
import 'package:learningdart/constant/routes.dart';
import 'package:learningdart/services/auth/auth_services.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(children: [
        const Text(
            "We've sent a vesification mail, please verify your account"),
        const Text(
            "If you haven't recieve verification mail, press the button below"),
        TextButton(
          onPressed: () async {
            await AuthServices.firebase().sendEmailVerification();
          },
          child: const Text("send email verification"),
        ),
        TextButton(
          onPressed: () {
            AuthServices.firebase().logOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
              registerRoute,
              (route) => false,
            );
          },
          child: const Text("Restart"),
        ),
      ]),
    );
  }
}
