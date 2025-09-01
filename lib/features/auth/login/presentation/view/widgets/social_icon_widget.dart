import 'package:flutter/material.dart';

Widget buildSocialIcon(IconData icon) {
  return CircleAvatar(
    radius: 22,
    backgroundColor: Colors.black87,
    child: Icon(icon, color: Colors.white),
  );
}