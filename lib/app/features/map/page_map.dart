import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_flutter_appwrite_test/app/features/map/controller_map.dart';
import 'package:maps_flutter_appwrite_test/app/features/map/repository_map.dart';
import 'package:maps_flutter_appwrite_test/app/features/models/model_markers_response.dart';
import 'package:maps_flutter_appwrite_test/app/widgets/custom_dropdown.dart';

import '../models/model_location.dart';

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

  String _dropDownValue = "0";

  ProviderSubscription<AsyncValue<ModelLocation>>? streamSub = null;

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

    void dropDownCallBack(String? itemSelected) async {
      setState(() {
        _dropDownValue = itemSelected!;
      });

      setState(() {
        markers.clear();
      });

      if (streamSub != null) {
        streamSub?.close();
        print('stoped stream');
        ref.watch(repositoryMapProvider).cancelSubRealtime();
      }

      if (itemSelected != "0") {
        final listRoutes =
            await ref.read(getListOfMarkersPosProvider(itemSelected!).future);

        print("lista: ${listRoutes.listOfStreamingRoutes}");

        for (int i = 0; i < listRoutes.listOfLocations.length; i++) {
          final item = listRoutes.listOfLocations[i];
          final markerID = MarkerId(item.id);
          final markerItem = Marker(
              markerId: markerID,
              position: LatLng(double.parse(item.lat), double.parse(item.lon)));

          markers[markerID] = markerItem;
        }

        setState(() {
          markers;
        });

        streamSub = ref.listenManual(
            streamMarkersPosProvider(list: listRoutes.listOfStreamingRoutes),
            (previous, next) {
          final item = next.value;
          final itemFound = markers.keys.firstWhere(
              (element) => markers[element]!.markerId.value == next.value!.id);

          markers.update(
              itemFound,
              (value) => Marker(
                  markerId: itemFound,
                  position:
                      LatLng(double.parse(item!.lat), double.parse(item.lon))));

          setState(() {
            markers;
          });
          print('asdasdada111: ${next.value.toString()}');
        });
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("MAP"),
        ),
        body: Stack(
          children: [
            state.isLoading
                ? Container(
                    color: Colors.white60,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(),
            GoogleMap(
              myLocationEnabled: true,
              initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              markers: markers.values.toSet(),
            ),
            ref.watch(getRoutesListProvider).when(
                  data: (prodList) {
                    return CustomDropDown(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.fromLTRB(10, 12, 70, 5),
                      changed: dropDownCallBack,
                      value: _dropDownValue,
                      items: prodList
                          .map<DropdownMenuItem<String>>(
                              (e) => DropdownMenuItem(
                                  value: e.id,
                                  child: Text(
                                    e.name,
                                  )))
                          .toList(),
                    );
                  },
                  error: (e, st) => Center(child: Text(e.toString())),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
          ],
        ));
  }
}
