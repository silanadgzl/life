import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life/constant.dart';


class IconCinsiyet extends StatelessWidget {
  final IconData? icon;
  String cinsiyet;
  // ignore: use_key_in_widget_constructors
  IconCinsiyet({this.icon=FontAwesomeIcons.venus, this.cinsiyet="Default"}); //default değerler

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.black54, size: 50),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet,
          // ignore: prefer_const_constructors
          style:kMetinStili,
        ),
      ],
    );
  }
}