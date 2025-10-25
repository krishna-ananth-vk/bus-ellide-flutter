import 'package:bus_ellide_mobile/data/models/map_data.dart';
import 'package:bus_ellide_mobile/data/models/stop.dart';

class BusRoute {
  BusDirection? up;
  BusDirection? down;
  String? message;
  bool? issuccess;
  Null? exception;
  int? rowCount;
  int? responsecode;

  BusRoute({
    this.up,
    this.down,
    this.message,
    this.issuccess,
    this.exception,
    this.rowCount,
    this.responsecode,
  });

  BusRoute.fromJson(Map<String, dynamic> json) {
    up = json['up'] != null ? new BusDirection.fromJson(json['up']) : null;
    down = json['down'] != null
        ? new BusDirection.fromJson(json['down'])
        : null;
    message = json['message'];
    issuccess = json['issuccess'];
    exception = json['exception'];
    rowCount = json['rowCount'];
    responsecode = json['responsecode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.up != null) {
      data['up'] = this.up!.toJson();
    }
    if (this.down != null) {
      data['down'] = this.down!.toJson();
    }
    data['message'] = this.message;
    data['issuccess'] = this.issuccess;
    data['exception'] = this.exception;
    data['rowCount'] = this.rowCount;
    data['responsecode'] = this.responsecode;
    return data;
  }
}

class BusDirection {
  List<Stop>? data;
  List<MapData>? mapData;

  BusDirection({this.data, this.mapData});

  BusDirection.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Stop>[];
      json['data'].forEach((v) {
        data!.add(new Stop.fromJson(v));
      });
    }
    if (json['mapData'] != null) {
      mapData = <MapData>[];
      json['mapData'].forEach((v) {
        mapData!.add(new MapData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.mapData != null) {
      data['mapData'] = this.mapData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
