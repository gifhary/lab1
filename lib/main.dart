import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  int _radioValue = 0;
  String result = '';

  @override
  void dispose() {
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMR Calculator'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'img/logo.png',
                height: 200,
                width: 200,
              ),
              Row(
                children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                  ),
                  Text('Male'),
                  new Radio(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                  ),
                  Text('Female'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                    controller: ageController,
                    decoration: InputDecoration(hintText: 'Age'),
                    keyboardType: TextInputType.number),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                    controller: heightController,
                    decoration: InputDecoration(hintText: 'Height (cm)'),
                    keyboardType: TextInputType.number),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                    controller: weightController,
                    decoration: InputDecoration(hintText: 'Weight (kg)'),
                    keyboardType: TextInputType.number),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton.icon(
                    color: Colors.blue,
                    icon: Icon(Icons.blur_circular),
                    label: Text('Calculate'),
                    onPressed: () => _calculate(ageController.text, heightController.text, weightController.text),
                    ),
              ),
              Row(
                children: <Widget>[
                  Text('Your BMR : ', style: TextStyle(fontSize: 20)),
                  Text(result, style: TextStyle(fontSize: 20),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  void _calculate(String age, String height, String weight) {
    int ageNum = int.parse(age);
    int heightNum = int.parse(height);
    int weightNum = int.parse(weight);

    if (_radioValue == 0){//male selected
        double calculate = (10 * weightNum) + (6.25 * heightNum) - (5 * ageNum) + 5;
        print(calculate);
        setState(() {
          result = calculate.toString();
        });
    } else {
      double calculate = (10 * weightNum) + (6.25 * heightNum) - (5 * ageNum) - 161;
      print(calculate);
      setState(() {
          result = calculate.toString();
        });
    }

  }
}
