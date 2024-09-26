import 'package:flutter/material.dart';
import 'package:jmc/widgets/modal_main_widget.dart';

class ModalLoginWidget extends StatelessWidget {
  const ModalLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final headlineSmallCopy =
        Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16);
    final displaySmallCopy =
        Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16);
    final headlineLargeCopy =
        Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 40);

    return AlertDialog(
      content: Text(
        '잠깐만요!',
        style: headlineLargeCopy,
      ),
      actions: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 225,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '선택한 정보에 맞추어\n추천을 하기 위해서는\n로그인 정보가 필요해요.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '선택한 정보와 상관없이\n메뉴 추천을 원한다면\n로그인 없이도\n계속 이용 가능해요.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ModalMainWidget();
                    },
                  );
                },
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(245, 35),
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    Color(0xffD9D9D9),
                  ),
                ),
                child: Text(
                  '닫기',
                  style: headlineSmallCopy,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(245, 35),
                  ),
                ),
                child: Text(
                  '로그인 하기',
                  style: displaySmallCopy,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        )
      ],
    );
  }
}
