import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:luweb/view/ubicacion.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCode extends StatefulWidget {
  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
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
        margin: EdgeInsets.only(top: height / 8),
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
                  margin: EdgeInsets.all(40),
                  child: Center(
                    child: Text(
                      'Ingresa el código de seguridad que se te envió vía WhatsApp.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(101, 79, 168, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: height / 32),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(right: width / 5, left: width / 5),
                child: PinCodeTextField(
                  length: 5,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    inactiveFillColor: Color.fromRGBO(230, 224, 237, 0.5),
                    inactiveColor: Color.fromRGBO(101, 79, 168, 1),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    selectedColor: Color.fromRGBO(101, 79, 168, 1),
                    selectedFillColor: Color.fromRGBO(225, 206, 239, 1),
                    activeColor: Color.fromRGBO(101, 79, 168, 1),
                    activeFillColor: Color.fromRGBO(230, 224, 237, 0.5),
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  onCompleted: (v) {},
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  appContext: context,
                ),
              ),
              Container(
                child: Image.asset(
                  'assets/Logo/Usuaria.png',
                  height: height / 11.5,
                ),
              ),
              BouncingWidget(
                  duration: Duration(milliseconds: 100),
                  scaleFactor: 1.5,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ubicacion()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: Color.fromRGBO(101, 79, 168, 1),
                    child: Container(
                      width: width / 2,
                      height: height / 20,
                      child: Text(
                        "Verificar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
