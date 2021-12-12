// Controlador para estilos de google MAP

import 'dart:async';

import 'package:flutter/cupertino.dart' show ChangeNotifier;
import 'package:flutter_auth/Screens/Map/ui/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends ChangeNotifier{
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
<<<<<<< HEAD

=======
 
>>>>>>> ff653479084db4ef07b53571cdbea76f9f6149f6


  void onTap(LatLng position) {
    final id = _markers.length.toString();
    final markerId = MarkerId(id);
    LatLng pepe = new LatLng(41.2745368,1.9834524); //Residencia universitaria EETAC
    final marker = Marker(
      markerId: markerId,
      position: (pepe), //(position)
      onTap: (){
        _markersController.sink.add(id);
      }
    );
    _markers[markerId] = marker;
    notifyListeners();
  }


  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
} 
