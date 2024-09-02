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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Icon(Icons.location_on),
                )
              ],
            )),
        const Expanded(flex: 2, child: SizedBox()),
      ],
    ));
  }
}
