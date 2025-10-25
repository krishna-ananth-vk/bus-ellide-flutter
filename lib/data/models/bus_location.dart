class BusLocation {
  final double lat;
  final double lng;
  final String vehicleId;

  BusLocation({required this.lat, required this.lng, required this.vehicleId});

  factory BusLocation.fromJson(Map<String, dynamic> json) => BusLocation(
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
    vehicleId: json['vehicleId']?.toString() ?? '',
  );

  Map<String, dynamic> toJson() => {
    'lat': lat,
    'lng': lng,
    'vehicleId': vehicleId,
  };
}
