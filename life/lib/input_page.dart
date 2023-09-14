import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life/constant.dart';
import 'package:life/icon_cinsiyet.dart';
import 'package:life/my_container.dart';
import 'package:life/user_data.dart';

import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0;
  double sporSayisi = 0;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    renk: Colors.white,
                    child: newOutlineButton("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: newOutlineButton("KİLO"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Haftada kaç gün spor yapıyorsunuz?",
                      style: kMetinStili),
                  Text(
                    "${sporSayisi.round()}",
                    style: kSayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    divisions: 7,
                    value: sporSayisi,
                    onChanged: (double value) {
                      setState(() {
                        sporSayisi = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Günde kaç tane sigara içiyorsunuz?",
                    style: kMetinStili,
                  ),
                  Text(
                    "${icilenSigara.round()}", //round sayıları yuvarlar
                    style: kSayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 30,
                    divisions: 30,
                    value: icilenSigara,
                    onChanged: (double value) {
                      setState(() {
                        icilenSigara = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPressxx: () {
                      setState(() {
                        seciliCinsiyet = "KADIN";
                      });
                    },
                    renk: seciliCinsiyet == "KADIN"
                        ? Colors.pinkAccent
                        : Colors.white,
                    child: IconCinsiyet(
                      cinsiyet: "KADIN",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPressxx: () {
                      setState(() {
                        seciliCinsiyet = "ERKEK";
                      });
                    },
                    renk: seciliCinsiyet == "ERKEK"
                        ? Colors.blueGrey
                        : Colors.white,
                    child: IconCinsiyet(
                      icon: FontAwesomeIcons.mars,
                      cinsiyet: "ERKEK",
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                fixedSize: MaterialStateProperty.all(Size.fromHeight(50))),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                UserData(kilo: kilo,boy: boy,seciliCinsiyet: seciliCinsiyet,sporSayisi: sporSayisi,icilenSigara: icilenSigara),
              )));
            },
            child: Text("HESAPLA", style: kMetinStili),
          )
        ],
      ),
    );
  }

  Row newOutlineButton(String yazi) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RotatedBox(
          //içindekini belirli açıyla döndüren widgettir
          quarterTurns: 3, //çeyrek derecelik dönüş(1 tane 90 derecelik dönüş)
          child: Text(yazi, style: kMetinStili),
        ),
        SizedBox(width: 25),
        RotatedBox(
          quarterTurns: 3,
          child: Text(yazi == "BOY" ? "$boy" : "$kilo", style: kSayiStili),
        ),
        SizedBox(width: 25),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      color: Colors.lightBlue), //buton kenarlık rengi
                ),
                child: Icon(FontAwesomeIcons.plus, size: 20),
                onPressed: () {
                  setState(() {
                    yazi == "BOY" ? boy++ : kilo++;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.lightBlue),
                ),
                child: Icon(FontAwesomeIcons.minus, size: 20),
                onPressed: () {
                  setState(() {
                    yazi == "BOY" ? boy-- : kilo--;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
