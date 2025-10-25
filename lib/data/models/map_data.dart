class MapData {
  int? vehicleid;
  String? vehiclenumber;
  int? servicetypeid;
  String? servicetype;
  double? centerlat;
  double? centerlong;
  String? eta;
  String? schArrivaltime;
  String? schDeparturetime;
  String? actualArrivaltime;
  String? actualDeparturetime;
  String? schTripstarttime;
  String? schTripendtime;
  int? lastlocationid;
  int? currentlocationid;
  int? nextlocationid;
  Null? currentstop;
  Null? nextstop;
  Null? laststop;
  int? stopCoveredStatus;
  int? heading;
  String? lastrefreshon;
  int? lastreceiveddatetimeflag;
  int? tripposition;

  MapData({
    this.vehicleid,
    this.vehiclenumber,
    this.servicetypeid,
    this.servicetype,
    this.centerlat,
    this.centerlong,
    this.eta,
    this.schArrivaltime,
    this.schDeparturetime,
    this.actualArrivaltime,
    this.actualDeparturetime,
    this.schTripstarttime,
    this.schTripendtime,
    this.lastlocationid,
    this.currentlocationid,
    this.nextlocationid,
    this.currentstop,
    this.nextstop,
    this.laststop,
    this.stopCoveredStatus,
    this.heading,
    this.lastrefreshon,
    this.lastreceiveddatetimeflag,
    this.tripposition,
  });

  MapData.fromJson(Map<String, dynamic> json) {
    vehicleid = json['vehicleid'];
    vehiclenumber = json['vehiclenumber'];
    servicetypeid = json['servicetypeid'];
    servicetype = json['servicetype'];
    centerlat = json['centerlat'];
    centerlong = json['centerlong'];
    eta = json['eta'];
    schArrivaltime = json['sch_arrivaltime'];
    schDeparturetime = json['sch_departuretime'];
    actualArrivaltime = json['actual_arrivaltime'];
    actualDeparturetime = json['actual_departuretime'];
    schTripstarttime = json['sch_tripstarttime'];
    schTripendtime = json['sch_tripendtime'];
    lastlocationid = json['lastlocationid'];
    currentlocationid = json['currentlocationid'];
    nextlocationid = json['nextlocationid'];
    currentstop = json['currentstop'];
    nextstop = json['nextstop'];
    laststop = json['laststop'];
    stopCoveredStatus = json['stopCoveredStatus'];
    heading = json['heading'];
    lastrefreshon = json['lastrefreshon'];
    lastreceiveddatetimeflag = json['lastreceiveddatetimeflag'];
    tripposition = json['tripposition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleid'] = this.vehicleid;
    data['vehiclenumber'] = this.vehiclenumber;
    data['servicetypeid'] = this.servicetypeid;
    data['servicetype'] = this.servicetype;
    data['centerlat'] = this.centerlat;
    data['centerlong'] = this.centerlong;
    data['eta'] = this.eta;
    data['sch_arrivaltime'] = this.schArrivaltime;
    data['sch_departuretime'] = this.schDeparturetime;
    data['actual_arrivaltime'] = this.actualArrivaltime;
    data['actual_departuretime'] = this.actualDeparturetime;
    data['sch_tripstarttime'] = this.schTripstarttime;
    data['sch_tripendtime'] = this.schTripendtime;
    data['lastlocationid'] = this.lastlocationid;
    data['currentlocationid'] = this.currentlocationid;
    data['nextlocationid'] = this.nextlocationid;
    data['currentstop'] = this.currentstop;
    data['nextstop'] = this.nextstop;
    data['laststop'] = this.laststop;
    data['stopCoveredStatus'] = this.stopCoveredStatus;
    data['heading'] = this.heading;
    data['lastrefreshon'] = this.lastrefreshon;
    data['lastreceiveddatetimeflag'] = this.lastreceiveddatetimeflag;
    data['tripposition'] = this.tripposition;
    return data;
  }
}
