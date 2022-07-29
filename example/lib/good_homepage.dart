import 'package:f_count/f_count.dart';
import 'package:flutter/material.dart';

class GoodHomePage extends StatelessWidget {
  const GoodHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          key: const ValueKey('good_appbar'),
          title: Text(fCount(label: 'Good Appbar')),
        ),
        body: const Center(
          child: GoodCounterWidget(),
        ));
  }
}

class GoodCounterWidget extends StatefulWidget {
  const GoodCounterWidget({Key? key}) : super(key: key);

  @override
  State<GoodCounterWidget> createState() => _GoodCounterWidgetState();
}

class _GoodCounterWidgetState extends State<GoodCounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          fCount(label: 'good widget, rightfully '),
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headline4,
        ),
        ElevatedButton(
            onPressed: _incrementCounter, child: const Icon(Icons.add)),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Go back to the bad way'),
        )
      ],
    );
  }
}
