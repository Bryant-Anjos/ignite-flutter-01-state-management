import 'package:flutter/material.dart';
import 'package:state_management/builder_widget.dart';
import 'package:state_management/count_widget.dart';
import 'package:state_management/home_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    print("BUILD - Scaffold");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BuilderWidget(
              controller: controller,
              builder: (context, state) {
                print("BUILD - Counter");
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final count = controller.state + 1;
          controller.setState(count);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
