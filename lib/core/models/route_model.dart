class RouteModel {
  final String id;
  final String number;
  final String name;
  final List<StopModel> stops;

  RouteModel({
    required this.id,
    required this.number,
    required this.name,
    required this.stops,
  });
}

class StopModel {
  final String id;
  final String name;
  final double lat;
  final double lon;
  StopModel({
    required this.id,
    required this.name,
    required this.lat,
    required this.lon,
  });
}

class BusPosition {
  final String id;
  final double lat;
  final double lon;
  final DateTime ts;
  BusPosition({
    required this.id,
    required this.lat,
    required this.lon,
    required this.ts,
  });
}
