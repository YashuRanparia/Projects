import 'package:flutter/material.dart';
import 'package:surat_transit/Model/exploredatadart.dart';

class DetailScreen extends StatelessWidget {
  ExploreSurat s;
  DetailScreen(this.s, {super.key});
  static const routeName = '/detail-screen';
  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context).size;
    List<Color> gradientColor = [
      Colors.transparent,
      Colors.black.withOpacity(0.2),
      Colors.black.withOpacity(0.3),
      Colors.black.withOpacity(0.4),
      Colors.black.withOpacity(0.5),
      Colors.black.withOpacity(0.95),
    ];
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.95),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    SizedBox(
                      height: mediaQ.height / 2 + 1,
                      width: double.infinity,
                      child: Image.asset(
                        s.image as String,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      height: mediaQ.height / 2 + 1,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: gradientColor,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 9,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: mediaQ.width - 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                s.name as String,
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                                overflow: TextOverflow.visible,
                              ),
                              Text(
                                s.address as String,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Colors.white),
                  padding: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(34.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CardText('Type', 'Attraction'),
                                SizedBox(
                                  height: mediaQ.height / 30,
                                ),
                                CardText('Visit', 'Free')
                              ],
                            ),
                            SizedBox(
                              width: mediaQ.width / 4.2,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CardText('Open', '9:00-23:00'),
                                SizedBox(
                                  height: mediaQ.height / 30,
                                ),
                                CardText('Time', '30 min')
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mediaQ.height / 25,
                        ),
                        Text(
                          s.data as String,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

Widget CardText(String title, String s) {
  return SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          s,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          textScaleFactor: 1.2,
        ),
      ],
    ),
  );
}
