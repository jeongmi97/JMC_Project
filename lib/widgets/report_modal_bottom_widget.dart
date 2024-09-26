import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jmc/widgets/checked_button_widget.dart';
import 'package:jmc/widgets/modal_login_widget.dart';
import 'package:jmc/widgets/modal_main_widget.dart';
import 'package:jmc/widgets/unchecked_button_widget.dart';

class ReportModalBottomWidget extends StatefulWidget {
  const ReportModalBottomWidget({super.key});

  @override
  State<ReportModalBottomWidget> createState() => _ReportModalBottomWidget();
}

class _ReportModalBottomWidget extends State<ReportModalBottomWidget> {
  bool isVisit = false;
  bool isFavorit = false;
  String? loginValue = "";
  bool isLogin = false;

  buttonTap(String type) {
    if (type == 'visit') {
      setState(() {
        isVisit = !isVisit;
      });
    }

    if (type == 'favorit') {
      setState(() {
        isFavorit = !isFavorit;
      });
    }
  }

  getLoginRepo() async {
    const storage = FlutterSecureStorage();
    loginValue = await storage.read(key: "id");

    if (loginValue == null) {
      setState(() {
        isLogin = false;
      });
    } else {
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLoginRepo();
  }

  @override
  Widget build(BuildContext context) {
    final headlineSmallCopy =
        Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 23);
    final labelMediumCopy =
        Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black);
    final displaySmallCopy =
        Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18);

    return Container(
      height: 320,
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 33),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '별로에요를 누르셨네요!',
              style: headlineSmallCopy,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '선호하는 메뉴가 아닌가요?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '해당 메뉴는 추천에서 제외할게요.',
                        style: labelMediumCopy,
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  buttonTap('favorit');
                },
                child: isFavorit
                    ? const CheckedButtonWidget()
                    : const UncheckedButtonWidget(),
              ),

              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.favorite_outline,
              //     color: Color(0xffFE6B00),
              //   ),
              //   alignment: Alignment.centerRight,
              // )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '이미 방문한 경험이 있나요?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '해당 식당은 추천에서 제외할게요.',
                        style: labelMediumCopy,
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  buttonTap('visit');
                },
                child: isVisit
                    ? const CheckedButtonWidget()
                    : const UncheckedButtonWidget(),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: const ButtonStyle(
              minimumSize: WidgetStatePropertyAll(
                Size(165, 35),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return isLogin
                      ? const ModalMainWidget()
                      : const ModalLoginWidget();
                  // return const ModalMainWidget();
                  // return const ModalLoginWidget();
                },
              );
            },
            child: Text(
              '저장하기',
              style: displaySmallCopy,
            ),
          )
        ],
      ),
    );
  }
}
