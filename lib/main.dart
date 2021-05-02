import 'package:flutter/material.dart';
import 'package:number_to_words_spelling/number_to_words_spelling.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Calculator();
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double costperitem = 40;
  double totalcostperitem = 0;
  double totalnos = 0;
  double taxperitem = 0;
  double totaltax = 0;
  double totalamount = 0;
  String wordEn = 'nil';
  void calculate() {
    taxperitem = 0.18 * costperitem;
    totaltax = 0.18 * costperitem * totalnos;
    totalcostperitem = 1.18 * costperitem;
    totalamount = totalcostperitem * totalnos;
    wordEn =
        NumberWordsSpelling.toWord(totalamount.toStringAsFixed(0), 'en_US');
    print(wordEn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'home': (context) => Calculator()},
      debugShowCheckedModeBanner: false,
      title: "Veil Healthcare",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Veil Healthcare Easybilling",
          ),
          centerTitle: true,
          elevation: 10,
          backgroundColor: Colors.lightBlue[900],
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: SafeArea(
            child: ListView(
          children: <Widget>[
            Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.amberAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Total number',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 25),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        totalnos = double.parse(value);
                        calculate();

                        setState(() {});
                      },
                    ),
                  ))
                ],
              ),
            ),
            Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.amberAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Cost per item',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 25),
                      initialValue: '40',
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        costperitem = double.parse(value);
                        calculate();
                        setState(() {});
                      },
                    ),
                  ))
                ],
              ),
            ),
            Container(
              color: Colors.blueGrey,
              height: 3,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.amber[700],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '9% :',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Center(
                                child: Text(
                              (totaltax / 2).toStringAsFixed(2),
                              textScaleFactor: 2,
                            )),
                          ),
                          flex: 2,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.amber[700],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Text(
                              '18%:',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Center(
                              child: Text(
                                totaltax.toStringAsFixed(2),
                                textScaleFactor: 1.8,
                              ),
                            ),
                          ),
                          flex: 2,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.amber[700],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Total Amount',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Center(
                        child: Text(
                      totalamount.toStringAsFixed(2),
                      textScaleFactor: 2,
                    )),
                  ))
                ],
              ),
            ),
            Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.amber[700],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Amount in words',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Center(
                        child: Text(
                      wordEn[0].toUpperCase() + wordEn.substring(1),
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.grey[700]),
                    )),
                  ))
                ],
              ),
            ),
            Container(
              color: Colors.blueGrey,
              height: 3,
            ),
            Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.amberAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Tax per item',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Center(
                        child: Text(
                      taxperitem.toStringAsFixed(2),
                      textScaleFactor: 2,
                    )),
                  ))
                ],
              ),
            ),
            Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.amberAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Total Cost per item',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Center(
                        child: Text(
                      totalcostperitem.toStringAsFixed(2),
                      textScaleFactor: 2,
                    )),
                  ))
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
