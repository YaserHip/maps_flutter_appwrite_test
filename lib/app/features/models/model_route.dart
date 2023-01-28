// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelRoute {
  const ModelRoute({
    required this.id,
    required this.name,
  });
  final String id;
  final String name;

  ModelRoute copyWith({
    String? id,
    String? name,
  }) {
    return ModelRoute(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      r'$id': id,
      'name': name,
    };
  }

  factory ModelRoute.fromMap(Map<dynamic, dynamic> map) {
    return ModelRoute(
      id: map[r'$id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelRoute.fromJson(String source) =>
      ModelRoute.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ModelRoute(id: $id, name: $name)';

  @override
  bool operator ==(covariant ModelRoute other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
