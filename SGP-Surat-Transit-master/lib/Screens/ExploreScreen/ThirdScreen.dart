import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:surat_transit/Model/exploredatadart.dart';
import 'package:surat_transit/Screens/ExploreScreen/detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

late ExploreSurat a;

class _ExploreScreenState extends State<ExploreScreen> {
  List<ExploreSurat> s = [];

  double currentPage = 1.0;

  Future<void> readExplore() async {
    var read1 = await rootBundle.loadString("lib/DATA/exploredata.json");
    List<dynamic> list1 = json.decode(read1);
    for (var element in list1) {
      var x = ExploreSurat.fromJson(element);
      s.add(x);
    }
  }

  @override
  void initState() {
    super.initState();
    readExplore();
    currentPage = s.length - 1.0;
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: s.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: ListView.builder(
          itemCount: s.length,
          controller: controller,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => DetailScreen(s[index]))));
                  },
                  child: Favourites(s[index].name as String,
                      s[index].image as String, MediaQuery.of(context).size),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Favourites extends StatelessWidget {
  String title;
  String imageUrl;
  Size meadiaQ;
  Favourites(this.title, this.imageUrl, this.meadiaQ, {super.key});
  List<Color> gradientColor = [
    // Colors.transparent,
    // Colors.black.withOpacity(0.2),
    // Colors.black.withOpacity(0.3),
    Colors.black.withOpacity(0.3),
    // Colors.black.withOpacity(0.3),
    Colors.black.withOpacity(0.3),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: meadiaQ.height / 3 - 2,
          width: meadiaQ.width,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: meadiaQ.height / 3 - 2,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColor,
            ),
          ),
        ),
        SizedBox(
          // width: meadiaQ.width / 1.5,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              overflow: TextOverflow.clip,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
      // Center(
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 20),
            //     height: 50,
            //     width: 200,
            //     child: const Card(
            //       elevation: 20,
            //       color: Colors.blueGrey,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(20))),
            //       child: Center(
            //           child: Text(
            //         "Explore SURAT!",
            //         style: TextStyle(
            //             fontSize: 20,
            //             fontFamily: "assets/Exo_2",
            //             fontWeight: FontWeight.bold),
            //       )),
            //     ),
            //   ),
            // ),