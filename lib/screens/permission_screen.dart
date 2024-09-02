import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  Future requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
    } else {
      // 비동기 future함수에서 buildContext 사용 시
      // 비동기 작업이 완료되는 동안 상태값이 변경 될 수 있기 때문에
      // if(mounted)로 buildContext가 유효한지 확인 필요
      if (mounted) {
        Navigator.pushNamed(context, '/home');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
            flex: 3,
            child: Center(
              child: Column(
                children: [
                  Container(
                    child: const Icon(
                      Icons.location_on,
                      size: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      '위치 정보 제공에\n동의하지 않으셨습니다.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      '위치정보 제공에 동의하시면\n더 정확한 정보를 전달해드릴 수 있어요.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Geolocator.openAppSettings();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).cardColor),
                      child: const Text(
                        '설정으로 가기',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: const Text(
                        '건너뛰기',
                        style: TextStyle(
                            color: Color(0xff8E8E93),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            )),
        const Expanded(flex: 1, child: SizedBox()),
      ],
    ));
  }
}
