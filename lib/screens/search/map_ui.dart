import 'dart:typed_data';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:nonqueue_app/utils/encription.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapSearchScreen extends StatefulWidget {
  const MapSearchScreen({Key? key}) : super(key: key);

  @override
  State<MapSearchScreen> createState() => _MapSearchScreenState();
}

class _MapSearchScreenState extends State<MapSearchScreen> {
  final LatLng _initialPostition = const LatLng(40.38, 49.84);

  late GoogleMapController _controller;
  final Location _location = Location();

  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('0'),
      position: LatLng(40.39, 49.81),
      infoWindow: InfoWindow(title: 'Gunna Coffe'),
    ),
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(40.40, 49.81),
      infoWindow: InfoWindow(title: 'Starbucks Coffe'),
    ),
    const Marker(
      markerId: MarkerId('2'),
      position: LatLng(40.38, 49.82),
      infoWindow: InfoWindow(title: 'Mc Coffe'),
    ),
    const Marker(
      markerId: MarkerId('3'),
      position: LatLng(40.37, 49.81),
      infoWindow: InfoWindow(title: 'Mc Coffe'),
    ),
  };

  Future<void> _onMapCreated(GoogleMapController _cntlr) async {
    _controller = _cntlr;
    LocationData loc = await _location.getLocation();
    if (loc.latitude != null && loc.longitude != null) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(loc.latitude!, loc.longitude!), zoom: 15),
        ),
      );
    }
    // _location.onLocationChanged.listen((l) {
    //   if (l.latitude != null && l.longitude != null) {
    //     _controller.animateCamera(
    //       CameraUpdate.newCameraPosition(
    //         CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
    //       ),
    //     );
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 130,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 260),
          child: GoogleMap(
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(target: _initialPostition),
            markers: _markers,
          ),
        ),
        borderRadius: Radiuses.r20.copyWith(
          bottomLeft: const Radius.circular(0),
          bottomRight: const Radius.circular(0),
        ),
        panel: Padding(
          padding: Paddings.p16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DottedLine(
                direction: Axis.horizontal,
                lineLength: 50,
                lineThickness: 8,
                dashLength: 50,
                dashColor: ColorPalette.greyInputText.withOpacity(.3),
                dashRadius: 10,
              ),
              Spaces.vertical20,
              TextField(
                decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search_rounded)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
