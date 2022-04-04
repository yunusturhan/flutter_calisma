import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sinav_calisma/anasayfa2.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  double enlem = 0.0, boylam = 0.0;
  Completer<GoogleMapController> haritaKontrol = Completer();
  var ilkKonum =
      CameraPosition(target: LatLng(38.7412482, 26.1844276), zoom: 4);
  static const _initialCamerPosition =
      CameraPosition(target: LatLng(37.773972, -122.431297), zoom: 11.5);

  GoogleMapController? _googleMapController;
  Marker? _origin;
  Marker? _destination;

  @override
  void dispose() {
    // TODO: implement dispose
    _googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harita"),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCamerPosition,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (controller) => _googleMapController = controller,
        markers: {
          if(_origin!=null) _origin!,
          if(_destination!=null) _destination!
        },
        onLongPress: _addMarker,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _googleMapController!.animateCamera(
            CameraUpdate.newCameraPosition(_initialCamerPosition)),
      ),

      /* Center(
        child: Column(
          children: [
           /* ElevatedButton(onPressed: ()async{

              var konum= await Geolocator.getCurrentPosition( desiredAccuracy:LocationAccuracy.best);
              enlem=konum.latitude;
              boylam=konum.longitude;

              setState(() {
              });
            }, child: Text("Konum al")),
            SizedBox(width: 400,height: 300,
            child: GoogleMap(initialCameraPosition: ilkKonum,mapType: MapType.normal,myLocationEnabled: true,onMapCreated: (GoogleMapController controller){
              haritaKontrol.complete(controller);
            },),),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Anasayfadayim()));
            }, child: Text("git"))
*/

          ],
        ),
      ),*/
    );
  }

  void _addMarker(LatLng pozisyon) {
    if(_origin==null || (_origin!=null && _destination !=null )){
      setState(() {
        _origin=Marker(
          markerId:const MarkerId("bas"),
          infoWindow: const InfoWindow(title: "Başlangıç"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pozisyon
        );
        _destination=null;
      });
    }
    else{

      setState(() {
        _destination=Marker(
            markerId:const MarkerId("son"),
            infoWindow: const InfoWindow(title: "Son"),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            position: pozisyon
        );
      });

    }
  }
}
