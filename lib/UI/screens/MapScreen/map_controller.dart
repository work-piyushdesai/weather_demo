import 'dart:async';
import 'dart:developer' as log;
import 'dart:math';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends GetxController{

  List<MapLocation> positions = [
    MapLocation(placeName: "Surat", latLng: const LatLng(21.170240, 72.831062)),
    MapLocation(placeName: "Ahmedabad", latLng: const LatLng(23.022505, 72.571365)),
    MapLocation(placeName: "GandhiNagar", latLng: const LatLng(23.215635, 72.636940)),
    MapLocation(placeName: "Vadodara", latLng: const LatLng(22.307159, 73.181221)),
    MapLocation(placeName: "Delhi", latLng: const LatLng(28.6517178, 77.2219388)),
    MapLocation(placeName: "Bombay", latLng: const LatLng(19.0785451, 72.878176)),

  ];


  Future getLocation() async {
    Location location = Location();
    LocationData pos = await location.getLocation();
  LatLng latlng=   LatLng(pos.latitude!.toDouble(),pos.longitude!.toDouble());
    log.log("message: $pos");
    return latlng;

  }

  Completer<GoogleMapController> completer = Completer();
  BitmapDescriptor? markerBitmap;

   final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(21.170240, 72.831062),
  );


  Set<Marker> markers = {};
  MapType currentMapType = MapType.normal;


  Map<Marker, MapLocation> markedPlaces = <Marker, MapLocation>{};

  LatLngBounds getBounds() {
    var lngs = positions.map<double>((m) => m.latLng!.longitude).toList();
    var lats = positions.map<double>((m) => m.latLng!.latitude).toList();

    double topMost = lngs.reduce(max);
    double leftMost = lats.reduce(min);
    double rightMost = lats.reduce(max);
    double bottomMost = lngs.reduce(min);

    LatLngBounds bounds = LatLngBounds(
      northeast: LatLng(rightMost, topMost),
      southwest: LatLng(leftMost, bottomMost),
    );

    return bounds;
  }


 @override
  void onInit() {

log.log("longitude: ${getLocation()}");

   markers = Set.from(
     positions.map((e) => Marker(
         icon: BitmapDescriptor.defaultMarker,
         markerId: MarkerId('${e.latLng!.latitude} - ${e.latLng!.longitude}'),
         position: LatLng(e.latLng!.latitude, e.latLng!.longitude),
       infoWindow: InfoWindow(
         onTap: (){
           log.log("onTap");
           Get.back(result: MapLocation(placeName: e.placeName, latLng: e.latLng));
         },
           title: e.placeName,
           snippet: '${e.latLng!.latitude} - ${e.latLng!.longitude}',
       )
       ),
     )
         .toList(),
   );

   for(MapLocation e in positions) {
     final marker = Marker(
         icon: BitmapDescriptor.defaultMarker,
         markerId: MarkerId('${e.latLng!.latitude} - ${e.latLng!.longitude}'),
         position: LatLng(e.latLng!.latitude, e.latLng!.longitude),
         infoWindow: InfoWindow(
           title: e.placeName,
           snippet: '${e.latLng!.latitude} - ${e.latLng!.longitude}',

         )
     );

     markedPlaces[marker] = e;
   }
    super.onInit();
  }
}

class MapLocation{
  final String? placeName;
  final LatLng? latLng;

  MapLocation({
     this.placeName,
     this.latLng
});
}