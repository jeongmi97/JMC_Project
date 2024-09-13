import 'package:flutter/material.dart';

class ModalBottomWidget extends StatelessWidget {
  const ModalBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: const BoxDecoration(
        // backgroundBlendMode: ,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
