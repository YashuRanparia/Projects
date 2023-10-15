import 'dart:async';
import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surat_transit/Model/SetRouteModel.dart';
import 'package:surat_transit/Screens/SecondScreen/stopslist.dart';

class SearchRoutes extends StatefulWidget {
  const SearchRoutes({super.key});

  @override
  State<SearchRoutes> createState() => _SearchRoutesState();
}

class _SearchRoutesState extends State<SearchRoutes> {
  var selectedRoute = "Select your Bus Routes";

  late String platno;
  late String totaltime;
  // ignore: non_constant_identifier_names
  List<String> all_routes = [];
  Future<void> readJson() async {
    final String jsondata1 =
        await rootBundle.loadString('lib/DATA/All_ROUTES.json');

    final list1 = json.decode(jsondata1);

    for (var element in list1) {
      all_routes.add(element["all_routes"]);
    }
  }

  @override
  void initState() {
    super.initState();
    // print("get list.");
    readJson();
  }

  // ignore: non_constant_identifier_names
  Future<List<dynamic>> ReadJosn1() async {
    var file = await rootBundle.loadString('lib/DATA/master-data.json');
    var jsondata = json.decode(file);
    return jsondata;
  }

  Future<SetRouteModel> feachData(String inp) async {
    List<dynamic> feachdata = await ReadJosn1();
    String startPoint = '';
    String endPoint = '';
    List<String> data = [];
    for (var element in feachdata) {
      for (var i = 0; i < (element[inp].length); i++) {
        if (i == 0) {
          platno = (element[inp][i]['PlatformNo;']).toString() != '0'
              ? (element[inp][i]['PlatformNo;']).toString()
              : '--';
          startPoint += element[inp][i]['Stop Names'];
        } else if (i == element[inp].length - 1) {
          totaltime = element[inp][i]['Travel Time (hh:mm:ss)'];
          endPoint += element[inp][i]['Stop Names'];
        } else {
          data.add(element[inp][i]['Stop Names']);
        }
      }
    }
    SetRouteModel s = SetRouteModel(
        selectedRoute, data, platno, totaltime, startPoint, endPoint);
    return s;
  }

  late SetRouteModel r;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: MediaQuery.of(context).size.height * 0.54,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Image.asset(
                "assets/images/roadanim.gif",
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.32,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 190, 59),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: SizedBox(
                    width: 150,
                    height: 46,
                    child: OutlinedButton(
                      onPressed: (() async {
                        var dat = await feachData(selectedRoute);

                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) =>
                                StopList(selectedRoute, dat)),
                          ),
                        );
                        // print(selectedRoute);
                      }),
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Find Route',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  color:
                                      const Color.fromARGB(255, 255, 190, 59),
                                  fontWeight: FontWeight.w800),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Card(
            elevation: 10,
            margin: const EdgeInsetsDirectional.only(top: 135),
            shadowColor: Colors.black,
            // surfaceTintColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: Color.fromARGB(255, 255, 190, 59),
                width: 3,
              ),
            ),
            child: SizedBox(
              width: 300,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .663,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownSearch(
                    clearButtonProps: const ClearButtonProps(
                        padding: EdgeInsets.all(9),
                        constraints: BoxConstraints(maxWidth: double.infinity)),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      baseStyle:
                          TextStyle(color: Colors.black, fontFamily: 'poppins'),
                      textAlignVertical: TextAlignVertical(y: 0.15),
                      dropdownSearchDecoration: InputDecoration(
                        prefix: SizedBox(
                          width: 10,
                        ),
                        isDense: true,
                        // isCollapsed: true,
                        border: InputBorder.none,
                      ),
                    ),
                    items: all_routes,
                    selectedItem: selectedRoute,
                    popupProps: PopupProps.dialog(
                      showSearchBox: true,
                      searchFieldProps: const TextFieldProps(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here...",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 190, 59),
                          ),
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      listViewProps: const ListViewProps(
                        padding: EdgeInsets.all(2),
                      ),
                      dialogProps: DialogProps(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        insetPadding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 30),
                      ),
                    ),
                    onChanged: (value) {
                      selectedRoute = value;
                      // print(selectedRoute);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
