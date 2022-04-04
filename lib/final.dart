import 'dart:async';
import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Translate extends StatefulWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  
  @override
  Widget build(BuildContext context) {
    TextEditingController kelimeKontroller=TextEditingController();
    TextEditingController ingTextController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("ÇEVİRİ"),
      ),
      body:Center(
        child: Column(
          children: [
            Container(width: 200,child: TextField(
              controller: kelimeKontroller,decoration:InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
            )),
            ElevatedButton(onPressed: ()async{
              Database db;
              Directory veritabani=await getApplicationDocumentsDirectory();
              String veritabaniYolu=join(veritabani.path,"kelimeler.sqlite");
              var database=openDatabase(veritabaniYolu,onCreate: dbOlustur,version: 1);
              db=await database;
            }, child: Text("DB oluştur ve kayıt")),

            ElevatedButton(onPressed: ()async{
              Database db;
              Directory klasor= await getApplicationDocumentsDirectory();
              String veritabaniYolu=join(klasor.path,"kelimeler.sqlite");
              if(await databaseExists(veritabaniYolu)){
              print("veritabanı var");
              var database=openDatabase(veritabaniYolu);
              db=await database;
              List<Map<String,dynamic>> gelen =await db.query("kelimeler",where: "trhali= ?",whereArgs: [kelimeKontroller.text]);
              if(gelen.length>=1){
                List.generate(gelen.length, (index) => print("${gelen[index]["inghali"]}"));
                List.generate(gelen.length, (index) =>ingTextController.text=gelen[index]["inghali"]);
              }else ingTextController.text="Aranan kelime yok";

              }else print("veritabanı yok");
            }, child: Text("Çevir")),
            Container(width: 200,child: TextField(enabled: false,controller: ingTextController,)),

          ],
        ),
      ),
    );
  }

  FutureOr<void> dbOlustur(Database db, int version)async {
    await db.rawQuery("CREATE TABLE kelimeler(id INTEGER PRIMARY KEY AUTOINCREMENT, trhali text,inghali text )");
    var veriler=Map<String,dynamic>();
    veriler["trhali"]="merhaba";
    veriler["inghali"]="hello";
    await db.insert("kelimeler", veriler);
    veriler["trhali"]="bir";
    veriler["inghali"]="one";
    await db.insert("kelimeler", veriler);
    veriler["trhali"]="iki";
    veriler["inghali"]="two";
    await db.insert("kelimeler", veriler);
    veriler["trhali"]="üç";
    veriler["inghali"]="three";
    await db.insert("kelimeler", veriler);
    veriler["trhali"]="dört";
    veriler["inghali"]="four";
    await db.insert("kelimeler", veriler);



  }
}
