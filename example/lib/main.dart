import 'package:flutter/material.dart';
import 'package:logger_beauty/log_color.dart';
import 'package:logger_beauty/log_level.dart';
import 'package:logger_beauty/logger_beauty.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    logDebug('This is a debug message');
    logDebug('This is an info message', level: LogLevel.info);
    logDebug('This is a warning message',
        level: LogLevel.warning, color: LogColor.yellow);

    logDebug('This is new update',
        level: LogLevel.warning, color: LogColor.yellow);
    logDebug(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Calendar Example'),
      ),
      body: const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Beauty Logger',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
