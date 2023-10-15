// ignore: file_names
import 'package:flutter/material.dart';
import 'package:surat_transit/Model/RouteModel.dart';

import '../Model/Object.dart';
import '../Model/listofobj.dart';

class GetMethod {
  late List<String?> station = [];
  List<List<String>> routeStation = [];
  Map<int, dynamic> kl = {};
  late ModelObject x;
  GetMethod() {
    getList();
  }
  List<String?> getListAll() => station;

  void getList() async {
    ListOfObj b = ListOfObj();
    var feachdata = await b.getData();
    x = ModelObject.fromJson(feachdata[0]);
    var listx = [
      x.sACHINGIDCJUNCTIONUDHANADARWAJA11,
      x.uDHANADARWAJASACHINGIDCJUNCTION11,
      x.sARTHANANATUREPARKONGCCOLONY12,
      x.oNGCCOLONYSARTHANANATUREPARK12,
      x.kADODARAJAHANGIRPURACOMMUNITYHALL13,
      x.jAHANGIRPURACOMMUNITYHALLKADODARA13,
      x.kOSADEWSH2TOONGCCOLONY14,
      x.oNGCCOLONYTOKOSADEWSH214,
      x.dINDOLIVARIGRUHKOSADDEPOT16,
      x.kOSADDEPOTDINDOLIVARIGRUH16,
      x.pALRTOKAMREJTERMINAL17A,
      x.kAMREJTERMINALPALRTO17A,
      x.sACHINRAILWAYSTATIONKAMREJTERMINAL17AE,
      x.kAMREJTERMINALSACHINRAILWAYSTATION17AE,
      x.uTRANROBRAILWAYSTATIONTERMINAL18,
      x.rAILWAYSTATIONTERMINALUTRANROB18,
      x.kADODARARAILWAYSTATIONTERMINAL19,
      x.rAILWAYSTATIONTERMINALKADODARA19,
      x.kHARWARNAGARKOSADEWSH220,
      x.kOSADEWSH2KHARWARNAGAR20,
      x.pANDESARAGIDCJAHANGIRPURACOMMUNITYHALL21,
      x.jAHANGIRPURACOMMUNITYHALLPANDESARAGIDC21,
      x.tULSHIDHAMJAHANGIRPURACOMMUNITYHALL21E,
      x.jAHANGIRPURACOMMUNITYHALLTULSHIDHAM21E,
      x.sARTHANANATUREPARKKOSADEWSH222,
      x.kOSADEWSH2SARTHANANATUREPARK22,
      x.mOTIVEDTORAILWAYSTATIONVIARINGROAD102R,
      x.rAILWAYSTATIONTOMOTIVEDVIARINGROAD102R,
      x.kATHORGAAMTORAILWAYSTATION103K,
      x.rAILWAYSTATIONTOKATHORGAAM103K,
      x.sHEKHPURGAAMTORAILWAYSTATIONEAST103S,
      x.rAILWAYSTATIONEASTTOSHEKHPURGAAM103S,
      x.vELANJAGAAMTORAILWAYSTATIONEAST103V,
      x.rAILWAYSTATIONEASTTOVELANJAGAAM103V,
      x.vRUKSHLAXMISOCIETYRAILWAYSTATIONTERMINAL104,
      x.rAILWAYSTATIONTERMINALVRUKSHLAXMISOCIETY104,
      x.cHIKUWADIRAILWAYSTATIONTERMINAL105,
      x.rAILWAYSTATIONTERMINALCHIKUWADI105,
      x.aBHVAGAAMTORAILWAYSTATIONVIARINGROAD106R,
      x.rAILWAYSTATIONTOABHVAGAAMVIARINGROAD106R,
      x.vIVEKANANDCOLLEGETORAILWAYSTATIONVIACHANDRASHEKHARAZADBRIDGE107J,
      x.rAILWAYSTATIONTOVIVEKANANDCOLLEGEVIACHANDRASHEKHARAZADBRIDGE107J,
      x.lALWATALAAVOLPADTORAILWAYSTATIONVIARINGROAD108R,
      x.rAILWAYSTATIONTOLALWATALAAVOLPADVIARINGROAD108R,
      x.kOSADGAMRAILWAYSTATIONTERMINAL112,
      x.rAILWAYSTATIONTERMINALKOSADGAM112,
      x.kHAJODGAMTORAILWAYSTATIONVIABHIMRADVIARINGROAD116BR,
      x.rAILWAYSTATIONTOKHAJODGAMVIABHIMRADVIARINGROAD116BR,
      x.kHAJODGAMTORAILWAYSTATIONVIARINGROAD116R,
      x.rAILWAYSTATIONTOKHAJODGAMVIARINGROAD116R,
      x.sUMANJYOTEWSRAILWAYSTATIONTERMINAL117,
      x.rAILWAYSTATIONTERMINALSUMANJYOTEWS117,
      x.sAYANRAILWAYRAILWAYSTATIONTERMINAL118,
      x.rAILWAYSTATIONTERMINALSAYANRAILWAY118,
      x.sOMESHWARJUNCTIONRAILWAYSTATIONVIARINGROAD126R,
      x.rAILWAYSTATIONSOMESHWARJUNCTIONVIARINGROAD126R,
      x.rANDERGAAMTORAILWAYSTATIONVIACHANDRASHEKHARAZADBRIDGE127J,
      x.rAILWAYSTATIONTORANDERGAAMVIACHANDRASHEKHARAZADBRIDGE127J,
      x.sURATAIRPORTRAILWAYSTATIONTERMINAL136,
      x.rAILWAYSTATIONTERMINALSURATAIRPORT136,
      x.vARIAVGAAMTORAILWAYSTATIONVIACHANDRASHEKHARAZADBRIDGE137J,
      x.rAILWAYSTATIONTOVARIAVGAAMVIACHANDRASHEKHARAZADBRIDGE137J,
      x.gREENCITYBHATHATORAILWAYSTATIONEASTVIACHANDRASHEKHARAZADBRIDGE147J,
      x.rAILWAYSTATIONEASTTOGREENCITYBHATHAVIACHANDRASHEKHARAZADBRIDGE147J,
      x.kAPODRATOUMRAGAAMVIARINGROAD153R,
      x.uMRAGAAMTOKAPODRAVIARINGROAD153R,
      x.lAXMIDHAMSOCLOOPTOCHOWKVIACHANDRA202J,
      x.cHOWKTOLAXMIDHAMSOCLOOPVIACHANDRA202J,
      x.rAJEMPIREGODADARACHOWKTERMINAL204,
      x.cHOWKTERMINALRAJEMPIREGODADARA204,
      x.gABHENIGAAMCHOWKTERMINAL205G,
      x.cHOWKTERMINALGABHENIGAAM205G,
      x.lAJPOREJAILCHOWKTERMINAL205K,
      x.cHOWKTERMINALLAJPOREJAIL205K,
      x.dUMASLANGERCHOWKTERMINALVIACKPITHAWALAENGCOLLEGE206,
      x.cHOWKTERMINALDUMASLANGERVIACKPITHAWALAENGCOLLEGE206,
      x.vAISHNODEVISKYCHOWKTERMINAL207E,
      x.cHOWKTERMINALVAISHNODEVISKY207E,
      x.vRUKSHLAXMISOCIETYDRSPMUKHERBRID209J,
      x.dRSPMUKHERBRIDVRUKSHLAXMISOCIETY209J,
      x.vARIAVGAAMUTOMAKKIPOLTERMINALVIACHANDR212J,
      x.mAKKIPOLTERMINALTOVARIAVGAAMUVIACHANDR212J,
      x.sARTHANANATUREPARKTODABHOLIGAAM213,
      x.dABHOLIGAAMTOSARTHANANATUREPARK213,
      x.dUMASLANGARTOCHOWKTERMINALVIABHIMPORE216B,
      x.cHOWKTERMINALTODUMASLANGARVIABHIMPORE216B,
      x.dUMASLANGARCHOWKTERMINALVIAKAADIFALIYA216K,
      x.cHOWKTERMINALDUMASLANGARVIAKAADIFALIYA216K,
      x.bHESANGAAMMAKKAIPOOLVIAMORABHAG217M,
      x.mAKKAIPOOLBHESANGAAMVIAMORABHAG217M,
      x.bHESANGAAMMAKKAIPOOL217,
      x.mAKKAIPOOLBHESANGAAM217,
      x.vNSGUNIVERSITYTOKOSADGAMVIACHANDR226J,
      x.kOSADGAMTOVNSGUNIVERSITYVIACHANDR226J,
      x.mANGALPANDEYHALLGODADARASUMANDARSHAN254,
      x.sUMANDARSHANMANGALPANDEYHALLGODADARA254,
      x.dABHOLITOKHARWARNAGAR302,
      x.kHARWARNAGARTODABHOLI302,
      x.vEDGAAMTOKHARWARNAGAR302V,
      x.kHARWARNAGARTOVEDGAAM302V,
      x.uNNINDUSTRIALESTATEKHARWARNAGAR305,
      x.kHARWARNAGARUNNINDUSTRIALESTATE305,
      x.bHESTANGARDENTOKHARWARNAGAR315,
      x.kHARWARNAGARTOBHESTANGARDEN315,
      x.uTRANRAILWAYSTATIONPUNACANAL402,
      x.pUNACANALUTRANRAILWAYSTATION402,
      x.sANKALPRESIDENCYSMCWARDOFFICELIMBAYAT403,
      x.sMCWARDOFFICELIMBAYATSANKALPRESIDEN403,
      x.uTRANSTATIONUTRANSTATIONSTARTEN410,
      x.bHESTANGARDENAMAZIAAMUSEMENTPARK504,
      x.uTRANSTATIONSTARTUTRANSTATIONEN410,
      x.aMAZIAAMUSEMENTPARKBHESTANGARDEN504,
      x.bUDIYAGAAMTOMILANPOINTBAMROLI505,
      x.mILANPOINTBAMROLITOBUDIYAGAAM505,
      x.bUDIYAGAAMTOCHIKUWADI505C,
      x.cHIKUWADITOBUDIYAGAAM505C,
      x.vESUGAAMSUNRISEVIDYALAYDINDOLI506,
      x.sUNRISEVIDYALAYDINDOLIVESUGAAM506,
      x.mORACHARRASTAADAJANGSRTC658,
      x.aDAJANGSRTCMORACHARRASTA658,
      x.vNSGUNIVERSITYISKCONCIRCLE706,
      x.iSKCONCIRCLEVNSGUNIVERSITY706,
      x.gAILCOLONYVESUTOJAHANGIRPURA716,
      x.jAHANGIRPURATOGAILCOLONYVESU716,
      x.yOGICHOWKTOPASODARA903,
      x.pASODARATOYOGICHOWK903
    ];
    for (var i = 0; i < listx.length; i++) {
      kl[i] = listx[i];
    }
    for (var element in feachdata) {
      (element as Map<String, dynamic>).forEach((key, value) {
        List<String> x = [];
        for (var element in (value as List)) {
          if (!station.contains(element['Stop Names'])) {
            (station).add(element['Stop Names']);
          }
          x.add(element['Stop Names']);
        }
        routeStation.add(x);
      });
    }
  }

