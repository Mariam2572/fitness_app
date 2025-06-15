  import 'package:flutter/material.dart';

AppBar buildAppBar({required BuildContext context,Widget? leading, Widget? title  }) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(top: 20, left: 14),
        child: GestureDetector(
          onTap: ()=>Navigator.pop(context),
          child: leading),
      ),
      title: Padding(padding: const EdgeInsets.only(top: 30), child: title),
      centerTitle: true,
    );
  }