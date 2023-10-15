// import 'dart:io';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:surat_transit/DATA/GoogleMap/ApiKey.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TransitRoute {
  final mode = 'transit';
  final transitmode = 'bus';

  final String key = apiKey;

  // &mode=$mode&transit_mode=$transitmode  &mode=$mode&transit_mode=$transitmode
  Future<Map> getDirection(String origin, String destination) async {
    final String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&mode=$mode&transit_mode=$transitmode&region=IN&key=$key";
    var response = await http.get(Uri.parse(url));

    var result = {};
    try {
      var json = convert.jsonDecode(response.body);

      print('34 $url');
      result = {
        'bounds_ne': json['routes'][0]['bounds']['northeast'],
        'bounds_se': json['routes'][0]['bounds']['southwest'],
        'start_location': json['routes'][0]['legs'][0]['start_location'],
        'end_location': json['routes'][0]['legs'][0]['end_location'],
        'arrival_time': json['routes'][0]['legs'][0]['arrival_time']['text'],
        'departure_time': json['routes'][0]['legs'][0]['departure_time']
            ['text'],
        'total_distance': json['routes'][0]['legs'][0]['distance']['text'],
        'total_time': json['routes'][0]['legs'][0]['duration']['text'],
        'overviewpolyline': PolylinePoints()
            .decodePolyline(json['routes'][0]['overview_polyline']['points']),
        'steps': json['routes'][0]['legs'][0]['steps']
      };
    } catch (e) {
      print('21-$e');
    }
    // print('42:${result['steps']}');
    return result;
  }
}
  


 // Future<String> getPlaceId(String input) async {
  //   final String url =
  //       'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
  //   var response = await http.get(Uri.parse(url));
  //   var json = convert.jsonDecode(response.body);
  //   print('15:$json');
  //   var placeId = json['candidates'][0]['place_id'] as String;
  //   print(placeId);
  //   return placeId;
  // }