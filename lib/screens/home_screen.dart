import 'package:flutter/material.dart';
import 'package:jmc/widgets/home_button_widget.dart';
import 'package:jmc/widgets/popup_ment_itme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final displayMediumCopy =
        Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 35);

    var appBarHeight = AppBar().preferredSize.height;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            actions: [
              PopupMenuButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                // shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
                // elevation: 100,
                color: Colors.white,
                offset: Offset(0.0, appBarHeight),
                icon: const Icon(
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
                  menuItem('로그인 하기', const Icon(Icons.account_box_outlined),
                      "/login"),
                  menuItem('마이페이지', const Icon(Icons.textsms_outlined), ""),
                  menuItem('문의 하기', const Icon(Icons.chat_bubble_outline), ""),
                  const PopupMenuDivider(),
                  menuItem('Logout', const Icon(Icons.logout), ""),
                ],
              ),
            ],
          ),
          // drawer: const Drawer(
          //   child: Text('aaa'),
          // ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '원하는 옵션\n선택하기',
                        style: displayMediumCopy,
                      ),
                    )),
                const Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      HomeButtonWidget(
                          title: "메뉴를\n추천 받기",
                          comment: "근처에 있는 식당들 메뉴 중\n하나를 추천해드려요.",
                          root: "/"),
                      HomeButtonWidget(
                          title: "새로 생긴 곳\n알아보기",
                          comment: "근처에 있는 식당들 중 새로 오픈한 곳을\n알려드려요.",
                          root: "/"),
                      HomeButtonWidget(
                          title: "지도로\n근처 맛집 찾기",
                          comment: "지도를 보며 맛집을 고를 수 있어요.",
                          root: "/"),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
