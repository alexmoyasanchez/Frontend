import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Map/ui/pages/home/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  Future<void> _checkPermission() async {
    final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    final isGpsOn = serviceStatus == ServiceStatus.enabled;
    if (!isGpsOn) {
      print('Turn on location services before requesting permission.');
      return;
    }

    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      print('Permission granted');
    } else if (status == PermissionStatus.denied) {
      print(
          'Permission denied. Show a dialog and again ask for the permission');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Take the user to the settings page.');
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _checkPermission,
          child: Text('Check Permission'),
        ),
      ),
    );
  }
}

class MapScreen2 extends StatelessWidget {
  MapScreen2({Key key}) : super(key: key);

  //final _controller = HomeController();

  List<String> latitud = [];
  List<String> longitud = [];

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
              myLocationEnabled: true,
              mapType: MapType
                  .normal, //Tipo de mapa que queremos mostrar: Terrain, normal ...
              markers: controller.markers,
              onTap: controller.alex(),
            ),
          ),
        ));
  }
}


class MapScreen3 extends StatelessWidget {
  MapScreen3({Key key}) : super(key: key);

  //final _controller = HomeController();

  List<String> latitud = [];
  List<String> longitud = [];

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
              onMapCreated: controller.onMapCreatedNuevoBar,
              initialCameraPosition: controller.initialCameraPosition,
              myLocationButtonEnabled: true,
              //scrollGesturesEnabled: false, //Para no poder mover el mapa
              zoomControlsEnabled: true,
              compassEnabled: true,
              myLocationEnabled: true,
              mapType: MapType
                  .normal, //Tipo de mapa que queremos mostrar: Terrain, normal ...
              markers: controller.markers,
              onTap: controller.onTap,
            ),
          ),
        ));
  }
}