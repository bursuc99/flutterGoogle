import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: moneyConverter(),
));

class moneyConverter extends StatefulWidget {
  const moneyConverter({Key? key}) : super(key: key);

  @override
  _moneyConverterState createState() => _moneyConverterState();
}

class _moneyConverterState extends State<moneyConverter> {

  String? _errorMessage;
  String? _sum;
  String? _sumLei;


  bool isValid(String text) {

    RegExp regExp = RegExp(r'^\d*\.?\d*$');
    return regExp.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Center(
              child: Text('Converteste banii Bossule',
                 ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.fromLTRB(15, 10, 20, 15),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                        'https://storage0.dms.mpinteractiv.ro/media/1/1/4728/18600178/3/money-351078-1920.jpg?width=310',
                      scale: 0.7 ,
                    ),
                    Text("GBP -> LEI",
                         style: TextStyle(fontSize: 40),
                    ),
                    Container(
                        child: Column(children: <Widget>[
                          TextField(
                            onChanged: (String value) {
                              setState(() {
                                if (value.isEmpty) {
                                  _sum = null;
                                } else {
                                  _sum = value;
                                }
                              });
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(errorText: _errorMessage),
                          ),
                          RaisedButton(
                            onPressed: () {
                              if (_sum != null) {
                                if (isValid(_sum!)) {
                                  var gbp = double.parse(_sum!);
                                  var lei = gbp * 5.72;
                                  setState(() {
                                    _sumLei = lei.toStringAsFixed(2);
                                  });
                                  _errorMessage = null;
                                } else {
                                  setState(() {
                                    _errorMessage = "Incorrect input";
                                    _sumLei = null;
                                  });
                                }
                              } else {
                                setState(() {
                                  _errorMessage = null;
                                  _sumLei = null;
                                });
                              }
                            },
                            child: Text('Convert'),
                            color: Colors.cyan,
                          ),
                          if (_sumLei != null) Text(_sumLei!) else Text("")
                        ])),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
