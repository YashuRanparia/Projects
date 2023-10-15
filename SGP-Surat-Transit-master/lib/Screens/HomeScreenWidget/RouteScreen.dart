import 'package:flutter/material.dart';

import 'MapWidget.dart';

class RouteScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final selected;
  final List avRoute;

  const RouteScreen({super.key, required this.selected, required this.avRoute});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  var selected_stations;
  late List avRoute;
  @override
  void initState() {
    super.initState();
    selected_stations = widget.selected;
    avRoute = widget.avRoute;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapSample(
        source: selected_stations[0],
        destination: selected_stations[1],
        aviRoute: avRoute[0],
      ),
    );
  }
}

// class StationInfo extends StatelessWidget {
//   const StationInfo({
//     Key? key,
//     required this.avRoute,
//   }) : super(key: key);

//   final String avRoute;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       child: SizedBox(
//           height: 50,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       height: 20,
//                       child: Text(
//                         avRoute.split('-')[0],
//                         style:
//                             const TextStyle(color: Colors.black, fontSize: 12),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }


// // Padding(
//           //   padding: EdgeInsets.symmetric(horizontal: 2),
//           //   child: DraggableScrollableSheet(
//           //     initialChildSize: 0.6,
//           //     minChildSize: 0.16,
//           //     maxChildSize: 0.8,
//           //     builder: ((context, scrollController) => Card(
//           //           elevation: 10,
//           //           shape: const RoundedRectangleBorder(
//           //               borderRadius: BorderRadius.only(
//           //                   topLeft: Radius.circular(20),
//           //                   topRight: Radius.circular(20))),
//           //           child: Container(
//           //             decoration: const BoxDecoration(
//           //                 color: Colors.white,
//           //                 borderRadius: BorderRadius.only(
//           //                     topLeft: Radius.circular(20),
//           //                     topRight: Radius.circular(20))),
//           //             child: Padding(
//           //               padding: const EdgeInsets.all(8),
//           //               child: avRoute[0] != "No"
//           //                   ? ListView.separated(
//           //                       // scrollDirection: Axis.vertical,
//           //                       // shrinkWrap: true,
//           //                       controller: scrollController,
//           //                       itemBuilder: ((context, index) {
//           //                         print(index);
//           //                         print(avRoute[index].startendroute);
//           //                         return GestureDetector(
//           //                           onTap: () => nextScreen(
//           //                               context,
//           //                               FullDetails(
//           //                                 selected: selected_stations,
//           //                                 avRoute: avRoute,
//           //                                 index: index,
//           //                               )),
//           //                           child: StationInfo(
//           //                               avRoute: avRoute[index].startendroute),
//           //                         );
//           //                       }),
//           //                       itemCount: avRoute.length,
//           //                       separatorBuilder: (__, _) => const Divider(),
//           //                     )
//           //                   : const Center(
//           //                       child: Text('No Such Route Available'),
//           //                     ),
//           //             ),
//           //           ),
//           //         )),
//           //   ),
//           // )