import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jmc/widgets/checked_button_widget.dart';
import 'package:jmc/widgets/unchecked_button_widget.dart';

class ModalBottomWidget extends StatefulWidget {
  const ModalBottomWidget({super.key});

  @override
  State<ModalBottomWidget> createState() => _ModalBottomWidgetState();
}

class _ModalBottomWidgetState extends State<ModalBottomWidget> {
  bool isVisit = false;
  bool isFavorit = false;

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
              '좋아요를 누르셨네요!',
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
                    '오늘 방문 할 계획이신가요?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '이전에 내가 방문한 맛집에서 확인 가능해요.',
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
                    '선호하는 메뉴 인가요?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '다음번 메뉴추천에 이 메뉴가 추천될 수 있어요.',
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
            onPressed: () {},
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
