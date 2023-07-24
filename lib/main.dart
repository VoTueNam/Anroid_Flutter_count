import 'package:flutter/material.dart';
import 'package:call_api/request.dart';

void main() async {
  await decryptAPI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Vsec Mobile Encrypt Request'),
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
  int _statusCode = 0;
  String _contentResponse = "";

  void _incrementCounter() async {
    Map data = await decryptAPI();
    print(data);
    var statusCode = data['statusCode'];
    var contentResponse = '';
    if (statusCode == 200) {
      contentResponse = data['Your plaintext data'];
    } else {
      contentResponse = 'Server Error';
    }

    // print('Data = $data');
    setState(() {
      _counter++;
      _statusCode = statusCode;
      _contentResponse = contentResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have call API:',
            ),
            Text(
              '$_counter times - Status code: $_statusCode',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Content Response: $_contentResponse \n',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
