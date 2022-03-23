import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled3/kisidetay.dart';
import 'package:untitled3/kisiler.dart';
import 'package:untitled3/kisilerdao.dart';

import 'kisiekle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool aramaYapiliyorMu = false;
  String aramaKelimesi = "";
  var tfCont = TextEditingController();


  Future <void> kisiSil(int kisi_id) async
  {
   await kisilerdao().kisiSil(kisi_id);
   setState(() {});
  }


  Future <List<kisiler>> tumKisileriGoster() async
  {

   var kisilerListesi = await kisilerdao().tumKisiler();

    return kisilerListesi;
  }

  Future <List<kisiler>> arananKisi(String arananKisi) async
  {
    var kisilerListesi = await kisilerdao().kisiAra(arananKisi);

    return kisilerListesi;
  }


  Future <void> Exit() async
  {
    await exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.exit_to_app),
        onTap: ()
        {
          Exit();
        },
        ),
        title:

        aramaYapiliyorMu ? TextField(
          controller: tfCont,
          decoration: InputDecoration(
            hintText: "Arama için birşey yazın.",
          ),
          onChanged: (aramaSonucu)
          {
            setState(() {
              aramaKelimesi = tfCont.text;
            });
            print(aramaKelimesi);
          },


        ):Text("Rehber"),
        actions: [
          aramaYapiliyorMu ?

          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: ()
            {
              setState(() {
                aramaYapiliyorMu = false;
                aramaKelimesi="";
              });
            },
          ) :
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()
            {
              setState(() {
                aramaYapiliyorMu = true;
              });
            },
          ),
        ],
      ),

       // Text("Rehber"),


      body: WillPopScope(
        onWillPop: ()
        {
          return exit(0);
        },
        child: FutureBuilder<List<kisiler>>(
          future: aramaYapiliyorMu ? arananKisi(aramaKelimesi) : tumKisileriGoster(),
          builder: (context,snaphot)
          {

            if(snaphot.hasData)
            {
              var kisiListesi = snaphot.data;
              return ListView.builder(
                  itemCount:kisiListesi!.length,
                  itemBuilder: (context,indeks)
                  {
                    var kisiler = kisiListesi[indeks];
                    return GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => kisilerDetay(kisiler)));
                      },
                      child: SizedBox(
                        height: 60,
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(kisiler.kisi_ad, style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("${kisiler.tel_no}"),
                             IconButton(
                               icon: Icon(Icons.delete, color: Colors.black45,),
                               onPressed: ()
                               {
                                 kisiSil(kisiler.kisi_id);
                               },
                             ),
                             // Text("${kisiler.not2}"),

                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            else return Center();
          },

        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => kisilEkle()));
        },
        tooltip: 'Yeni Kayıt',
        child: const Icon(Icons.add),
      ),
    );
  }
}
