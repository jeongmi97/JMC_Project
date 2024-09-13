import 'package:flutter/material.dart';
import 'package:jmc/widgets/modal_bottom_widget.dart';
import 'package:jmc/widgets/popup_menu_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final labelMediumCopy =
        Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black);
    final bodyMediumCopy = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: const Color(0xff345B5B));

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
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '언양닭칼국수 센텀점\n센텀점',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Tooltip(
                      message: '부산 해운대구 센텀동로 99\n벽산E센텀클래스원 113호',
                      textStyle: labelMediumCopy,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 180, 180, 180),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 3,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Text(
                        '주소 보기',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Transform.translate(
                offset: const Offset(0, -18),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '내 위치와의 거리',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            '120m',
                            style: bodyMediumCopy,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '구글 평점',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            '4.5',
                            style: bodyMediumCopy,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '매장 내 식사',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            '가능',
                            style: bodyMediumCopy,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            '배달 및 포장',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            '가능',
                            style: bodyMediumCopy,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Transform.translate(
                offset: const Offset(0, -73),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.error_outline),
                        label: const Text(
                          '좋아요',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        iconAlignment: IconAlignment.end,
                        style: const ButtonStyle(
                          iconSize: WidgetStatePropertyAll(18),
                          minimumSize: WidgetStatePropertyAll(
                            Size(150, 30),
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const ModalBottomWidget();
                            },
                          );
                        },
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.error_outline),
                        label: const Text(
                          '별로에요',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        iconAlignment: IconAlignment.end,
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(
                            Color(0xffF2F2F2),
                          ),
                          foregroundColor: WidgetStatePropertyAll(
                              Theme.of(context).primaryColor),
                          iconSize: const WidgetStatePropertyAll(18),
                          minimumSize: const WidgetStatePropertyAll(
                            Size(150, 30),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
