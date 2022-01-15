// Controlador para estilos de google MAP

import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart' show ChangeNotifier;
import 'package:flutter_auth/Screens/BarList/BarList_screen.dart';
import 'package:flutter_auth/Screens/Map/ui/utils/map_style.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/models/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/Screens/BarList/components/body.dart';
import 'dart:math';

class Vectores {}

Future<void> getBares() async {
  latitudes = [];
  nombresBares = [];
  descripcionesBares = [];

  print("latitud al principio de getbares : ");
  print(latitudes);

  longitudes = [];
  List<Bar> bares = [];
  final data = await http.get(Uri.parse('http://10.0.2.2:3000/bares/'));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    print(data.body);
    Bar bar = Bar(
        id: u["id"],
        name: u["name"],
        address: u["address"],
        musicTaste: u["musicTaste"],
        owner: u["owner"],
        idOwner: u["idOwner"],
        aforo: u["aforo"],
        aforoMax: u["aforoMax"],
        horario: u["horario"],
        descripcion: u["descripcion"],
        imageUrl: u["imageUrl"],
        agresion: u["agresion"],
        idUserAgresion: u["idUserAgresion"],
        motivacionAgresion: u["motivacionAgresion"],
        descAgresion: u["descAgresion"],
        solAgresion: u["solAgresion"],
        longitud: u["longitud"],
        latitud: u["latitud"]);

    latitudes.add(bar.latitud);
    longitudes.add(bar.longitud);
    nombresBares.add(bar.name);
    descripcionesBares.add(bar.descripcion);

    bares.add(bar);
    print(bares);
  }
  print("bares length es : ");
  print(bares.length);

  print("latitud es : ");
  print(latitudes);
}

class HomeController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  final _markersController = StreamController<String>.broadcast();

  Stream<String> get onMarkerTap => _markersController.stream;

  final initialCameraPosition = const CameraPosition(
    target: LatLng(41.2756656, 1.9859211), //EETAC: 41.2756656,1.9859211
    zoom: 15,
  );

  void onMapCreatedyeah(GoogleMapController controller) async {
    await getBares();
    createMarkers2(latitudes.length, latitudes, longitudes);

    //controller.setMapStyle(mapStyle);
  }

  void onMapCreatedNuevoBar(GoogleMapController controller) async {
    //controller.setMapStyle(mapStyle);
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

  void createMarkers2(int num, List<String> lat, List<String> lon) async {
    //num =num bares //reducir fuera

    //await getBares();

    //List nearMarcadores = [];
    List prueba = [];

    for (int i = 0; i < num; i++) {
      //me da una lista de LatLng
      LatLng pepito = new LatLng(double.parse(lat[i]), double.parse(lon[i]));
      prueba.add(pepito);
      print("esto es pepito");
      print(pepito);

      //prueba.add(new LatLng (double.parse(latitudes[i]), double.parse(longitudes[i])));
    }

    print("Esto es prueba:");
    print(prueba);

    print("Esto es latitudes:");
    print(latitudes);

    for (int i = 0; i < num; i++) {
      final markerId = MarkerId(i.toString());
      BuildContext context;
      AsyncSnapshot snapshot;
      print("este es el marker: ");
      print(i);
      final marker = Marker(
          markerId: markerId,
          position: prueba[i], //(prueba[i]), //(position)
          infoWindow: InfoWindow(
            title: (nombresBares[i].toString()),
            snippet: (descripcionesBares[i].toString()),
            onTap: () {
              //getBares();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => DetailPage(
                          snapshot.data[1]))); //ver si se puede solucionar
            },
          ),
          onTap: () {
            _markersController.sink.add(i.toString());
            print("marker colocado");
          });
      _markers[markerId] = marker;
      notifyListeners();
    }
  }

  void createMarkers() {
    final id = _markers.length.toString();
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

    List marcadores = [pepe, pepe5];
    List nearMarcadores = [];
    List prueba = [];

    final markerId = MarkerId(id);
    BuildContext context;
    AsyncSnapshot snapshot;
    final marker = Marker(
        markerId: markerId,
        position: (nearMarcadores[1]), //(position)
        infoWindow: InfoWindow(
          title: ("Distancia"),
          snippet: ("Aqui lo del cuerpo"),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => DetailPage(
                        snapshot.data[1]))); //ver si se puede solucionar
          },
        ),
        onTap: () {
          _markersController.sink.add(id.toString());
          //Console.log(i);
        });
    _markers[markerId] = marker;
    notifyListeners();
  }

  alex() {
    //getBares();
    //createMarkers2(latitudes.length, latitudes, longitudes);
  }

  void onTap(LatLng position) {
    final id = _markers.length.toString();

    final markerId = MarkerId(id);
    BuildContext context;
    AsyncSnapshot snapshot;
    latitud = position.latitude.toString();
    longitud = position.longitude.toString();

    if (_markers.length >= 1) {
      _markers.clear();
      latitud = "";
      longitud = "";
    }

    final marker = Marker(
        markerId: markerId,
        position: position, //(position)
        infoWindow: InfoWindow(
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => DetailPage(
                        snapshot.data[1]))); //ver si se puede solucionar
          },
        ),
        onTap: () {
          print(_markers.length);

          _markersController.sink.add(id
              .toString()); //          _markersController.sink.add(id.toString());
          //Console.log(i);
        });
    _markers[markerId] = marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
}
