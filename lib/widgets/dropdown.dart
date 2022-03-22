import 'package:flutter/material.dart';

class DropdownMenu extends StatelessWidget {
  const DropdownMenu({
    Key? key,
    required this.selectedDropdown,
    required this.listSatuanSuhu,
    required this.onChangedDropdown,
  }) : super(key: key);

  final String selectedDropdown;
  final List<String> listSatuanSuhu;
  final Function onChangedDropdown;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listSatuanSuhu.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: selectedDropdown,
      onChanged: (value) {
        onChangedDropdown(value);
      },
      isExpanded: false,
    );
  }
}

// class Dropdown extends StatelessWidget {
//   const Dropdown({
//     Key? key,
//     required this.listViewItem,
//     required this.konversiSuhu,
//     required this.listItem,
//   }) : super(key: key);

//   final listItem;
//   final VoidCallback konversiSuhu;
//   final List<String> listViewItem;

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
//       onChanged: (value) {
//         setState(() {
//           newValue = value!;
//         });
//         konversiSuhu();
//       },
//       isExpanded: true,
//     );
//   }

//   void setState(Null Function() param0) {}
// }
