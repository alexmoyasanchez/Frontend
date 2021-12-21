// Controlador para estilos de google MAP

import 'dart:async';

import 'package:flutter/cupertino.dart' show ChangeNotifier;
import 'package:flutter_auth/Screens/BarList/BarList_screen.dart';
import 'package:flutter_auth/Screens/Map/ui/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/BarList/components/body.dart';

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

  void createMarkers(int num) {
    final id = _markers.length.toString();
    //final markerId = MarkerId(id);
    LatLng pepe =
        new LatLng(41.2745368, 1.9834524); //Residencia universitaria EETAC
    LatLng pepe2 =
        new LatLng(41.279730, 1.983748); //Residencia universitaria EETAC
    LatLng pepe3 =
        new LatLng(41.2735649, 1.9799459); //Residencia universitaria EETAC
    LatLng pepe4 =
        new LatLng(41.2724051, 1.9721655); //Residencia universitaria EETAC
    List marcadores = [pepe, pepe2, pepe3, pepe4];

    for (int i = 0; i < num; i++) {
      final markerId = MarkerId(i.toString());
      BuildContext context;
      AsyncSnapshot snapshot;
      final marker = Marker(
          markerId: markerId,
          position: (marcadores[i]), //(position)
          infoWindow: InfoWindow(
            title: ("¿¿¿ Quieres algo más Angel ???"),
            snippet: ("Aqui lo del cuerpo"),
            onTap: () {
              getBares();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => DetailPage(snapshot.data[1])));
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
    createMarkers(4);
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
}
