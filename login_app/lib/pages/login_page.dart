import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_app/services/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

import '../widgets/sign_in_button.dart';

// void main() => runApp(const MaterialApp(
//       home: LoginPage(),
//     ));

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const FlutterLogo(size: 150),
                      const SizedBox(height: 40),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('Email'),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 16),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Password',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: passController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 16),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: 300,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              width: 300,
                              child: ElevatedButton(
                                onPressed: () async {
                                  FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passController.text);
                                  setState(() {});
                                },
                                child: const Text(
                                  'SignUp',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const <Widget>[
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            'OR',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      const SignInButton(),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   child: Padding(
                      //     padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.min,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: const <Widget>[
                      //         Image(
                      //             image: AssetImage(
                      //                 "assets/images/google_logo.png"),
                      //             height: 35.0),
                      //         Padding(
                      //           padding: EdgeInsets.only(left: 10),
                      //           child: Text(
                      //             'Sign in with Google',
                      //             style: TextStyle(
                      //               fontSize: 20,
                      //               color: Colors.white,
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ]),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _signInButton() {
  //   return ElevatedButton(
  //     // splashColor: Colors.grey,
  //     onPressed: () {
  //       signInWithGoogle().then((result) {
  //         if (result != null) {
  //           Navigator.of(context).push(
  //             MaterialPageRoute(
  //               builder: (context) {
  //                 return const FirstScreen();
  //               },
  //             ),
  //           );
  //         }
  //       });
  //     },
  //     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  //     // highlightElevation: 0,
  //     // borderSide: const BorderSide(color: Colors.grey),
  //     child: Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: const <Widget>[
  //           Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
  //           Padding(
  //             padding: EdgeInsets.only(left: 10),
  //             child: Text(
  //               'Sign in with Google',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.grey,
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
