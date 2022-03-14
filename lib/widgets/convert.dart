import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({Key? key, required this.konversiSuhu}) : super(key: key);

  final VoidCallback konversiSuhu;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: konversiSuhu,
          child: const Text(
            "Konversi Suhu",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue,
          ),
        ),
      ),
    );
  }
}
