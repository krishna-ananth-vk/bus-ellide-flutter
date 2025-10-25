import 'package:bus_ellide_mobile/data/models/vehicle_detail.dart';

class Stop {
  int? routeid;
  int? stationid;
  String? stationname;
  String? from;
  String? to;
  String? routeno;
  int? distanceOnStation;
  double? centerlat;
  double? centerlong;
  int? responsecode;
  int? isnotify;
  List<VehicleDetails>? vehicleDetails;

  Stop({
    this.routeid,
    this.stationid,
    this.stationname,
    this.from,
    this.to,
    this.routeno,
    this.distanceOnStation,
    this.centerlat,
    this.centerlong,
    this.responsecode,
    this.isnotify,
    this.vehicleDetails,
  });

  Stop.fromJson(Map<String, dynamic> json) {
    routeid = json['routeid'];
    stationid = json['stationid'];
    stationname = json['stationname'];
    from = json['from'];
    to = json['to'];
    routeno = json['routeno'];
    distanceOnStation = json['distance_on_station'];
    centerlat = json['centerlat'];
    centerlong = json['centerlong'];
    responsecode = json['responsecode'];
    isnotify = json['isnotify'];
    if (json['vehicleDetails'] != null) {
      vehicleDetails = <VehicleDetails>[];
      json['vehicleDetails'].forEach((v) {
        vehicleDetails!.add(new VehicleDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['routeid'] = this.routeid;
    data['stationid'] = this.stationid;
    data['stationname'] = this.stationname;
    data['from'] = this.from;
    data['to'] = this.to;
    data['routeno'] = this.routeno;
    data['distance_on_station'] = this.distanceOnStation;
    data['centerlat'] = this.centerlat;
    data['centerlong'] = this.centerlong;
    data['responsecode'] = this.responsecode;
    data['isnotify'] = this.isnotify;
    if (this.vehicleDetails != null) {
      data['vehicleDetails'] = this.vehicleDetails!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}
