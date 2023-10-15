import 'package:flutter/material.dart';
import 'package:surat_transit/Model/SetRouteModel.dart';

class StopList extends StatelessWidget {
  SetRouteModel stops;
  String selected;
  StopList(this.selected, this.stops, {super.key});

  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 255, 190, 59),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        selected,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: 0.57,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StartPointWidget(
              selected: stops.startPoint,
              totaltime: stops.totaltime,
              platno: stops.platNo,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            ListCardWidget(stops: stops.routes),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Expanded(
              child: EndPointWidget(selected: stops.endPoint),
            )
          ],
        ),
      ),
    );
  }
}

class StartPointWidget extends StatelessWidget {
  const StartPointWidget({
    Key? key,
    required this.selected,
    required this.totaltime,
    required this.platno,
  }) : super(key: key);

  final String selected;
  final String totaltime;
  final String platno;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: Container(
                  width: 50,
                  color: Colors.transparent,
                  child: Image.asset('assets/images/line.png'),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 28),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Staring point'.toUpperCase(),
                        textScaleFactor: 1.05,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          selected,
                          textScaleFactor: 1.4,
                          overflow: TextOverflow.visible,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            'Plat From',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontSize: 16),
                          ),
                          Text(
                            'No.$platno',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            'Travel Time',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontSize: 16),
                          ),
                          TimeDisplay(totaltime: totaltime),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TimeDisplay extends StatelessWidget {
  const TimeDisplay({
    Key? key,
    required this.totaltime,
  }) : super(key: key);

  final String totaltime;

  @override
  Widget build(BuildContext context) {
    return Text(
      totaltime.split(':')[0] == '00'
          ? '${totaltime.split(':')[1]}m ${totaltime.split(':')[2]}sec'
          : '${totaltime.split(':')[0]}hrs ${totaltime.split(':')[1]}m ${totaltime.split(':')[2]}sec',
      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16),
    );
  }
}

class ListCardWidget extends StatelessWidget {
  const ListCardWidget({
    Key? key,
    required this.stops,
  }) : super(key: key);

  final List<String> stops;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 310,
            height: MediaQuery.of(context).size.height * 0.38,
            child: ListView.builder(
              // semanticChildCount: 5,
              shrinkWrap: false,
              itemCount: stops.length,
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 6.7,
                        ),
                        const Icon(
                          Icons.circle_outlined,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 250,
                          child: Text(
                            stops[index],
                            overflow: TextOverflow.clip,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class EndPointWidget extends StatelessWidget {
  const EndPointWidget({
    Key? key,
    required this.selected,
  }) : super(key: key);

  final String selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 16,
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  width: 50,
                  color: Colors.transparent,
                  child: Icon(Icons.subdirectory_arrow_right),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'End Point'.toUpperCase(),
                    textScaleFactor: 1.05,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    width: 260,
                    child: Text(
                      selected,
                      textScaleFactor: 1.1,
                      overflow: TextOverflow.visible,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
