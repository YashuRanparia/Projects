class RouteModel {
  // ignore: non_constant_identifier_names
  final int pt_no;
  final String time;
  final String startendroute;
  final double distance;
  // ignore: non_constant_identifier_names
  final List<String> between_Stations;

  RouteModel({
    // ignore: non_constant_identifier_names
    required this.pt_no,
    required this.time,
    required this.distance,
    // ignore: non_constant_identifier_names
    required this.between_Stations,
    required this.startendroute,
  });
}
