import 'package:flutter/material.dart';
import 'package:se380_during_lecture/student.dart';

class StackPage extends StatefulWidget {
  const new({super.key});

  @override
  State<StackPage> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  var graduated = false;
  var firstName = '';
  late final TextEditingController lastNameController;
  late final TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    lastNameController = TextEditingController(text: '');
    ageController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("THE STACK PAGE")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("STACK PAGE"),
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
            Row(
              children: [
                Text('First Name'),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        firstName = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Last Name'),
                SizedBox(width: 8),
                Expanded(child: TextField(controller: lastNameController)),
              ],
            ),
            Row(
              children: [
                Text('Age'),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Graduated?'),
                Checkbox(
                  value: graduated,
                  onChanged: (value) {
                    setState(() {
                      graduated = value ?? false;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(
                  Student(
                    firstName: firstName,
                    lastName: lastNameController.text,
                    age: int.tryParse(ageController.text) ?? 0,
                    graduated: graduated,
                  ),
                );
              },
              child: Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  graduated = false;
                  lastNameController.text = '';
                });
              },
              child: Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
