import 'batteryDemo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BatteryChartForm extends StatefulWidget {
  const BatteryChartForm({
    Key key,
  }) : super(key: key);

  @override
  _BatteryChartFormState createState() => _BatteryChartFormState();
}

class _BatteryChartFormState extends State<BatteryChartForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  Map<String, dynamic> dataForm = {
    "whichBattery": {},
    "batteryRemain": null,
    "energyConsumption": null,
    "timeLeft": null,
    "lifeCycle": null,
    "highest": null,
    "lowest": null,
  };
  saveData() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BatteryDemoPage(
            dataForm: dataForm,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, bottom: 5.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Battery Component Data Form'),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 15.0, bottom: 5.0),
                    child: Text('Please fill all the constraints.')),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, bottom: 5.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Which Battery",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            color: Color(0xFFF44242),
                          ),
                        ),
                        errorStyle: TextStyle(color: Color(0xFFF44242)),
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        contentPadding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            // borderSide: BorderSide(color: primary),
                            )),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter all the values';
                        // .pleaseenterhouseflatblocknumber;
                      } else
                        return null;
                    },
                    onSaved: (String value) {
                      dataForm['whichBattery'] = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, bottom: 5.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Battery Remaining'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            color: Color(0xFFF44242),
                          ),
                        ),
                        errorStyle: TextStyle(
                          color: Color(0xFFF44242),
                        ),
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        contentPadding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            // borderSide: BorderSide(color: primary),
                            ),
                      ),
                      validator: (String value) {
                        if (value.isEmpty || int.parse(value) > 100) {
                          return 'please enter all the values';
                          // .pleaseenterapartmentname;
                        } else
                          return null;
                      },
                      onSaved: (String value) {
                        dataForm['batteryRemain'] = value;
                      }),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, bottom: 5.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Energy Consumption'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            color: Color(0xFFF44242),
                          ),
                        ),
                        errorStyle: TextStyle(
                          color: Color(0xFFF44242),
                        ),
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        contentPadding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter all the values';
                        } else
                          return null;
                      },
                      onSaved: (String value) {
                        dataForm['energyConsumption'] = value;
                      }),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, bottom: 5.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("timeLeft"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: TextFormField(
                      // style: textBarlowRegularBlack(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: "In hours",
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            color: Color(0xFFF44242),
                          ),
                        ),
                        errorStyle: TextStyle(
                          color: Color(0xFFF44242),
                        ),
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        contentPadding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                        } else
                          return null;
                      },
                      onSaved: (String value) {
                        dataForm['timeLeft'] = value;
                      }),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, bottom: 5.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Life Cycle'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: TextFormField(
                    maxLength: 15,
                    // style: labelStyle(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        counterText: "",
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        contentPadding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            // borderSide: BorderSide(color: primary),
                            )),
                    validator: (String value) {
                      if (value.isEmpty) {
                      } else
                        return null;
                    },
                    onSaved: (String value) {
                      dataForm['lifeCycle'] = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, bottom: 5.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Highest",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            color: Color(0xFFF44242),
                          ),
                        ),
                        errorStyle: TextStyle(color: Color(0xFFF44242)),
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        contentPadding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            // borderSide: BorderSide(color: primary),
                            )),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter all the values';
                        // .pleaseenterhouseflatblocknumber;
                      } else
                        return null;
                    },
                    onSaved: (String value) {
                      dataForm['highest'] = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, bottom: 5.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Lowest",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            color: Color(0xFFF44242),
                          ),
                        ),
                        errorStyle: TextStyle(color: Color(0xFFF44242)),
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        contentPadding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            // borderSide: BorderSide(color: primary),
                            )),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter all the values';
                        // .pleaseenterhouseflatblocknumber;
                      } else
                        return null;
                    },
                    onSaved: (String value) {
                      dataForm['lowest'] = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 55,
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.29), blurRadius: 5)
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 0.0,
                      right: 0.0,
                    ),
                    child: FlatButton(
                      onPressed: saveData,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Save'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
