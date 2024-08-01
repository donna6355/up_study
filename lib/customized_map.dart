import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomizedMap extends StatefulWidget {
  const CustomizedMap({super.key});

  @override
  State<CustomizedMap> createState() => _CustomizedMapState();
}

class _CustomizedMapState extends State<CustomizedMap> {
  String? _mapStyleString;

  @override
  void initState() {
    rootBundle.loadString('assets/customize_map_theme.json').then((string) {
      setState(() {
        _mapStyleString = string;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      style: _mapStyleString,
      initialCameraPosition: const CameraPosition(
        target: LatLng(37.532600, 127.024612),
        zoom: 15,
      ),
    );
  }
}
