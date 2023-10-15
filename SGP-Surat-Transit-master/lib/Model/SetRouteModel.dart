class SetRouteModel {
  final String selected;
  final List<String> routes;
  final String platNo;
  final String totaltime;
  final String startPoint;
  final String endPoint;
  SetRouteModel(this.selected, this.routes, this.platNo, this.totaltime,
      this.startPoint, this.endPoint);
  @override
  String toString() {
    // TODO: implement toString
    return "$selected $platNo $totaltime\n$routes";
  }
}
