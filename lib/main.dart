import 'package:flutter/material.dart';
import 'package:crud_rest_api/detailwidget.dart';
import 'package:crud_rest_api/services/api_service.dart';

import 'adddatawidget.dart';
import 'caseslist.dart';
import 'models/cases.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService api = ApiService();
  late Future<List<Cases>> casesList;

  @override
  void initState() {
    super.initState();

    setState(() {
      casesList = api.getCases();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Flutter Rest API"),
      ),
      body: Center(
          child: FutureBuilder(
            // future: api.getCases(),
            // builder: (context, snapshot) {
            //   if(snapshot.hasData){
            //     return CasesList(cases: snapshot.data!);
            //   }else{
            //     return Center(child: Text('No data found, tap plus button to add!', style: Theme.of(context).textTheme.headline6));
            //   }
            future: casesList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CasesList(cases: snapshot.data!);
              } else {
                return Center(
                    child: Text('No data found, tap plus button to add!',
                        style: Theme.of(context).textTheme.headline6));
              }
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _navigateToAddScreen(BuildContext context) async {
    final result= await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddDataWidget()));
  }
}