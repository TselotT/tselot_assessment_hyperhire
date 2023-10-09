import 'dart:developer';

import 'package:assessment/cubit/data_cubit.dart';
import 'package:assessment/model/data_model.dart';
import 'package:assessment/model/dating_card_model.dart';
import 'package:assessment/repo/firebase_realtime_database_repo.dart';
import 'package:assessment/ui/components/dating_card.dart';
import 'package:assessment/ui/components/no_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.95);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(
      builder: (context, state) {
        return PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: context.read<DataCubit>().data.length + 1,
          itemBuilder: (context, index) {
            if (index == context.read<DataCubit>().data.length) {
              return const NoCards();
            }
            return DatingCard(
              dataModel: context.read<DataCubit>().data[index],
              onDismissed: () {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn);
              },
            );
          },
        );
      },
    );
  }
}
