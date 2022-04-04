import 'dart:math';

import 'package:flutter/material.dart';
class Anasayfadayim extends StatefulWidget {
  const Anasayfadayim({Key? key}) : super(key: key);

  @override
  _AnasayfadayimState createState() => _AnasayfadayimState();
}

class _AnasayfadayimState extends State<Anasayfadayim>with TickerProviderStateMixin {
  late AnimationController kontrol;
  late Animation<double> degerler,degerler2,degerler3;
  @override
  void initState() {
    // TODO: implement
    super.initState();
    kontrol=AnimationController(vsync:this,duration: Duration(milliseconds: 3000) );
    degerler=Tween(begin: 10.0,end: 100.0).animate(kontrol)..addListener(() {
      setState(() {

      });
    });

    degerler2=Tween(begin: 0.0,end:3*pi/2).animate(kontrol)..addListener(() {
      setState(() {

      });
    });


    degerler3=Tween(begin: 0.0,end:50.0).animate(CurvedAnimation(parent: kontrol, curve: Curves.bounceInOut))..addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animasyon"),),
      body: Center(child: Column(children: [
        Opacity(child: Icon(Icons.add,size: degerler.value,),opacity:1,),
        ElevatedButton(onPressed: (){
          //kontrol.forward();
          kontrol.repeat(reverse: true);
        }, child: Text("Animasyon")),
        Transform.translate(offset:Offset(degerler3.value,degerler3.value),child: Text("Mobil büt")),

      ],),),
    );
  }
}
