import 'package:flutter/material.dart';
import 'package:learningdart/constant/routes.dart';
import 'package:learningdart/services/auth/auth_services.dart';
import 'package:learningdart/views/login_view.dart';
import 'package:learningdart/views/main_ui.dart';
import 'package:learningdart/views/register_view.dart';
import 'package:learningdart/views/verify_view.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        mainRoute: (context) => const MainUI(),
        verifyEmailRoute: (context) => const VerifyEmail(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: AuthServices.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = AuthServices.firebase().currentUser;
              if (user != null) {
                if (user.isEmailVerified) {
                  return const MainUI();
                } else {
                  return const VerifyEmail();
                }
              } else {
                return const LoginView();
              }
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
