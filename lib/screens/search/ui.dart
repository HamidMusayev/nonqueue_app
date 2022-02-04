import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:nonqueue_app/screens/search/filter_ui.dart';
import 'package:nonqueue_app/utils/constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LatLng _initialPostition = const LatLng(40.38, 49.84);

  late GoogleMapController _controller;
  final Location _location = Location();
  late BitmapDescriptor customIcon;

  final Set<Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController _cntlr) async {
    _controller = _cntlr;
    LocationData loc = await _location.getLocation();
    if (loc.latitude != null && loc.longitude != null) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(loc.latitude!, loc.longitude!),
            zoom: 15,
          ),
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
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/splash/location.png');

    _markers.addAll({
      Marker(
        markerId: const MarkerId('0'),
        position: const LatLng(40.39, 49.81),
        infoWindow: const InfoWindow(title: 'Gunna Coffe'),
        icon: customIcon,
      ),
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(40.40, 49.81),
        infoWindow: const InfoWindow(title: 'Starbucks Coffe'),
        icon: customIcon,
      ),
      Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(40.38, 49.82),
        infoWindow: const InfoWindow(title: 'Mc Coffe'),
        icon: customIcon,
      ),
      Marker(
        markerId: const MarkerId('3'),
        position: const LatLng(40.37, 49.81),
        infoWindow: const InfoWindow(title: 'Mc Coffe'),
        icon: customIcon,
      ),
    });
    setState(() {});
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
        minHeight: 110,
        body: GoogleMap(
          padding: const EdgeInsets.only(bottom: 265),
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(target: _initialPostition),
          markers: _markers,
        ),
        borderRadius: Radiuses.r20.copyWith(
          bottomLeft: const Radius.circular(0),
          bottomRight: const Radius.circular(0),
        ),
        panel: Padding(
          padding: Paddings.p16.copyWith(top: 12, bottom: 0),
          child: const FilterScreen(),
        ),
      ),
    );
  }
}
