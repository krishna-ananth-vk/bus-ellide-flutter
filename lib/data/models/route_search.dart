class RouteSearch {
  int? unionRowno;
  int? row;
  String? routeno;
  int? responsecode;
  int? routeparentid;

  RouteSearch({
    this.unionRowno,
    this.row,
    this.routeno,
    this.responsecode,
    this.routeparentid,
  });

  RouteSearch.fromJson(Map<String, dynamic> json) {
    unionRowno = json['union_rowno'];
    row = json['row'];
    routeno = json['routeno'];
    responsecode = json['responsecode'];
    routeparentid = json['routeparentid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['union_rowno'] = this.unionRowno;
    data['row'] = this.row;
    data['routeno'] = this.routeno;
    data['responsecode'] = this.responsecode;
    data['routeparentid'] = this.routeparentid;
    return data;
  }
}
