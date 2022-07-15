import 'package:flutter/material.dart';
import 'package:flutter_seed/services/auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({
    Key? key,
    required this.authPageController,
    required this.authScaffoldKey,
    required this.networkErrorSnackBar,
  }) : super(key: key);

  final PageController authPageController;
  final GlobalKey<ScaffoldState> authScaffoldKey;
  final SnackBar networkErrorSnackBar;

  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailTextField = TextEditingController();
  final GlobalKey<FormState> _forgotPasswordFormKey = GlobalKey<FormState>();

  // Run Action When Loading
  bool loading = false;

  // Email Sent SnackBar
  SnackBar emailSent = SnackBar(
    backgroundColor: const Color(0xFF0CE8CE),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.email,
          size: 15,
          color: Color(0xFF1C2028),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "Email sent!",
          style: TextStyle(
            color: Color(0xFF1C2028),
          ),
        )
      ],
    ),
  );

  // Map For Displaying Erorr Messages
  Map<String, String> errorMessage = {
    "email": "",
    "password": "",
    "network": "",
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Forgot Password?",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "To recover your password, you need to enter your registered email adress. We will sent the recovery link to your email.",
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: _forgotPasswordFormKey,
            child: TextFormField(
              controller: emailTextField,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Theme.of(context).colorScheme.secondary,
              obscureText: false,
              style: Theme.of(context).textTheme.headline5,
              decoration: const InputDecoration(labelText: "Email"),
              validator: (email) {
                if (email!.isEmpty) {
                  return "Please enter an email adress";
                } else if (email.contains("@") == false) {
                  return "Invalid email adress";
                } else if (errorMessage["email"]!.isNotEmpty) {
                  return errorMessage["email"];
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 30),

          // Send Email Button
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              color: Theme.of(context).colorScheme.secondary,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              onPressed: () async {
                setState(() {
                  errorMessage["email"] = "";
                  errorMessage["netwrok"] = "";
                  errorMessage["password"] = "";
                });

                // 1. Check Form Validation
                // 2. Set State "loading" = true
                // 3. Call "forgotPassword" Future inside AuthService()
                // 4. Catch NetworkError - Show SnackBar
                // 5. Set State "errorMessage" = value
                // 6. Check Form Validation Again
                // 7. If Valid => Sign In

                if (_forgotPasswordFormKey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                  await AuthService()
                      .forgotPassword(emailTextField.text)
                      .then((value) {
                    if (value["network"]!.isNotEmpty) {
                      widget.authScaffoldKey.currentState!
                          .showSnackBar(widget.networkErrorSnackBar);
                      setState(() {
                        loading = false;
                      });
                    }
                    setState(() {
                      errorMessage = value;
                      loading = false;
                    });

                    if (_forgotPasswordFormKey.currentState!.validate()) {
                      widget.authScaffoldKey.currentState!
                          .showSnackBar(emailSent);
                      widget.authPageController.nextPage(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOutCirc,
                      );
                    }
                  });
                }
              },
              child: loading
                  ? SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).scaffoldBackgroundColor),
                      ),
                    )
                  : const Text("Send"),
            ),
          ),
        ],
      ),
    );
  }
}
