import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_flutter_appwrite_test/app/features/map/controller_map.dart';
import 'package:maps_flutter_appwrite_test/app/features/models/model_route.dart';

class PageMap extends ConsumerStatefulWidget {
  const PageMap({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageMapState();
}

class _PageMapState extends ConsumerState<PageMap> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.2789457, -106.4052544),
    zoom: 15,
  );
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _onMapCreated(GoogleMapController controller) async {
    const marker = Marker(
      markerId: MarkerId("1234"),
      position: LatLng(23.274113, -106.400097),
    );

    setState(() {
      markers[const MarkerId("1234")] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(controllerMapProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("MAP"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            FutureBuilder<List<ModelRoute>>(
              future: ref.read(controllerMapProvider.notifier).getRoutesList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DropdownButton(
                      items: snapshot.data
                          ?.map<DropdownMenuItem<ModelRoute>>((e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)))
                          .toList(),
                      onChanged: ((value) {}));
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            GoogleMap(
              myLocationEnabled: true,
              initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              markers: markers.values.toSet(),
            ),
          ],
        ));
  }
}
