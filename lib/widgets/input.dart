import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
