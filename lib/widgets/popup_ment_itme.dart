import 'package:flutter/material.dart';

PopupMenuItem<String> menuItem(String text, Icon icon, String root) {
  return PopupMenuItem(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
    child: ListTile(
      leading: icon,
      title: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.black,
      ),
    ),
  );
}
