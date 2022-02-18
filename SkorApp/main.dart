import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: firstPage(),
    );
  }
}

class firstPage extends StatefulWidget {
  const firstPage({Key? key}) : super(key: key);

  @override
  _firstPageState createState() => _firstPageState();
}

TextEditingController play1 = new TextEditingController();
TextEditingController play2 = new TextEditingController();
TextEditingController play3 = new TextEditingController();
TextEditingController play4 = new TextEditingController();

List skor1 = []; //di listview & summskor
List skor2 = [];
List skor3 = [];
List skor4 = [];

num jumskor1 = 0;
num jumskor2 = 0;
num jumskor3 = 0;
num jumskor4 = 0;

List<Map<String, dynamic>> dataChar1 = [];
List<Map<String, dynamic>> dataChar2 = [];
List<Map<String, dynamic>> dataChar3 = [];
List<Map<String, dynamic>> dataChar4 = [];

//tidak masuk json
var input1 = 0;
var input2 = 0;
var input3 = 0;
var input4 = 0;

var aktif = 0;

class _firstPageState extends State<firstPage> {
  Future<void> setPreferences() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey('mySave')) {
      pref.clear();
    }
    final mySave = json.encode({
      'play1': play1.toString(),
      'play2': play2.toString(),
      'play3': play3.toString(),
      'play4': play4.toString(),
      'skor1': skor1.toString(),
      'skor2': skor2.toString(),
      'skor3': skor3.toString(),
      'skor4': skor4.toString(),
      'jumskor1': jumskor1.toString(),
      'jumskor2': jumskor2.toString(),
      'jumskor3': jumskor3.toString(),
      'jumskor4': jumskor4.toString(),
      'dataChar1': dataChar1.toString(),
      'dataChar2': dataChar2.toString(),
      'dataChar3': dataChar3.toString(),
      'dataChar4': dataChar4.toString(),
    });

    pref.setString('mySave', mySave);
    setState(() {});
  }

  Future<void> getPreferences() async {
    final pref = await SharedPreferences.getInstance();

    if (pref.containsKey('mySave')) {
      // final myData =
      //     json.decode(pref.get('mySave')) as Map<String, dynamic>;
    }
    final mySave = json.encode({
      'play1': play1,
      'play2': play2,
      'play3': play3,
      'play4': play4,
      'skor1': skor1,
      'skor2': skor2,
      'skor3': skor3,
      'skor4': skor4,
      'jumskor1': jumskor1,
      'jumskor2': jumskor2,
      'jumskor3': jumskor3,
      'jumskor4': jumskor4,
      'dataChar1': dataChar1,
      'dataChar2': dataChar2,
      'dataChar3': dataChar3,
      'dataChar4': dataChar4,
    });

    pref.setString('mySave', mySave);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skor"),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                flex: 2,
                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.redAccent,
                          child: Column(
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  controller: play1,
                                  keyboardType: TextInputType.name,
                                  // decoration: InputDecoration(labelText: 'Name'),
                                ),
                              ),
                              Flexible(
                                  child: Center(
                                      child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      "$jumskor1",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              )))
                            ],
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.greenAccent,
                          child: Column(
                            children: [
                              Flexible(
                                child: TextField(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  controller: play2,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                              Flexible(
                                  child: Center(
                                      child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      "$jumskor2",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              )))
                            ],
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.blueAccent,
                          child: Column(
                            children: [
                              Flexible(
                                child: TextField(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  controller: play3,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                              Flexible(
                                  child: Center(
                                      child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      "$jumskor3",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              )))
                            ],
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.yellowAccent,
                          child: Column(
                            children: [
                              Flexible(
                                child: TextField(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  controller: play4,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                              Flexible(
                                  child: Center(
                                      child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      "$jumskor4",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              )))
                            ],
                          ),
                        )),
                  ],
                )),
            Flexible(
                //skor input
                flex: 1,
                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.red[100],
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  input1 = aktif;
                                });
                              },
                              child: Container(
                                  child: Text(
                                "$input1",
                                style: TextStyle(fontSize: 18),
                              )),
                            ),
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.green[100],
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  input2 = aktif;
                                });
                              },
                              child: Container(
                                  child: Text(
                                "$input2",
                                style: TextStyle(fontSize: 18),
                              )),
                            ),
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.blue[100],
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  input3 = aktif;
                                });
                              },
                              child: Container(
                                  child: Text(
                                "$input3",
                                style: TextStyle(fontSize: 18),
                              )),
                            ),
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.yellow[100],
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  input4 = aktif;
                                });
                              },
                              child: Container(
                                  child: Text(
                                "$input4",
                                style: TextStyle(fontSize: 18),
                              )),
                            ),
                          ),
                        ))
                  ],
                )),
            Flexible(
                //bottom controller
                flex: 6,
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black12,
                        child: Column(
                          children: [
                            Expanded(
                                child: ListView.builder(
                              itemCount: skor1.length,
                              itemBuilder: (context, index) => Center(
                                  child: Text(
                                skor1[index].toString(),
                                style: TextStyle(fontSize: 15, height: 1.5),
                              )),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                        child: Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                          itemCount: skor2.length,
                          itemBuilder: (context, index) => Center(
                              child: Text(
                            skor2[index].toString(),
                            style: TextStyle(fontSize: 15, height: 1.5),
                          )),
                        ))
                      ],
                    )),
                    Flexible(
                        child: Container(
                      color: Colors.black12,
                      child: Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                            itemCount: skor3.length,
                            itemBuilder: (context, index) => Center(
                                child: Text(
                              skor3[index].toString(),
                              style: TextStyle(fontSize: 15, height: 1.5),
                            )),
                          ))
                        ],
                      ),
                    )),
                    Flexible(
                        child: Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                          itemCount: skor4.length,
                          itemBuilder: (context, index) => Center(
                              child: Text(
                            skor4[index].toString(),
                            style: TextStyle(fontSize: 15, height: 1.5),
                          )),
                        ))
                      ],
                    ))
                  ],
                )),
            Flexible(
                flex: 2,
                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onDoubleTap: () {},
                          child: Container(
                            color: Colors.red,
                          ),
                        )),
                    Flexible(
                      //skor input
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.amberAccent,
                                  // child: Text("+"),
                                  child: Center(
                                    child: Text(
                                      "$aktif",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.white,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          aktif = 0;
                                        });
                                      },
                                      child: Text(
                                        "clear",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      //+5
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.green[50],
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          aktif += 5;
                                        });
                                      },
                                      child: Text(
                                        "+5",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.red[50],
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          aktif -= 5;
                                        });
                                      },
                                      child: Text(
                                        "-5",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.green[100],
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          aktif += 10;
                                        });
                                      },
                                      child: Text(
                                        "+10",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.red[100],
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          aktif -= 10;
                                        });
                                      },
                                      child: Text(
                                        "-10",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.green[200],
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          aktif += 50;
                                        });
                                      },
                                      child: Text(
                                        "+50",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.red[200],
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          aktif -= 50;
                                        });
                                      },
                                      child: Text(
                                        "-50",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        color: Colors.purple,
                        child: Column(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.green[300],
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          aktif += 100;
                                        });
                                      },
                                      child: Text(
                                        "+100",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.red[300],
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          aktif -= 100;
                                        });
                                      },
                                      child: Text(
                                        "-100",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.lightBlue,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          skor1.insert(0, input1);
                                          skor2.insert(0, input2);
                                          skor3.insert(0, input3);
                                          skor4.insert(0, input4);
                                          jumskor1 += input1;
                                          jumskor2 += input2;
                                          jumskor3 += input3;
                                          jumskor4 += input4;
                                          dataChar1.add({
                                            'domain': skor1.length,
                                            'measure': jumskor1
                                          });
                                          dataChar2.add({
                                            'domain': skor2.length,
                                            'measure': jumskor2
                                          });
                                          dataChar3.add({
                                            'domain': skor3.length,
                                            'measure': jumskor3
                                          });
                                          dataChar4.add({
                                            'domain': skor4.length,
                                            'measure': jumskor4
                                          });
                                          input1 = 0;
                                          input2 = 0;
                                          input3 = 0;
                                          input4 = 0;
                                        });
                                      },
                                      child: Text(
                                        "GAS",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.white10,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const chartPage()));
                                      },
                                      child: Text(
                                        "Chart",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // child: GestureDetector(
                                  //   onTap: () {
                                  //     Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 const chartPage()));
                                  //   },

                                  // ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class chartPage extends StatelessWidget {
  const chartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("chartpage"),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.red,
                            child: Column(
                              children: [
                                Center(
                                  child: Text(play1.text,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          height: 3)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.green,
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(play2.text,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 3)),
                                  )
                                ],
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.blue,
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(play3.text,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 3)),
                                  )
                                ],
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.yellow,
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(play4.text,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 3)),
                                  )
                                ],
                              ),
                            )),
                      ],
                    )),
                Flexible(
                    flex: 8,
                    child: Scaffold(
                      body: DChartLine(
                        data: [
                          {'id': 'player1', 'data': dataChar1},
                          {'id': 'player2', 'data': dataChar2},
                          {'id': 'player3', 'data': dataChar3},
                          {'id': 'player4', 'data': dataChar4}
                        ],
                        lineColor: (lineData, index, id) {
                          if (id == 'player1') {
                            return Colors.red;
                          }
                          if (id == 'player2') {
                            return Colors.green;
                          }
                          if (id == 'player3') {
                            return Colors.blue;
                          } else {
                            return Colors.yellow;
                          }
                        },
                        animate: true,
                      ),
                    )),
                Flexible(
                    flex: 2,
                    child: ElevatedButton(
                      child: Text("BACK"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ))
              ],
            ),
          ],
        ));
  }
}
