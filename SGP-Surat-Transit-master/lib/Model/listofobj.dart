import 'dart:convert';

import 'package:flutter/services.dart';

class ListOfObj {
  Future<dynamic> readJson() async {
    final String jsondata =
        await rootBundle.loadString('lib/DATA/master-data.json');
    final list = json.decode(jsondata);
    return list;
  }

  Future<List> getData() async {
    final datajs = await readJson();
    return datajs;
  }
}
