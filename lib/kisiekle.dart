import 'package:flutter/material.dart';
import 'package:untitled3/kisilerdao.dart';


import 'main.dart';

class kisilEkle extends StatefulWidget {





  @override
  State<kisilEkle> createState() => _kisilEkleState();
}

class _kisilEkleState extends State<kisilEkle> {


  var kisi_ad = TextEditingController();
  var tel_no = TextEditingController();
 // var tfNot2 = TextEditingController();



  Future <void> kisiEkle (String kisiAdi, String kisiTel) async
  {
    await kisilerdao().kisiEkle(kisiAdi, kisiTel);
  }


/*
  Future<void> sil(int not_id) async
  {
    await Notlardao().notSil(not_id);
    print('Ders silindi');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }


  Future<void> guncelle(int not_id,String dersAdi, int not1, int not2) async
  {
    await Notlardao().notGuncelle(not_id, dersAdi, not1, not2);
    print('Ders adı: $dersAdi, Not 1: $not1, Not 2: $not2 güncellendi.');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tfDersAdi.text = widget.not.ders_adi;
    tfNot1.text = widget.not.not1.toString();
    tfNot2.text = widget.not.not2.toString();
  }
 */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişi Ekle"),



      ),
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0,right: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                TextField(
                  controller: kisi_ad,
                  decoration: InputDecoration(hintText: "Ad ve Soyad"),

                ),

                TextField(
                  controller: tel_no,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(hintText: "Telefon Numarası"),
                ),


              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        tooltip: "Kayıt Ekle",
        icon: Icon(Icons.save),
        label: Text("Kaydet"),
        onPressed: ()
        {

         if(kisi_ad.text != "" && tel_no.text != "")
           {
             kisiEkle(kisi_ad.text,tel_no.text);
           }


          //kisilEkle(kisi_ad.toString(),tel_no);
         // kayit(tfDersAdi.text, int.parse(tfNot1.text), int.parse(tfNot2.text));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
          // Navigator.pop(context);
        },

      ),

    );
  }
}
