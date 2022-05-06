// ignore_for_file: prefer_collection_literals

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_demo/UI/screens/MapScreen/map_controller.dart';

class MapScreen extends GetView<MapController> {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: controller.kGooglePlex,
        onMapCreated: onMapCreated,
          onTap: onMapTypeButtonPressed(),
          myLocationEnabled: true,
        markers: controller.markers
      ),
    );
  }

  onMapTypeButtonPressed() {
    controller.currentMapType = controller.currentMapType == MapType.normal
        ? MapType.satellite
        : MapType.normal;
  }

  void onMapCreated(GoogleMapController googleMapController) {

    controller.completer.complete(googleMapController);


    _zoomToFitPlaces(
        places: controller.markedPlaces.values.toList(),
        currentLatitude: controller.kGooglePlex.target.latitude,
        currentLongitude: controller.kGooglePlex.target.longitude);


  }

  Future<void> _zoomToFitPlaces(
      {required List<MapLocation> places,
        required double currentLatitude,
        required double currentLongitude}) async {
    GoogleMapController googleMapController = await controller.completer.future;

    double minLat = currentLatitude;
    double maxLat = currentLatitude;
    double minLong = currentLongitude;
    double maxLong = currentLongitude;

    for (MapLocation place in places) {
      minLat = min(minLat, place.latLng!.latitude);
      maxLat = max(maxLat, place.latLng!.latitude);
      minLong = min(minLong, place.latLng!.longitude);
      maxLong = max(maxLong, place.latLng!.longitude);
    }

    await googleMapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(minLat, minLong),
          northeast: LatLng(maxLat, maxLong),

        ),
        48.0,
      ),
    );
  }
}
