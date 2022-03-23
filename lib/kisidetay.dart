import 'package:flutter/material.dart';
import 'package:untitled3/kisiler.dart';


import 'kisilerdao.dart';
import 'main.dart';

class kisilerDetay extends StatefulWidget {

  kisiler kisi;


  kisilerDetay(this.kisi);


  Future <void> kisiGuncelle (int kisiId, String kisiAdi, String kisiTel) async
  {
    await kisilerdao().kisiGuncelle(kisiId,kisiAdi, kisiTel);
  }


  /*
   Notlar not;

  NotDetaySayfa({ required this.not});
   */



  @override
  State<kisilerDetay> createState() => _kisilerDetayState();
}

class _kisilerDetayState extends State<kisilerDetay> {


  var kisi_ad = TextEditingController();
  var tel_no = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kisi_ad.text = widget.kisi.kisi_ad;
    tel_no.text = widget.kisi.tel_no;
   // tfNot2.text = widget.not.not2.toString();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişi Detay"),

       /*
        actions: [
          TextButton(onPressed: ()
          {
            sil(widget.not.not_id);
          }, child: Text("Sil",style: TextStyle(color: Colors.white),)),

          TextButton(onPressed: ()
          {
            guncelle(widget.not.not_id, tfDersAdi.text, int.parse(tfNot1.text), int.parse(tfNot2.text));
          }, child: Text("Güncelle",style: TextStyle(color: Colors.white))),
        ],
        */

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
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Telefon Numarası"),
                ),

              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        tooltip: "Güncelle",
        icon: Icon(Icons.update),
        label: Text("Güncelle"),
        onPressed: ()
        {
          if(kisi_ad.text != "" && tel_no.text != "")
          {
            widget.kisiGuncelle(widget.kisi.kisi_id, kisi_ad.text, tel_no.text);
          }

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
          // Navigator.pop(context);
        },

      ),

    );
  }
}
