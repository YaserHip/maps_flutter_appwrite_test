// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelLocation {
  const ModelLocation({
    required this.id,
    required this.ruteID,
    required this.lat,
    required this.lon,
  });

  final String id;
  final String ruteID;
  final String lat;
  final String lon;

  ModelLocation copyWith({
    String? id,
    String? ruteID,
    String? lat,
    String? lon,
  }) {
    return ModelLocation(
      id: id ?? this.id,
      ruteID: ruteID ?? this.ruteID,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      r'$id': id,
      'ruteID': ruteID,
      'lat': lat,
      'lon': lon,
    };
  }

  factory ModelLocation.fromMap(Map<dynamic, dynamic> map) {
    return ModelLocation(
      id: map[r'$id'] as String,
      ruteID: map['routeid'] as String,
      lat: map['lat'] as String,
      lon: map['lon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelLocation.fromJson(String source) =>
      ModelLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelLocation(id: $id, ruteID: $ruteID, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(covariant ModelLocation other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.ruteID == ruteID &&
        other.lat == lat &&
        other.lon == lon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ ruteID.hashCode ^ lat.hashCode ^ lon.hashCode;
  }
}
