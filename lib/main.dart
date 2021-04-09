import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_demo/app_state.dart';
import 'package:redux_demo/home_vm.dart';
import 'package:redux_demo/store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: createStore(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StoreConnector<AppState, HomeViewModel>(
        converter: (store) => HomeViewModel.fromStore(store),
        builder: (store, vm) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${vm.qoute}',
              textAlign: TextAlign.center,
            ),
            Text(
              '${vm.counter}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
            FloatingActionButton(
              onPressed: () {
                vm.increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () {
                vm.getQoute();
              },
              child: Text("gen quoute"),
            )
          ],
        ),
      ),
    );
  }
}
