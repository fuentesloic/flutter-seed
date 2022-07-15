import 'package:flutter/material.dart';
import 'package:flutter_seed/pages/auth/forgot_password.dart';
import 'package:flutter_seed/pages/auth/sign_in.dart';
import 'package:flutter_seed/pages/auth/sign_up.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  AuthenticationPageState createState() => AuthenticationPageState();
}

class AuthenticationPageState extends State<AuthenticationPage> {
  final GlobalKey<ScaffoldState> _authScaffoldKey = GlobalKey<ScaffoldState>();
  PageController authPageController =
      PageController(keepPage: true, initialPage: 1);

  int page = 1;

  // No Internet Connection SnackBar
  SnackBar networkErrorSnackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.wifi_off,
          size: 15,
          color: Colors.white,
        ),
        SizedBox(
          width: 4,
        ),
        Text("No internet connection. Try again!")
      ],
    ),
  );

  // Change Page Button Preffixs
  List<String> preffix = [
    "Don't want to reset password? ",
    "Need an account? ",
    "Have an account? ",
  ];

  // Change Page Button Suffixs
  List<String> suffix = [
    "Sign In",
    "SignUp",
    "Sign In",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _authScaffoldKey,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      // Logo Template
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            "Logo",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,

                    // PageView To Display Auth Pages
                    child: PageView(
                      controller: authPageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (value) {
                        setState(() {
                          page = value;
                        });
                      },
                      children: [
                        // Forgot Password Page
                        ForgotPasswordPage(
                          authPageController: authPageController,
                          authScaffoldKey: _authScaffoldKey,
                          networkErrorSnackBar: networkErrorSnackBar,
                        ),

                        // SignIn Page
                        SignInPage(
                          authPageController: authPageController,
                          authScaffoldKey: _authScaffoldKey,
                          networkErrorSnackBar: networkErrorSnackBar,
                        ),

                        // SignUp Page
                        SignUpPage(
                          authScaffoldKey: _authScaffoldKey,
                          networkErrorSnackBar: networkErrorSnackBar,
                        ),
                      ],
                    ),
                  ),

                  // Change Page Button
                  GestureDetector(
                    onTap: () {
                      if (authPageController.page == 2) {
                        authPageController.previousPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeInOutCirc,
                        );
                      } else {
                        authPageController.nextPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeInOutCirc,
                        );
                      }
                    },
                    child: RichText(
                      text: TextSpan(
                        text: preffix[page],
                        style: Theme.of(context).textTheme.headline5,
                        children: <TextSpan>[
                          TextSpan(
                              text: suffix[page],
                              style: Theme.of(context).textTheme.headline4),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
