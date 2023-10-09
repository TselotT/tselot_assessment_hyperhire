import 'package:flutter/material.dart';

class ImageIndexCounter extends StatelessWidget {
  final int index;
  final int length;
  const ImageIndexCounter(
      {required this.index, required this.length, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        for (int i = 0; i < length; i++)
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(4),
              height: 3,
              decoration: BoxDecoration(
                color: i == index
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
      ],
    );
  }
}
