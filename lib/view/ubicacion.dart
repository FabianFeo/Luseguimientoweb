import 'dart:html';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:luweb/service/emergenciaCollectionService.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

class Ubicacion extends StatefulWidget {
  final String pinCode;
  const Ubicacion({Key key, @required this.pinCode}) : super(key: key);
  @override
  _UbicacionState createState() => _UbicacionState();
}

class _UbicacionState extends State<Ubicacion> {
  double height = 0;
  Set<Polyline> polylines = Set();

  double width = 0;
  LatLng _initialcameraposition = LatLng(4.6097100, -74.0817500);
  Set<Marker> _markers = Set();
  EmergenciaCollectionService _emergenciaCollectionService =
      EmergenciaCollectionService();
  var errorController;

  var textEditingController;

  String currentText;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          borderRadius: BorderRadius.all(Radius.circular(90))),
                      height: height ,
                      width: width,
                      child: StreamBuilder(
                          stream: _emergenciaCollectionService
                              .getEmergenciaPoints(widget.pinCode),
                          builder: (_, AsyncSnapshot<QuerySnapshot> asyncS) {
                            return asyncS.data != null && asyncS.hasData
                                ? getMap(asyncS.data.docs)
                                : CircularProgressIndicator();
                          }))),
              Container(
                color: Colors.transparent,
                  child: Center(
                child: Text(
                  'UBICACIÓN EN TIEMPO REAL.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: height / 20,
                    color: Color.fromRGBO(101, 79, 168, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
              StreamBuilder(
                  stream: _emergenciaCollectionService
                      .getEmergencia(widget.pinCode),
                  builder: (_, AsyncSnapshot<DocumentSnapshot> asyncS) {
                    if (asyncS.data != null && asyncS.data.exists) {
                      asyncS.data.data();
                      return Container(
                          margin: EdgeInsets.only(top: height / 2),
                          child: Center(
                              child: Container(
                            height: height / 4,
                            width: width / 2.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: Color.fromRGBO(207, 197, 239, 1),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: height / 25,
                                          margin: EdgeInsets.only(
                                              right: width / 10),
                                          child: Text(
                                            '  Conductora:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    102, 51, 204, 1),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Container(
                                          height: height / 25,
                                          margin: EdgeInsets.only(
                                              right: width / 8.5),
                                          child: Text(
                                            'Modelo:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    102, 51, 204, 1),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Container(
                                          height: height / 25,
                                          margin: EdgeInsets.only(
                                              right: width / 7.8),
                                          child: Text(
                                            'Placa:',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    102, 51, 204, 1),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )));
                    } else {
                      return Container();
                    }
                  }),
            ],
          ),
        ),
      ),
    ));
  }

  Widget getMap(List<QueryDocumentSnapshot> docs) {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(docs[0].data()['lat'],docs[0].data()['lng']);

    
      List<LatLng> point = List();
      docs
        ..forEach((element) {
          point.add(LatLng(element['lat'], element['lng']));
        });
          final mapOptions = MapOptions()
        ..zoom = 25
        ..center = myLatlng;

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';
      final map = GMap(elem, mapOptions);
      Polyline(PolylineOptions()
        ..map = map
        ..path = point);
      
      
      
      

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}
