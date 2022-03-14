// import 'package:flutter/material.dart';

// class Dropdown extends StatelessWidget {
//   const Dropdown({
//     Key? key,
//     required this.newValue,
//     required this.listViewItem,
//     required this.onChangedDropdown,
//     required this.konversiSuhu,
//     required this.listItem,
//   }) : super(key: key);

//   final listItem;
//   final VoidCallback konversiSuhu;
//   final String newValue;
//   final List<String> listViewItem;
//   final Function onChangedDropdown;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       items: listItem.map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       value: newValue,
//       onChanged: (String? changeValue) {
//         setState(() {
//           newValue = changeValue!;
//           konversiSuhu();
//         });
//       },
//     );
//   }

//   void setState(Null Function() param0) {}
// }