  List findRoute(String s, String e) {
    List<int> aviRoute = [];
    for (var element in routeStation) {
      if ((element.contains(s) && element.contains(e)) &&
          element.indexOf(s) < element.indexOf(e)) {
        aviRoute.add(routeStation.indexOf(element));
      }
    }
    // print(aviRoute);
    //if direct route is not possible .
    if (aviRoute.isEmpty) {
      List<int> sIndex = [];
      List<int> eIndex = [];
      for (var element in routeStation) {
        if (element.contains(s)) {
          sIndex.add(routeStation.indexOf(element));
        }
        if (element.contains(e)) {
          eIndex.add(routeStation.indexOf(element));
        }
      }
      // print('s:$sIndex\ne:$eIndex');
      List gy = [];
      for (var element in sIndex) {
        List<String> commanpoint;
        for (var element1 in eIndex) {
          commanpoint = findtrav(routeStation[element], routeStation[element1]);
          if (commanpoint.isNotEmpty) {
            // print('s[$element]-e[$element1]:$commanpoint\n');

            for (var cp in commanpoint) {
              RouteModel x = route(kl, element, cp, element1, s, e);
              if (x.between_Stations.isNotEmpty) {
                gy.add(x);
              }
            }
          }
        }
      }
      if (gy.isEmpty) {
        return ['No'];
      }
      return gy;
    }
    // direct route is possible .
    List possibleRoute = [];
    for (var element in aviRoute) {
      List<String> between = [];
      int ptno = 0;
      var time;
      String routeName = '${kl[element][0].runtimeType}';
      bool f = false;
      for (var el in kl[element]) {
        if (el.stopNames == s) {
          ptno = el.platformNo;
          // print(el.srNo);
          f = true;
        }
        if (f) {
          between.add(el.stopNames);
        }
        if (el.stopNames == e) {
          time = el.travelTimeHhMmSs;
          f = false;
        }
      }
      // print(between);
      RouteModel r = RouteModel(
        pt_no: ptno,
        time: time,
        distance: 0,
        between_Stations: between,
        startendroute: routeName,
      );

      possibleRoute.add(r);
      // print('\n');
    }
    return possibleRoute;
  }
}

