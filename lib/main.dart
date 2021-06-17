import 'package:flutter/material.dart';
import 'package:flutter_challenge/providers/nodes_provider.dart';
import 'package:flutter_challenge/screens/toys_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: NodesProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Nodes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.amber,
          fontFamily: 'Raleway',
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(138, 144, 147, 1.0),
            ),
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const ToysScreen();
  }
}
