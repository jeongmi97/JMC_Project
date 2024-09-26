import 'package:flutter/material.dart';

class ModalMainWidget extends StatelessWidget {
  const ModalMainWidget({super.key});

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
        '다른 메뉴를\n추천해\n드릴까요?',
        style: headlineLargeCopy,
      ),
      actions: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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
                  '괜찮아요',
                  style: headlineSmallCopy,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(245, 35),
                  ),
                ),
                child: Text(
                  '다시 추천 받기',
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
