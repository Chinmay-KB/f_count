import 'package:example/good_homepage.dart';
import 'package:f_count/f_count.dart';
import 'package:flutter/material.dart';

class BadHomePage extends StatefulWidget {
  const BadHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<BadHomePage> createState() => _BadHomePageState();
}

class _BadHomePageState extends State<BadHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const ValueKey('bad_appbar'),
        title: Text(fCount(label: 'Uselessly')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              fCount(label: 'Useful stuff'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const GoodHomePage())),
              child: const Text('Check out the good way'),
            )
          ],
        ),
      ),
    );
  }
}
