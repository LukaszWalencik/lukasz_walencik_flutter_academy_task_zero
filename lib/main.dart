import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Pulpit(),
    );
  }
}

class Pulpit extends StatefulWidget {
  const Pulpit({
    Key? key,
  }) : super(key: key);

  @override
  State<Pulpit> createState() => _PulpitState();
}

class _PulpitState extends State<Pulpit> {
  List<Color> colors = [Colors.blue, Colors.black, Colors.green];
  var color = Colors.amber;
  final defaultColor = Colors.teal[100];
  final pressedColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                color = pressedColor;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: color,
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Łukasz",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: colors[2],
              border: Border.all(width: 2, color: Colors.black),
            ),
            padding: const EdgeInsets.all(8),
            child: InkWell(
                onTap: () {
                  setState(() {});
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
