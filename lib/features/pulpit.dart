import 'package:flutter/material.dart';

class Pulpit extends StatefulWidget {
  const Pulpit({
    Key? key,
  }) : super(key: key);

  @override
  State<Pulpit> createState() => _PulpitState();
}

class _PulpitState extends State<Pulpit> {
  List<Color> colors = [Colors.blue, Colors.black, Colors.green];

  var defaultColor = Colors.amber;
  final pressedColor1 = Colors.red;
  final pressedColor2 = Colors.green;
  final pressedColor3 = Colors.blue;
  final pressedColor4 = Colors.pink;
  final pressedColor5 = Colors.yellow;

  var borderWidth = 1.0;
  final borderWidth1 = 3.0;
  final borderWidth2 = 5.0;
  final borderWidth3 = 7.0;
  final borderWidth4 = 9.0;
  final borderWidth5 = 9.0;

  var borderColor = Colors.black;
  final borderColor1 = Colors.green;
  final borderColor2 = Colors.blue;
  final borderColor3 = Colors.purple;
  final borderColor4 = Colors.amber;
  final borderColor5 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text('Flutter Academy Task Zero'),
        ),
        backgroundColor: Colors.grey[400],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    defaultColor = pressedColor1;
                    borderWidth = borderWidth4;
                    borderColor = borderColor3;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: defaultColor,
                    border: Border.all(width: borderWidth, color: borderColor),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      "Łukasz",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: defaultColor,
                  border: Border.all(width: borderWidth, color: borderColor),
                ),
                padding: const EdgeInsets.all(8),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        defaultColor = pressedColor2;
                        borderWidth = borderWidth1;
                        borderColor = borderColor4;
                      });
                    },
                    child: const Text(
                        'Rozwinięcia swoich umiejętności i możliwości przyszłego zatrudnienia.')),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  image: DecorationImage(
                    image: AssetImage("images/Foto.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                // child:
                //     Image(image: AssetImage('images/Foto.jpg'), fit: BoxFit.fill),
                // color: Colors.teal[300],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Who scream'),
                color: Colors.teal[400],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Revolution is coming...'),
                color: Colors.teal[500],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  image: DecorationImage(
                    image: AssetImage("images/snowboard.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Who scream'),
                color: Colors.teal[400],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Revolution is coming...'),
                color: Colors.teal[500],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Revolution, they...'),
                color: Colors.teal[600],
              ),
            ],
            // children: [],
          ),
        ));
  }
}
