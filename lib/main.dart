import 'package:flutter/material.dart';
import 'Convert.dart';
import 'History.dart';
import 'Result.dart';
import 'Input.dart';


void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyApp> {
TextEditingController etInput = new TextEditingController();

  double _inputUser = 0;
  String _newValue = "Kelvin";
  double _result = 0;
   


  void _konversiSuhu() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;

        else if (_newValue == "Farenheit")
        _result = (_inputUser * 9/5 ) + 32;
         
        else
        _result = (4 / 5) * _inputUser;
        listViewItem.add("$_newValue : $_result");
    });
  }

var listItem = {"Kelvin", "Reamur","Farenheit"};
// ignore: deprecated_member_use
List<String> listViewItem = List<String>();

DropdownButton<String> buildDropdownButton() {
    return DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: (String changeValue) {
                  setState(() {
                    _newValue = changeValue;
                    _konversiSuhu();
                  });
                },
              );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Konverter Suhu"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Input(etInput: etInput),
                buildDropdownButton(),
                Result(
                  result: _result,
                ),
                Convert(konvertHandler: _konversiSuhu),
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "History Konversi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Expanded(
                    child: History(listViewItem: listViewItem)),
              ],
            ),
          ),
        ));
  }
  }
