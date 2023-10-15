import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:surat_transit/DATA/GoogleMap/ApiKey.dart';
import 'package:surat_transit/Model/MapRouteStep.dart';
import 'package:surat_transit/Service/Transit.dart';

class MapSample extends StatefulWidget {
  final String source, destination;
  // ignore: prefer_typing_uninitialized_variables
  final aviRoute;

  const MapSample(
      {Key? key,
      required this.source,
      required this.destination,
      required this.aviRoute})
      : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  String start = "",
      end = "",
      time = "",
      arrivelTime = "",
      departureTime = "",
      km = "";
  List<String> listOfStation = [];

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Polyline> _polyline = <Polyline>{};
  final Set<Marker> _marker = <Marker>{};

  int _polylineIdCounter = 1;
  int _markerIdCounter = 1;
  @override
  void initState() {
    super.initState(); //,Surat,Gujarat,India
    String s = "${widget.source},Surat,Gujarat";
    String d = "${widget.destination},Surat,Gujarat";
    try {
      listOfStation = widget.aviRoute.between_Stations;
    } catch (e) {
      print('Error $e');
    }
    getPlace(s, d);
  }

  Future<void> getPlace(String st, String ds) async {
    String baseUrl =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request1 = '$baseUrl?input=$st&key=$apiKey';
    String request2 = '$baseUrl?input=$ds&key=$apiKey';
    var response1 = await http.get(Uri.parse(request1));
    var response2 = await http.get(Uri.parse(request2));
    var json1 = convert.jsonDecode(response1.body);
    var json2 = convert.jsonDecode(response2.body);
    if (response1.statusCode == 200) {
      setState(() {
        start = json1['predictions'][0]['description'];
        end = json2['predictions'][0]['description'];
      });
    } else {
      throw Exception('Fail to load');
    }
    getInfomation();
  }

  void getInfomation() async {
    var direction = await TransitRoute().getDirection(
      start.replaceAll(" ", ""),
      end.replaceAll(" ", ""),
    );
    try {
      arrivelTime = direction['arrival_time'];
      departureTime = direction['departure_time'];
      km = direction['total_distance'];
      time = direction['total_time'];
      var steps = direction['steps'];
      List<Map<String, dynamic>> mlist = RouteSteps().getpoints(steps);
      List<String> info = RouteSteps().getinfo(steps);
      print(info);
      _goToPlace(
        direction['start_location']['lat'],
        direction['start_location']['lng'],
        direction['bounds_ne'],
        direction['bounds_se'],
      );
      List<Map<String, dynamic>> markerS = [
        direction['start_location'],
        direction['end_location']
      ];
      // direction['overviewpolyline']
      List<List<PointLatLng>> tlist =
          RouteSteps().getTransitPol(direction['steps']);

      markerS.insertAll(1, mlist);
      setState(() {
        _setMarker(markerS);
        _setPolyline(tlist);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _setMarker(List<Map<String, dynamic>> m) async {
    for (int element = 0; element < m.length; element++) {
      final String markerIdVal = 'polyline_$_markerIdCounter';
      _markerIdCounter++;
      // print(element);
      if (element == m.length - 1) {
        _marker.add(
          Marker(
              markerId: MarkerId(markerIdVal),
              position: LatLng(m[element]['lat'], m[element]['lng']),
              infoWindow: InfoWindow(title: end)),
        );
      }
      print(end);
      _marker.add(
        Marker(
          markerId: MarkerId(markerIdVal),
          position: LatLng(m[element]['lat'], m[element]['lng']),
        ),
      );
    }
    // print(_marker.length);
  }

  void _setPolyline(List<List<PointLatLng>> points) {
    for (var element in points) {
      final String polylineIdVal = 'polyline_$_polylineIdCounter';
      _polylineIdCounter++;
      _polyline.add(Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 6,
        color: const Color.fromARGB(255, 207, 96, 255),
        points: element
            .map(
              (point) => LatLng(point.latitude, point.longitude),
            )
            .toList(),
      ));
    }
  }

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(21.203510, 72.839233), zoom: 16);

  @override
  Widget build(BuildContext context) {
    // print('133: $_marker');
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          mapType: MapType.normal,
          markers: _marker,
          polylines: _polyline,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (controller) {
            _controller.complete(controller);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${widget.source} 🔜 ${widget.destination}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ],
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.2,
          minChildSize: 0.19,
          maxChildSize: 0.6,
          builder: ((context, scrollController) => Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(controller: scrollController, children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 2, color: Colors.black38)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: SizedBox(
                                      width: 200,
                                      child: Text(
                                        '${widget.source}  To  ${widget.destination}',
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Column(
                                    children: [const Text('Time'), Text(time)],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2, color: Colors.black38)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        const Text('Departure time'),
                                        Text(departureTime)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text('Arrival time'),
                                        Text(arrivelTime)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text('Distance'),
                                        Text(km)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Stops',
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'Montserrat_Subrayada'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 315,
                          child: ListView.builder(
                            // controller: scrollController,
                            itemCount: listOfStation.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 35,
                                        height: 45,
                                        child: Image.asset(
                                            './assets/images/points.png')),
                                    Text(listOfStation[index]),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              )),
        )
      ]),
    );
  }

  Future<void> _goToPlace(double lat, double lng, Map<String, dynamic> boundsNe,
      Map<String, dynamic> boundsSe) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 14)));
    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(boundsSe['lat'], boundsSe['lng']),
            northeast: LatLng(boundsNe['lat'], boundsNe['lng'])),
        25));
  }
}
