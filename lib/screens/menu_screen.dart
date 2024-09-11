import 'package:flutter/material.dart';
import 'package:jmc/widgets/popup_menu_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            '메뉴 보기',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          leading: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              icon: const Icon(Icons.home)),
          actions: const [
            // 팝업 메뉴 위젯 분리
            PopupMenuButtonWidget(),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  '오늘은 이 메뉴\n어때요?',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220226_154%2F1645848737399di3BA_JPEG%2F1645848679067.jpg'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 3,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  width: 330,
                  height: 300,
                )),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: const Row(
                  children: [
                    Text('언양닭칼국수 센텀점\n센텀점'),
                    SizedBox(
                      width: 160,
                    ),
                    Text('주소보기'),
                  ],
                ),
              ),
            ),
            const Expanded(flex: 1, child: Column()),
            const Expanded(flex: 1, child: Row()),
          ],
        ),
      ),
    );
  }
}
