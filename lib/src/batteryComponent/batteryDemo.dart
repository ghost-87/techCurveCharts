import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'batteryChartData.dart';

class BatteryDemoPage extends StatefulWidget {
  BatteryDemoPage({Key key, this.dataForm}) : super(key: key);
  final Map<String, dynamic> dataForm;
  @override
  _BatteryDemoPageState createState() => _BatteryDemoPageState();
}

class _BatteryDemoPageState extends State<BatteryDemoPage> {
  int minsLeft = 0;
  var daysLeft = 0;
  void initState() {
    print('apppppppppppppp');
    print(widget.dataForm);
    // int hoursLeft = int.parse(widget.dataForm['timeLeft']);
    // print(hoursLeft.runtimeType);
    // minsLeft = (hoursLeft % 24);
    // daysLeft = (hoursLeft / 24).toString() as int;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Battery Demo Page'),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 8.0, left: 20.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Battery',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20, height: 2, fontWeight: FontWeight.bold),
                ),
                FlatButton(
                  child: new Text(
                    'EDIT',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BatteryChartForm(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 300,
                    ),
                    // width: 100,
                    // height: 100,
                    child: Container(
                      child: Row(children: <Widget>[
                        CustomPaint(
                          painter: OpenPainter(
                              battery: widget.dataForm['batteryRemain']),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, bottom: 0.0, left: 0.0, right: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.dataForm['whichBattery'] + ' Battery',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.dataForm['batteryRemain'] + ' %',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Battery Remaining',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.dataForm['energyConsumption'] + ' kWh',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            // daysLeft.toString() +
                            ' days' +
                                // minsLeft.toString() +
                                ' hours',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.dataForm['highest'] +
                                ' kWh' +
                                widget.dataForm['lowest'] +
                                ' kWh',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              // height: 20,
                              ),
                          Text(
                            'Life Cycle',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.dataForm['lifeCycle'] + ' / 50000',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                ]),
          )
        ]));
  }
}

class OpenPainter extends CustomPainter {
  OpenPainter({Key key, this.battery});
  final String battery;

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0
      ..color = Colors.indigo;
    var paint2 = Paint()
      ..strokeWidth = 8.0
      ..color = Colors.indigo;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(20, 20, 200, 550), Radius.circular(15)),
        paint1);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(35, 60, 170, 40), Radius.circular(15)),
        int.parse(battery) < 100 ? paint1 : paint2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(35, 110, 170, 40), Radius.circular(15)),
        int.parse(battery) < 90 ? paint1 : paint2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(35, 160, 170, 40), Radius.circular(15)),
        int.parse(battery) < 80 ? paint1 : paint2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(35, 210, 170, 40), Radius.circular(15)),
        int.parse(battery) < 70 ? paint1 : paint2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(35, 260, 170, 40), Radius.circular(15)),
        int.parse(battery) < 60 ? paint1 : paint2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(35, 310, 170, 40), Radius.circular(15)),
        int.parse(battery) < 50 ? paint1 : paint2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(35, 360, 170, 40), Radius.circular(15)),
        int.parse(battery) < 40 ? paint1 : paint2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(35, 410, 170, 40), Radius.circular(15)),
        int.parse(battery) < 30 ? paint1 : paint2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(35, 460, 170, 40), Radius.circular(15)),
        int.parse(battery) < 20 ? paint1 : paint2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(35, 510, 170, 40), Radius.circular(15)),
        int.parse(battery) < 10 ? paint1 : paint2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(40, 0, 50, 50), Radius.circular(5)),
        int.parse(battery) < 10 ? paint1 : paint2);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(150, 0, 50, 50), Radius.circular(5)),
        int.parse(battery) < 10 ? paint1 : paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
