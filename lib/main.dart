import 'package:flutter/material.dart';
import 'package:sinav_calisma/anasafya.dart';
import 'package:sinav_calisma/anasayfa2.dart';
import 'package:sinav_calisma/final.dart';
import 'package:sinav_calisma/googlemaps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GoogleMaps(),
    );
  }
}
class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  String yazi="";
  bool durum=true;
  double durum2=1;
  var secilenToggle=[true,true,true];
  int secilenSayfa=0;
  var sayfaListesi=[Sayfa1(),Sayfa2()];
  TextEditingController? textfieldControlleri=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formkeyi=GlobalKey<FormState>();
    return DefaultTabController(length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sınava hazırlık"),
          bottom: TabBar(tabs: [
            Text("safya1"),Tab(text: "sayfa2",),Icon(Icons.add)
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "Sayfa1"),
          BottomNavigationBarItem(icon: Icon(Icons.pets_outlined),label: "Sayfa2"),
        ],currentIndex: secilenSayfa,onTap: (index){
          setState(() {
            secilenSayfa=index;
          });
        },),
        body:sayfaListesi[secilenSayfa]
        /*
        Column(
          children: [
            TextField(
              controller:textfieldControlleri,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              onChanged: (String? deger){
                setState(() {
                });
              },
            ),

            Form(key: formkeyi,
              child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "hebelerx",
                  hintText: "bu da hebelerx",

                ),
                onSaved: (deger){
                  //print(deger);
                  yazi=deger!;
                },
                controller: textfieldControlleri,
                onChanged: (deger){
                  //print(deger);
                },
              ),
                ElevatedButton(onPressed: (){
                  formkeyi.currentState!.save();
                  print(yazi);
                }, child: Text("Kaydet"))
            ],),),
            SwitchListTile(
            title: Text("durum"),
            activeColor: Colors.green,inactiveThumbColor: Colors.red
            ,value: durum, onChanged: (secim){
              setState(() {
                durum=secim;
                print(durum);
              });
            }),
            Slider(min: 0,max: 100,
                divisions: 100,
                value: durum2, onChanged: (deger){
              setState(() {
                durum2=deger;
                print(deger);
              });
            }),
            ElevatedButton(onPressed: (){
              showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) => print("${value!.hour} : ${value.minute} "));
            }, child: Text("sat")),
            ElevatedButton(onPressed: (){
              DateTime tarih=DateTime.now();
              showDatePicker(context: context, initialDate: tarih, firstDate: DateTime(2020), lastDate: DateTime(2023)).then((value) => print(value));
            }, child: Text("tarih")),
            ToggleButtons(children: [
              Icon(Icons.add),
              Icon(Icons.medical_services),
              Icon(Icons.account_box),
            ], isSelected:secilenToggle,onPressed: (index){
              setState(() {
                secilenToggle[index]=!secilenToggle[index];
              });
            },)

          ],
        ),
        */
      ),
    );
  }
}
class Sayfa1 extends StatelessWidget {
  const Sayfa1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("safya1"),),
    );
  }
}
class Sayfa2 extends StatelessWidget {
  const Sayfa2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("safya2"),),
    );
  }
}
class Sayfa3 extends StatelessWidget {
  const Sayfa3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("safya3"),),
    );
  }
}



