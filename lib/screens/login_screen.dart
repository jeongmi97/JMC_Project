import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jmc/models/user_model.dart';
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
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  login() async {
    // isSigned = await googleSignIn.isSignedIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      const storage = FlutterSecureStorage();

      var id = googleUser.id;
      log('googleSignInAccoutn id : $id');
      storage.deleteAll();
      storage.write(key: 'id', value: id);
      Navigator.pushNamed(context, '/menu');
    }
  }

  @override
  Widget build(BuildContext context) {
    final labelMediumCopy =
        Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black);
    final labelLargeCopy = Theme.of(context)
        .textTheme
        .labelLarge!
        .copyWith(fontWeight: FontWeight.w600, color: const Color(0xff4285f4));

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
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '점메추는 구글메일로 로그인이 가능해요.',
                  style: labelMediumCopy,
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
                Text(
                  '점메추는 처음이신가요?',
                  // style: labelLargeMent,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextButton(
                  child: Text(
                    '회원가입',
                    style: labelLargeCopy,
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
