import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  //var berubah
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  final etInputUser = TextEditingController();

  @override
  void dispose() {
    etInputUser.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("2031710168, M. Afada Nur Saiva Syahira"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(etInputUser: etInputUser),
              Result(kelvin: _kelvin, reamur: _reamur),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _konversiSuhu();
                  },
                  child: const Text(
                    "Konversi Suhu",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _konversiSuhu() {
    _inputUser = double.parse(etInputUser.text);
    setState(() {
      _reamur = (4 / 5) * _inputUser;
      _kelvin = _inputUser + 273;
    });
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required double kelvin,
    required double reamur,
  })  : _kelvin = kelvin,
        _reamur = reamur,
        super(key: key);

  final double _kelvin;
  final double _reamur;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 150),
      child: Row(children: <Widget>[
        Expanded(
          child: Column(
            children: [
              const Text('Suhu dalam Kelvin'),
              Text(
                '$_kelvin',
                style: const TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text('Suhu dalam Reamur'),
              Text(
                _reamur.toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.etInputUser,
  }) : super(key: key);

  final TextEditingController etInputUser;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Masukkan Suhu Dalam Celcius',
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      controller: etInputUser,
      keyboardType: TextInputType.number,
    );
  }
}
