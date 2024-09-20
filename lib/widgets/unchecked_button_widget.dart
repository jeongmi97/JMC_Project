import 'package:flutter/material.dart';

class UncheckedButtonWidget extends StatelessWidget {
  const UncheckedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 1,
              color: Color.fromRGBO(0, 0, 0, 0.2),
              offset: Offset(2, 2),
            )
          ]),
      child: Icon(
        Icons.favorite_outline,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
