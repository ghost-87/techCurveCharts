import 'package:flutter/material.dart';
import 'flChartLineDemo.dart';
import 'slider.dart';

class LineChartDemo extends StatefulWidget {
  LineChartDemo({Key key, this.dataForm}) : super(key: key);
  final Map<String, dynamic> dataForm;

  @override
  _LineChartDemoState createState() => _LineChartDemoState();
}

class _LineChartDemoState extends State<LineChartDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Line Chart Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            // FlLineChart(dataForm: widget.dataForm),
            SizedBox(
              width: 50,
            ),
            RangeSliderSample(),
            // SizedBox(
            //   height: 100,
            // ),
          ],
        ),
      ),
    );
  }
}
