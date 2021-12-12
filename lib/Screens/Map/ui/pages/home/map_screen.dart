import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Map/ui/pages/home/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {

  const MapScreen({Key key}) : super (key: key);

  //final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
        create: (_) {
          final controller = HomeController();
          controller.onMarkerTap.listen((String id) {
            print("go to $id");
          });
          return controller;
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Consumer<HomeController>(
            builder: (_, controller, __) => GoogleMap(
              onMapCreated: controller.onMapCreatedyeah,
              


              initialCameraPosition: controller.initialCameraPosition,
              myLocationButtonEnabled: true,
              //scrollGesturesEnabled: false, //Para no poder mover el mapa
              zoomControlsEnabled: true,
              compassEnabled: true,
              mapType: MapType
                  .normal, //Tipo de mapa que queremos mostrar: Terrain, normal ...
              markers: controller.markers,
              onTap: controller.onTap,
            ),
          ),
        ));
  }
}