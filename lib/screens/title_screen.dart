import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  bool isPermission = false;

  Future locationPermissionChk() async {
    // 기기에서 위치 정보 획득 기능이 활성화 되어있는지 확인
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
    } else {
      // 앱에 위치 추적 퍼미션이 설정 되어있는지 확인
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission != LocationPermission.denied) {
        isPermission = true;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    locationPermissionChk();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 2),
          // () => Navigator.pushNamed(context, '/home'),
          () {
            isPermission
                ? Navigator.pushNamed(context, '/home')
                : Navigator.pushNamed(context, '/permission');
          },
        ),
        builder: (context, snapshot) {
          print('called builder');
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "점\n메\n추",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const Icon(
                          Icons.horizontal_rule,
                          size: 100,
                          color: Colors.white,
                          // shadows: [
                          //   Shadow(
                          //     blurRadius: 1,
                          //     color: Color.fromRGBO(0, 0, 0, 0.2),
                          //     offset: Offset(0, 4),
                          //   ),
                          // ],
                        ),
                        Text(
                          "심\n뉴\n천",
                          style: Theme.of(context).textTheme.displaySmall,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
