import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 2),
          () => Navigator.pushNamed(context, '/home'),
        ),
        builder: (context, snapshot) {
          print('called builder');
          return Scaffold(
            backgroundColor: Theme.of(context).canvasColor,
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