RouteModel route(
  var k,
  int routeStation,
  String commanpoint,
  int routeStation2,
  String s,
  String e,
) {
  List<String> c1 = [], c2 = [];
  var flag = false;
  var flag1 = false;
  var pt_no = [];
  // print('${routeStation.indexOf(s)}<${routeStation.indexOf(commanpoint)}');
  for (var element in k[routeStation]) {
    if (element.stopNames == s) {
      // print('pt_s:${element.platformNo}');
      pt_no.add(element.platformNo);
      flag = true;
    }
    if (flag) {
      c1.add(element.stopNames);
    }
    if (element.stopNames == commanpoint) {
      pt_no.add(element.platformNo);
      flag = false;
      break;
    }
  }
  c1.add('travel');
  for (var element in k[routeStation2]) {
    if (element.stopNames == commanpoint) {
      // print('291:pt_c:${element.platformNo}');
      flag1 = true;
    }
    if (flag1) {
      c2.add(element.stopNames);
    }
    if (element.stopNames == e) {
      flag1 = false;
      // print('pt_e:${element.platformNo}');
      pt_no.add(element.platformNo);
      break;
    }
  }
  if (c1.length > 1 && c2.isNotEmpty) {
    // print('C1:$c1\nC2:$c2');
  }
  List<String> c = c1 + c2;
  // print('308:lenC1:${c1.length}--lenC2:${c2.length}');
  RouteModel r1;
  if (c[0] == 'travel' || c[c.length - 1] == 'travel') {
    r1 = RouteModel(
      pt_no: 0,
      time: '',
      distance: 0,
      between_Stations: [],
      startendroute: s,
    );
    return r1;
  }
  // print('C:$c\n');
  // print(
  //   '196:${k[routeStation][1].runtimeType}-${k[routeStation2][1].runtimeType}',
  // );
  String s1 =
      '${k[routeStation][1].runtimeType}-${k[routeStation2][1].runtimeType}';
  r1 = RouteModel(
    pt_no: pt_no[0],
    time: '',
    distance: 0,
    between_Stations: c,
    startendroute: s1,
  );
  return r1;
}

List<String> findtrav(List<String> routeStation, List<String> routeStation2) {
  List<String> l = [];
  for (var element in routeStation) {
    for (var element1 in routeStation2) {
      if (element == element1) {
        l.add(element);
      }
    }
  }

  return l;
}

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(fontSize: 14),
    ),
    backgroundColor: color,
  ));
}

void nextScreen(context, nextScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: ((context) => nextScreen),
    ),
  );
}
