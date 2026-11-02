import 'package:flutter/material.dart';
import 'package:se380_during_lecture/other.dart';
import 'package:se380_during_lecture/stack_page.dart';

int i = 10;

void main() {
  final li = <int>[];
  // li = [5];
  li.add(4);
  // li.add('4');

  final s = 'heloo';

  var other = ['a', 'b', 'c'];

  var ll = [
    if (s == 'hello') '1',
    for (int i = 0; i < 2; i++) 'elemenent $i',
    '1.2',
    if (s == 'heloo')
      for (int i = 0; i < 2; i++) ...other,
  ];

  print(ll);

  final nl = ll.map((e) => e + '.');
  ll.forEach((element) {
    print(element);
  });

  print(nl);

  var mm = {1: 'a', 2: 'b', if (s == 'hello') 3: 'c'};
  mm[3] = 'c';

  var set = {1, 2, 2};
  set.add(2);
  set.add(3);

  print('set: $set');

  print(ll);

  MyNiceClass m = new MyNiceClass(indentation: 3);
  m.len();
  m.myNiceFunction(howManyTimes: 5);
  m.myNiceFunction2(5);
  myFunc(m);
  // print(m._indentation);

  runApp(new MyApp());
}

class MyNiceClass {
  int indentation;
  MyNiceClass({required this.indentation});

  void myNiceFunction({required int howManyTimes, int stepSize = 1}) {
    print('MyNiceClass.myNiceFunction()');
    for (int j = 0; j < howManyTimes; j += stepSize) {
      print('${' ' * indentation} $j');
    }
  }

  void myNiceFunction2(int howManyTimes, [int stepSize = 1]) {
    print('MyNiceClass.myNiceFunction2()');
    for (int j = 0; j < howManyTimes; j += stepSize) {
      print('${' ' * indentation} $j');
    }
  }

  int len() {
    return 6;
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('MyApp is being built');
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 22, 196, 48),
        ),
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// never use global variables in your projects

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title}) {
    print('MyHomePage is being created');
  }
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() {
    print('_MyHomePageState is created');
  }

  String val = '';
  var names = <String>[];
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    final header = [for (int i = 0; i < 28; ++i) 'aaa'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("SE 380"),
      ),
      body: ColoredBox(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ColoredBox(
            color: Colors.yellow,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ColoredBox(
                  color: Colors.purpleAccent,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return StackPage();
                          },
                        ),
                      );
                    },
                    child: Text('just setstate'),
                  ),
                ),
                Expanded(
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              ...names.map(
                                (e) => Text(e, style: TextStyle(fontSize: 30)),
                              ),
                              // if (val.length % 5 != 4) CounterWidget(val),
                              // val.length % 5 == 4 ? Text('hidden') : CounterWidget(val),
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Text("outside: $val"),
                              ),
                            ],
                          ),
                        ),
                ),
                ColoredBox(
                  color: Colors.purpleAccent,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        names = ['ali', 'veli', 'ahmet', 'ayşe', 'fatma'];
                        isLoading = false;
                      });
                    },
                    child: Text('just setstate'),
                  ),
                ),
                Text('hello'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            val += '.';
          });
          setState(() {
            names.add(names[names.length % 5]);
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.ac_unit_sharp),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  CounterWidget(this.val, {super.key});
  final String val;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;
  late String val;

  @override
  void initState() {
    super.initState();
    print('initState: ${widget.val}');
    val = widget.val;
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (val == oldWidget.val) {
      // did I not make change in this state object?
      val = widget.val;
    }
    print('didUpdateWidget: $val ${oldWidget.val} ${widget.val}');
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: .center,
        mainAxisSize: .min,
        children: [
          Text('Hello', style: TextStyle(fontSize: 28)),
          Text('$counter', style: Theme.of(context).textTheme.headlineMedium),
          Text(
            'state\'s val: $val',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'widget\'s val: ${widget.val}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                counter++;
                val += ',';
              });
            },
            child: Text('INCREMENT'),
          ),
        ],
      ),
    );
  }
}
