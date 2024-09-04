import 'package:flutter/material.dart';

class HomeButtonWidget extends StatelessWidget {
  final String title, comment, root;

  const HomeButtonWidget(
      {super.key,
      required this.title,
      required this.comment,
      required this.root});

  @override
  Widget build(BuildContext context) {
    final bodySmallCopy =
        Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black);

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 3,
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  offset: Offset(5, 5))
            ]),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              comment,
              textAlign: TextAlign.center,
              style: bodySmallCopy,
            )
          ],
        ));
  }
}
