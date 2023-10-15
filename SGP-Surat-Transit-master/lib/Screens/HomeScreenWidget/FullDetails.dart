import 'package:flutter/material.dart';

class FullDetails extends StatefulWidget {
  final selected;
  final List avRoute;
  final int index;
  const FullDetails(
      {super.key, this.selected, required this.avRoute, required this.index});

  @override
  State<FullDetails> createState() => _FullDetailsState();
}

class _FullDetailsState extends State<FullDetails> {
  List<String> listOfStation = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listOfStation = widget.avRoute[widget.index].between_Stations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    child: SizedBox(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.selected[0]),
                    )),
                  ),
                  SizedBox(
                    height: 420,
                    child: ListView.builder(
                      itemCount: listOfStation.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(listOfStation[index]),
                        );
                      }),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
