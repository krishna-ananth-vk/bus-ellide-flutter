class RouteModel {
  final String id;
  final String name;
  final List<String> stops;
  final double distanceKm;

  RouteModel({
    required this.id,
    required this.name,
    required this.stops,
    required this.distanceKm,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      id: json['id'],
      name: json['name'],
      stops: List<String>.from(json['stops']),
      distanceKm: (json['distance_km'] as num).toDouble(),
    );
  }
}
