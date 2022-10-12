import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/const.dart';

import 'detilsUser.dart';
import 'package:geolocator/geolocator.dart';


const LatLng DEST_LOCATION = LatLng(15.602175517333906, 32.58652310818434);
const double CAMERA_ZOOM = 14;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class DriverMapScreen extends StatefulWidget {
  @override
  _DriverMapScreenState createState() => _DriverMapScreenState();
}

Completer<GoogleMapController> _controller = Completer();
BitmapDescriptor? sourceIcon;
BitmapDescriptor? destinationIcon;
Set<Marker> _markers = {};

late LatLng destinationLocation;
//late GoogleMapController googleMapController;

void setInitialLocation() {
  //googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(15.5983302, 32.5843465), zoom: 14)));
  _markers.clear();
  _markers.add(Marker(markerId: const MarkerId('currentLocation'),position: LatLng(15.5983302, 32.5843465)));
  destinationLocation = LatLng(15.5983302, 32.5843465);
}

class _DriverMapScreenState extends State<DriverMapScreen> {
  @override
  void initState() {
    super.initState();

// set up initial locations
    setInitialLocation();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        // tilt: CAMERA_TILT,
        // bearing: CAMERA_BEARING,
        target: destinationLocation);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: GoogleMap(
                  myLocationEnabled: true,
                  compassEnabled: false,
                  markers: _markers,
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  initialCameraPosition: initialCameraPosition,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    //googleMapController = controller;

                    //showPinsOnMap();
                  },
                ),
              ),
              Details("أمنية عبد الحفيظ", "الشهيد طه الماحي"),
            ],
          ),
          floatingActionButton: Container(
            // ignore: prefer_const_constructors
            margin: EdgeInsets.only(right: 10, left: 300, bottom: 670),
            child: FloatingActionButton(
                heroTag: "btn1",
              onPressed: () {
                Navigator.of(context).pushNamed('order driver Screen');
              },
              backgroundColor: Colors.white,
              // ignore: prefer_const_constructors
              child: Icon(
                Icons.arrow_right_alt,
                color: Primarycolor,
              ),
            ),
          ),
        ));
  }

  // void showPinsOnMap() {
  //   setState(() {
  //     _markers.add(Marker(
  //         // ignore: prefer_const_constructors
  //         markerId: MarkerId('destinationPin'),
  //         position: destinationLocation,
  //         //    icon: destinationIcon!,
  //         icon: BitmapDescriptor.defaultMarker));
  //   });
  // }
}
