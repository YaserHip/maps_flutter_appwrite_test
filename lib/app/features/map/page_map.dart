import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PageMap extends ConsumerStatefulWidget {
  const PageMap({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageMapState();
}

class _PageMapState extends ConsumerState<PageMap> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        onMapCreated: (controller) => _controller.complete(controller),
      ),
    );
  }
}
