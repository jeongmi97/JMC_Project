import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PopupMenuButtonWidget extends StatefulWidget {
  const PopupMenuButtonWidget({super.key});

  @override
  State<PopupMenuButtonWidget> createState() => _PopupMenuButtonClassState();
}

class _PopupMenuButtonClassState extends State<PopupMenuButtonWidget> {
  bool isMenuOpend = false;
  GoogleSignIn googleSignIn = GoogleSignIn();
  bool isSigned = false;
  final storage = const FlutterSecureStorage();

  isSignedChk() async {
    if (await storage.read(key: 'id') != null) {
      setState(() {
        isSigned = true;
      });
    }
  }

  menuOpend() {
    setState(() {
      isMenuOpend = true;
    });
  }

  menuclosed() {
    setState(() {
      isMenuOpend = false;
    });
  }

  logout() async {
    await googleSignIn.signOut();
    storage.deleteAll();
    setState(() {
      isSigned = false;
    });
  }

  @override
  void initState() {
    super.initState();
    isSignedChk();
  }

  @override
  Widget build(BuildContext context) {
    var appBarHeight = AppBar().preferredSize.height;

    return PopupMenuButton(
      onOpened: () {
        menuOpend();
      },
      onCanceled: () {
        menuclosed();
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      // shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
      // elevation: 100,
      color: Colors.white,
      offset: Offset(0.0, appBarHeight),
      icon: isMenuOpend
          ? const Icon(
              Icons.close,
              size: 30,
            )
          : const Icon(
              Icons.menu,
              size: 30,
            ),
      itemBuilder: (context) => <PopupMenuEntry>[
        const PopupMenuItem(
            child: Text(
          '설정',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
        )),
        const PopupMenuDivider(),
        if (isSigned == false)
          PopupMenuItem(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            onTap: () => Navigator.pushNamed(context, "/login"),
            child: const ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text(
                '로그인 하기',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
            ),
          ),
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          onTap: () => Navigator.pushNamed(context, ""),
          child: const ListTile(
            leading: Icon(Icons.textsms_outlined),
            title: Text(
              '마이페이지',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black,
            ),
          ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          onTap: () => Navigator.pushNamed(context, ""),
          child: const ListTile(
            leading: Icon(Icons.textsms_outlined),
            title: Text(
              '문의 하기',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black,
            ),
          ),
        ),
        const PopupMenuDivider(),
        if (isSigned == true)
          PopupMenuItem(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            onTap: () {
              logout();
            },
            child: const ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
            ),
          ),
      ],
    );
  }
}
