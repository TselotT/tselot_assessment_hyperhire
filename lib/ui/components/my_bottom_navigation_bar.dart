import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int index;
  const MyBottomNavigationBar({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      child: CustomPaint(
        painter: BottoBarPainter(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconWithLabel(
              context,
              asset: "assets/icons/home_icon.png",
              label: '홈',
              textColor: index == 0
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.scrim,
            ),
            iconWithLabel(
              context,
              asset: "assets/icons/location_icon.png",
              label: '스팟',
              textColor: index == 1
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.scrim,
            ),
            Transform.translate(
              offset: const Offset(0, -10),
              child: iconWithLabel(
                context,
                asset: "assets/icons/nav_star_icon.png",
                textColor: index == 2
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.scrim,
              ),
            ),
            iconWithLabel(
              context,
              asset: "assets/icons/message_icon.png",
              textColor: index == 3
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.scrim,
              label: '채팅',
            ),
            iconWithLabel(
              context,
              asset: "assets/icons/person_icon.png",
              textColor: index == 4
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.scrim,
              label: '마이',
            ),
          ],
        ),
      ),
    );
  }

  Widget iconWithLabel(BuildContext context,
      {String? label, required String asset, required Color textColor}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          asset,
          width: 64,
        ),
        if (label != null)
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: textColor,
                ),
          ),
      ],
    );
  }
}

class BottoBarPainter extends CustomPainter {
  final BuildContext context;

  BottoBarPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..moveTo(size.width * 0.45, size.height * 0.15)
      ..quadraticBezierTo(
          size.width * 0.5, 0, size.width * 0.55, size.height * 0.15)
      ..lineTo(size.width - 20, size.height * 0.15)
      ..quadraticBezierTo(
          size.width, size.height * 0.15, size.width, size.height * 0.15 + 20)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, size.height * 0.15 + 20)
      ..quadraticBezierTo(0, size.height * 0.15, 20, size.height * 0.15)
      ..close();

    canvas.clipPath(path);

    canvas.drawPaint(Paint()..color = Theme.of(context).colorScheme.primary);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}
