import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Anasayfam extends StatefulWidget {
  const Anasayfam({Key? key}) : super(key: key);

  @override
  _AnasayfamState createState() => _AnasayfamState();
}

class _AnasayfamState extends State<Anasayfam> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Anasayfa"),
    ),
      body: Center(child: Column(
        children: [
          ElevatedButton(onPressed: ()async{
            print("Kaydet bölümü");
            Database db;
            Directory klasor= await getApplicationDocumentsDirectory();
            String veritabaniYolu=join(klasor.path,"kisi.sqlite");
            if(await databaseExists(veritabaniYolu)){
              print("veritabanı var");
              var database=openDatabase(veritabaniYolu);
              db=await database;
            }else{
              print("veritabanı yok yeni oluşturulacak");
              var database=openDatabase(veritabaniYolu,onCreate: dbOlustur,version: 1);
              db=await database;
            }

            var veriler=Map<String,dynamic>();
            veriler["ad"]="Yunus";
            veriler["tel"]=123;
            await db.insert("kisiler", veriler);

          }, child: Text("kaydet")),


          ElevatedButton(onPressed: ()async{
            print("göster bölümü");
            Database db;
            Directory klasor= await getApplicationDocumentsDirectory();
            String veritabaniYolu=join(klasor.path,"kisi.sqlite");
            if(await databaseExists(veritabaniYolu)){
              print("veritabanı var");
              var database=openDatabase(veritabaniYolu);
              db=await database;
              List<Map<String,dynamic>> gelen =await db.rawQuery("select * from kisiler");
              List.generate(gelen.length, (index) => print("${gelen[index]["id"]} ${gelen[index]["ad"]} ${gelen[index]["tel"]}",),);
            }else print("veritabanı yok");

          }, child: Text("göster")),


          ElevatedButton(onPressed: ()async{
            print("sil bölümü");


          }, child: Text("sil")),
        ],
      ),),
    );
  }

  FutureOr<void> dbOlustur(Database db, int version)async {
    await db.execute("Create table kisiler(id INTEGER PRIMARY KEY AUTOINCREMENT , ad TEXT ,tel INTEGER)");
  }
}
