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
  // double _kelvin = 0;
  // double _reamur = 0;
  var listItem = ["Kelvin", "Reamur"];
  String _newValue = "Kelvin";
  double _result = 0;
  List<String> listViewItem = <String>[];

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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(etInputUser: etInputUser),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: (String? changeValue) {
                  setState(() {
                    _newValue = changeValue!;
                    _konversiSuhu();
                  });
                },
              ),
              Result(
                result: _result,
              ),
              SizedBox(
                child: Container(
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
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(child: RiwayatKonversi(listViewItem: listViewItem)),
            ],
          ),
        ),
      ),
    );
  }

  void _konversiSuhu() {
    setState(() {
      _inputUser = double.parse(etInputUser.text);
      if (_newValue == "Kelvin") {
        _result = _inputUser + 273;
        listViewItem.add("Kelvin : " "$_result");
      } else {
        _result = (4 / 5) * _inputUser;
        listViewItem.add("Reamur : " "$_result");
      }
    });
  }
}

class RiwayatKonversi extends StatelessWidget {
  const RiwayatKonversi({
    Key? key,
    required this.listViewItem,
  }) : super(key: key);

  final List<String> listViewItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listViewItem.length,
        itemBuilder: ((context, index) {
          return Container(
            child: Text(listViewItem[index]),
          );
        }));
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
  }) : super(key: key);

  final double result;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 150),
      margin: EdgeInsets.only(bottom: 150, top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hasil",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            result.toStringAsFixed(1),
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
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
