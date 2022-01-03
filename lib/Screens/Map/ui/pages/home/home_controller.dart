// Controlador para estilos de google MAP

import 'dart:async';

import 'package:flutter/cupertino.dart' show ChangeNotifier;
import 'package:flutter_auth/Screens/BarList/barlist_screen.dart';
import 'package:flutter_auth/Screens/Map/ui/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/BarList/components/body.dart';
import 'dart:math';

class Vectores {}

class HomeController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  final _markersController = StreamController<String>.broadcast();

  Stream<String> get onMarkerTap => _markersController.stream;

  final initialCameraPosition = const CameraPosition(
    target: LatLng(41.2756656, 1.9859211), //EETAC: 41.2756656,1.9859211
    zoom: 15,
  );

  void onMapCreatedyeah(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  double getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
    //Me da la distancia en kilometros
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = R * c; // Distance in km
    return d;
  }

  double deg2rad(deg) {
    return deg * (pi / 180);
  }

  void createMarkers(int num, double distancia, bool reducir) {
    final id = _markers.length.toString();
    //final markerId = MarkerId(id);
    LatLng pepe =
        new LatLng(41.2745368, 1.9834524); //Residencia universitaria EETAC  
        /*
    LatLng pepe2 =
        new LatLng(41.279730, 1.983748); //Residencia universitaria EETAC
      
    LatLng pepe3 =
        new LatLng(41.2735649, 1.9799459); //Residencia universitaria EETAC
    LatLng pepe4 =
        new LatLng(41.2724051, 1.9721655); //Residencia universitaria EETAC
        */
    LatLng pepe5 =
        new LatLng(41.3470487, 2.0389436); //Residencia universitaria EETAC

    //List marcadores = [pepe, pepe2, pepe3, pepe4, pepe5];
    List marcadores = [pepe, pepe5];
    List nearMarcadores = [];


    if (reducir) {
      for (int j = 0; j < marcadores.length; j++) {
        if (getDistanceFromLatLonInKm(
                initialCameraPosition.target.latitude.toDouble(),
                initialCameraPosition.target.longitude.toDouble(),
                marcadores[j].latitude.toDouble(),
                marcadores[j].longitude.toDouble()) <
            distancia) {
          LatLng aux = new LatLng(marcadores[j].latitude,
              marcadores[j].longitude);
          nearMarcadores.add(aux);
        }
      }
    }
    else{
      nearMarcadores = marcadores;
    }

    for (int i = 0; i < num; i++) {
      final markerId = MarkerId(i.toString());
      BuildContext context;
      AsyncSnapshot snapshot;
      final marker = Marker(
          markerId: markerId,
          position: (nearMarcadores[i]), //(position)
          infoWindow: InfoWindow(
            title: ("Distancia"),
            snippet: ("Aqui lo del cuerpo"),
            onTap: () {
              getBares();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => DetailPage(
                          snapshot.data[1]))); //ver si se puede solucionar
            },
          ),
          onTap: () {
            _markersController.sink.add(i.toString());
            //Console.log(i);
          });
      _markers[markerId] = marker;
      notifyListeners();
    }
  }

  void onTap(LatLng position) {
    createMarkers(2, 5.0, true);
    //nearMarkers(5);
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
}
