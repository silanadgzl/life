import 'package:flutter/material.dart';
import 'package:life/constant.dart';
import 'hesap.dart';
import 'user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sonuç Sayfası")),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          flex: 8,
          child: Center(
            child: Text(Hesap(_userData).hesaplama().round().toString(),
                style: kMetinStili),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("GERİ DÖN", style: kMetinStili),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
          ),
        ),
      ]),
    );
  }
}
