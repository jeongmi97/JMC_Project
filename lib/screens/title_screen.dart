import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
