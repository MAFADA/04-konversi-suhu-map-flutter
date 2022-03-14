import 'package:flutter/material.dart';

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
