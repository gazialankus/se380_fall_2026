import 'package:flutter/material.dart';

class StackPage extends StatefulWidget {
  const new({super.key});

  @override
  State<StackPage> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("THE STACK PAGE")),
      body: Column(
        children: [
          Text("STACK PAGE"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Go Back'),
          ),
          ColoredBox(
            color: Colors.yellow,
            child: Stack(
              children: [
                ColoredBox(
                  color: Colors.red,
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: FlutterLogo(),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: ColoredBox(
                    color: Colors.purple,
                    child: Text(
                      'Flutter',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: ColoredBox(
                    color: Colors.purple,
                    child: Text(
                      'Flutter',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
