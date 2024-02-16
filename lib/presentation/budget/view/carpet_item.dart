import 'package:alladin/domain/model/carpet.dart';
import 'package:flutter/material.dart';

class CarpetItem extends StatelessWidget {
  final Carpet carpet;
  final Carpet? selectedShape;
  final Function(Carpet) onSelected;

  const CarpetItem(
      {required this.carpet,
      required this.selectedShape,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 24, //Make it equal to height of radio button
          width: 24, //Make it equal to width of radio button
          margin: const EdgeInsets.only(
              right: 6,
              top: 6), //Apply margins and(or) paddings as per requirement
          child: Radio(
            value: carpet,
            groupValue: selectedShape,
            onChanged: (value) {
              onSelected(carpet);
            },
          ),
        ),
        Text(carpet.name),
      ],
    );
  }
}
