import 'package:flutter/material.dart';

class NoCards extends StatelessWidget {
  const NoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "추천 드릴 친구들을 준비 중이에요",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          Text(
            "매일 새로운 친구들을 소개시켜드려요",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.scrim,
                ),
          )
        ],
      ),
    );
  }
}
