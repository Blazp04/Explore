import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlacesModel {
  final String name;
  final String imageUrl;
  final String description;
  final String url;
  final String type;

  PlacesModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.url,
    required this.type,
  });

  PlacesModel copyWith({
    String? name,
    String? imageUrl,
    String? description,
    String? url,
    String? type,
  }) {
    return PlacesModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      url: url ?? this.url,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'url': url,
      'type': type,
    };
  }

  factory PlacesModel.fromMap(Map<String, dynamic> map) {
    return PlacesModel(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlacesModel.fromJson(String source) => PlacesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlacesModel(name: $name, imageUrl: $imageUrl, description: $description, url: $url, type: $type)';
  }

  @override
  bool operator ==(covariant PlacesModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.imageUrl == imageUrl && other.description == description && other.url == url && other.type == type;
  }

  @override
  int get hashCode {
    return name.hashCode ^ imageUrl.hashCode ^ description.hashCode ^ url.hashCode ^ type.hashCode;
  }
}
