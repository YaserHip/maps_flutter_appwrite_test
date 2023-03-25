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
}
