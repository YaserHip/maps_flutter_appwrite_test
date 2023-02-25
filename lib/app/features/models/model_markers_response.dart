// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:maps_flutter_appwrite_test/app/features/models/model_location.dart';

class ModelMarkersResponse {
  ModelMarkersResponse({
    required this.listOfLocations,
    required this.listOfStreamingRoutes,
  });

  final List<ModelLocation> listOfLocations;
  final List<String> listOfStreamingRoutes;

  ModelMarkersResponse copyWith({
    List<ModelLocation>? listOfLocations,
    List<String>? listOfStreamingRoutes,
  }) {
    return ModelMarkersResponse(
      listOfLocations: listOfLocations ?? this.listOfLocations,
      listOfStreamingRoutes:
          listOfStreamingRoutes ?? this.listOfStreamingRoutes,
    );
  }

  @override
  String toString() =>
      'ModelMarkersResponse(listOfLocations: $listOfLocations, listOfStreamingRoutes: $listOfStreamingRoutes)';

  @override
  bool operator ==(covariant ModelMarkersResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.listOfLocations, listOfLocations) &&
        listEquals(other.listOfStreamingRoutes, listOfStreamingRoutes);
  }

  @override
  int get hashCode => listOfLocations.hashCode ^ listOfStreamingRoutes.hashCode;
}
