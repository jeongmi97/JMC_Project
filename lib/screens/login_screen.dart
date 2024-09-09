import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  // final GoogleSignInAccount? googleUser = GoogleSignIn().signIn();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignIn googleSignIn = GoogleSignIn();
  bool isSigned = false;

  login() async {
    isSigned = await googleSignIn.isSignedIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      print('is user');
      print(googleUser);
    } else {
      print('is not user');
      print(googleUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Expanded(flex: 1, child: SizedBox()),
          const Expanded(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconTheme(
                    data: IconThemeData(
                      color: Color(0xffFE6B00),
                      size: 35,
                      shadows: [
                        Shadow(
                          blurRadius: 1,
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.ramen_dining_outlined),
                        Icon(Icons.lunch_dining_outlined),
                        Icon(Icons.restaurant_outlined),
                        Icon(Icons.fastfood),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  '로그인',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  '점메추는 구글메일로 로그인이 가능해요.',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SignInButton(
                    padding: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    buttonType: ButtonType.google,
                    btnTextColor: Colors.white,
                    btnColor: Colors.black,
                    btnText: 'Continue with Google',
                    onPressed: () {
                      login();
                    },
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const Divider(
                  thickness: 1,
                  indent: 60,
                  endIndent: 60,
                  height: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '점메추는 처음이신가요?',
                ),
                TextButton(
                  child: Text(
                    '회원가입',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  onPressed: () {
                    login();
                  },
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
