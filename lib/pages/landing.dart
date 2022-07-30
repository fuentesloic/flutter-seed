import 'package:flutter_seed/pages/home.dart';
import 'package:flutter_seed/services/auth.dart';
import 'package:flutter_seed/pages/auth/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService().authStateChanges(),
      builder: (context, AsyncSnapshot snapshot) {
        // if the stream has data, the user is logged in
        if (snapshot.hasData) {
          // isLoggedIn
          return const HomePage();
        } else if (snapshot.hasData == false &&
            snapshot.connectionState == ConnectionState.active) {
          // isLoggedOut
          return const AuthenticationPage();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
