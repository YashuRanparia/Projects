import 'package:flutter/material.dart';

import 'package:surat_transit/Screens/HomeScreenWidget/SelectCard.dart';
import 'package:surat_transit/Service/getsMethod.dart';

import 'RouteScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomindex = 0;

  Map<String, dynamic> stationInfo = {};
  GetMethod g = GetMethod();
  List<String?> stations = [];
  @override
  void initState() {
    super.initState();
    stations = GetMethod().getListAll();
  }

  // ignore: non_constant_identifier_names
  var selected_Station = ["Select Location..", "To.."];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    // print("build Home");
    return Stack(children: [
      Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08),
                  child: Image.asset('assets/images/Around_the_world.gif'),
                ),
                Column(
                  children: const [
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Montserrat_Subrayada',
                        color: Color.fromRGBO(35, 138, 250, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Stack(alignment: AlignmentDirectional.topCenter, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.34,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(35, 138, 250, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              SelectedCard(stations, selected_Station),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                child: SizedBox(
                  width: 150,
                  height: 46,
                  child: OutlinedButton(
                    onPressed: (() {
                      // print(selected_Station[0] + " " + selected_Station[1]);
                      List pr;
                      if (selected_Station[0] != selected_Station[1]) {
                        pr = g.findRoute(
                            selected_Station[0], selected_Station[1]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RouteScreen(
                                selected: selected_Station, avRoute: pr),
                          ),
                        );
                      } else {
                        showSnackbar(
                            context,
                            const Color.fromRGBO(35, 138, 250, 1),
                            "Enter Different Point");
                      }
                      // print(pr[0].between_Stations);
                      // if (pr[0] != 'No') {
                      //   for (var element in pr) {
                      //     for (var
                      //e in element) {
                      //       print(
                      //         'Sr.No:${e.srNo}\nStopName:${e.stopNames}\ntravelTimeHhMmSs:${e.travelTimeHhMmSs}\nplatformNo:${e.platformNo}\n',
                      //       );
                      //     }
                      //   }
                      // }
                    }),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Find Route',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: const Color.fromRGBO(35, 138, 250, 1),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    ]);
  }
}
