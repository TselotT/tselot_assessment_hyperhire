import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final String? assetName;
  final Color? iconColor;
  final Color borderColor;
  final Color backgroundColor;
  const IconAndText(
      {required this.text,
      this.assetName,
      this.iconColor,
      this.borderColor = Colors.transparent,
      this.backgroundColor = Colors.transparent,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (assetName != null)
            Image.asset(
              assetName!,
              color: iconColor,
            ),
          if (assetName != null) const SizedBox(width: 4),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
    );
  }
}
