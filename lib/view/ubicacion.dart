import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class Ubicacion extends StatefulWidget {
  @override
  _UbicacionState createState() => _UbicacionState();
}

class _UbicacionState extends State<Ubicacion> {
  double height = 0;
  double width = 0;

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
        margin: EdgeInsets.only(top: height / 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
              Container(
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
                            children: [
                              Image(
                                height: height / 9,
                                image: AssetImage('assets/Logo/Lu_logo.png'),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: height / 25,
                                  margin: EdgeInsets.only(right: width / 10),
                                  child: Text(
                                    '  Conductora:',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(102, 51, 204, 1),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                ),
                                Container(
                                  height: height / 25,
                                  margin: EdgeInsets.only(right: width / 8.5),
                                  child: Text(
                                    'Modelo:',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(102, 51, 204, 1),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                ),
                                Container(
                                  height: height / 25,
                                  margin: EdgeInsets.only(right: width / 7.8),
                                  child: Text(
                                    'Placa:',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(102, 51, 204, 1),
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
                  )))
            ],
          ),
        ),
      ),
    ));
  }
}
