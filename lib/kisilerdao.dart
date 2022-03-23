

import 'package:untitled3/kisiler.dart';

import 'VeritabaniYardimcisi.dart';


class kisilerdao
{

  Future <List<kisiler>> tumKisiler () async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler");

    var kisiler_list = <kisiler>[];
    kisiler_list.clear();
    for(var m in maps)
      {kisiler_list.add(kisiler(int.parse(m["kisi_id"].toString()),m["kisi_ad"].toString(),m["kisi_tel"].toString()));}

  return kisiler_list;


  }




  Future <List<kisiler>> kisiAra (String arananKelime) async
  {

    var db = await VeriTabaniYardimcisi.veriTabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_ad like '%$arananKelime%'");

    var kisiler_list = <kisiler>[];
    kisiler_list.clear();
    for(var m in maps)
    {kisiler_list.add(kisiler(int.parse(m["kisi_id"].toString()),m["kisi_ad"].toString(),m["kisi_tel"].toString()));}

    return kisiler_list;
  }


  Future <void> kisiSil (int kisi_id) async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();

    db.delete("kisiler",where: "kisi_id=?",whereArgs: [kisi_id]);
  }



  Future <void> kisiEkle (String kisiAdi, String kisiTel) async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();
    // List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM notlar");

    var bilgiler = Map<String,dynamic>();

    bilgiler["kisi_ad"] = kisiAdi;
    bilgiler["kisi_tel"] = kisiTel;


    db.insert("kisiler", bilgiler);
  }


  Future <void> kisiGuncelle (int kisi_id,String kisiAdi, String kisiTel) async
  {
    var db = await VeriTabaniYardimcisi.veriTabaniErisim();


    var bilgiler = Map<String,dynamic>();

    bilgiler["kisi_ad"] = kisiAdi;
    bilgiler["kisi_tel"] = kisiTel;

    db.update("kisiler", bilgiler,where: "kisi_id=?",whereArgs: [kisi_id]);
  }




}


