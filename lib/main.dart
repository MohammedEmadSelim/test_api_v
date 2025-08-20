import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {

  // List students = [
  //   {
  //     "name": 'mena',
  //     "age": 21,
  //     'college': 'MNF',
  //     'decription': " this student in 2nd B.C Degree"
  //   },
  //   {
  //     "name": 'mostafa',
  //     "age": 21,
  //     'college': 'MNF',
  //     'decription': " this student in 2nd B.C Degree"
  //   },
  //   {
  //     "name": 'youssef',
  //     "age": 21,
  //     'college': 'MNF',
  //     'decription': " this student in 2nd B.C Degree"
  //   },
  //   {
  //     "name": 'mahmud',
  //     "age": 21,
  //     'college': 'MNF',
  //     'decription': " this student in 2nd B.C Degree"
  //   },
  //   {
  //     "name": 'somia',
  //     "age": 21,
  //     'college': 'MNF',
  //     'decription': " this student in 2nd B.C Degree"
  //   },
  //   {
  //     "name": 'aya',
  //     "age": 21,
  //     'college': 'MNF',
  //     'decription': " this student in 2nd B.C Degree"
  //   },
  // ];

  // List<Student> studentsAsObjects = students.map((e) => Student.fromJson(e),).toList();


  // for(var student in studentsAsObjects){
  //   print(student.name);
  // }
  calculateBmi(height: 170, weight: 70, unit: 'metric');
  // runApp(const MyApp());
}

class Student {
  final String name;

  final int age;

  final String college;

  final String description;

  Student(
      {required this.name,
      required this.age,
      required this.college,
      required this.description});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        name: json['name'],
        age: json['age'],
        college: json['college'],
        description: json['decription']);
  }
}

Future<void> calculateBmi(
    {required int height, required int weight, required String unit}) async {
  // what i should write here



try{
  Dio dio = Dio();

  var response = await dio.get(
      'https://api.apiverve.com/v1/bmicalculator?height=$height&weight=$weight&unit=$unit',
      options: Options(
          headers: {"X-API-Key": "65534552-6df3-4b75-aac7-156439eeef58"}));
  // print('==================================> res = $response');

  var result = BMIResponse.fromJson(jsonDecode(response.data) );


  print(result.data.weight);

}catch (e){
  if(e is TypeError)
    {
      print(e.stackTrace);
    }
  print(e);
}




  //===============================
  return Future.value();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}





//========================
class BMIResponse {
  final String status;
  final String? error;
  final BMIData data;

  BMIResponse({
    required this.status,
    required this.error,
    required this.data,
  });

  factory BMIResponse.fromJson(Map<String, dynamic> json) {
    return BMIResponse(
      status: json['status'],
      error: json['error'],
      data: BMIData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'error': error,
      'data': data.toJson(),
    };
  }
}

class BMIData {
  final String height;
  final String weight;
  final double bmi;
  final String risk;
  final String summary;
  final String recommendation;

  BMIData({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.risk,
    required this.summary,
    required this.recommendation,
  });

  factory BMIData.fromJson(Map<String, dynamic> json) {
    return BMIData(
      height: json['height'],
      weight: json['weight'],
      bmi: (json['bmi'] as num).toDouble(),
      risk: json['risk'],
      summary: json['summary'],
      recommendation: json['recommendation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'weight': weight,
      'bmi': bmi,
      'risk': risk,
      'summary': summary,
      'recommendation': recommendation,
    };
  }
}
