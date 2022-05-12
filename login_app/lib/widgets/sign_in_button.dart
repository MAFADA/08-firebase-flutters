import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/pages/first_screen.dart';
import 'package:login_app/services/sign_in.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // splashColor: Colors.grey,
      onPressed: () async {
        User? user = await Authentication.signInWithGoogle(context: context);

        if (user != null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => FirstScreen(
                    user: user,
                  )));
        }
      },
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      // highlightElevation: 0,
      // borderSide: const BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 35.0),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
