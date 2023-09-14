import 'package:life/user_data.dart';

class Hesap{

  UserData _userData;
  Hesap(this._userData);

  double hesaplama(){
    double sonuc;

    sonuc= _userData.sporSayisi - _userData.icilenSigara;
    sonuc=90+sonuc+(_userData.boy/_userData.kilo);

    if(_userData.seciliCinsiyet=="KADIN") {
      return sonuc+3;
    }
    else{return sonuc;}
    }


  }

