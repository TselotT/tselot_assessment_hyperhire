import 'package:assessment/cubit/data_cubit.dart';
import 'package:assessment/repo/firebase_realtime_database_repo.dart';
import 'package:assessment/ui/components/my_bottom_navigation_bar.dart';
import 'package:assessment/ui/components/icon_and_text.dart';
import 'package:assessment/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Title(
            color: Colors.white,
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/location_icon.png",
                  width: 24,
                  height: 24,
                ),
                Text('목이길어슬픈기린님의 새로운 스팟',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary)),
              ],
            ),
          ),
          actions: [
            IconAndText(
                backgroundColor: Theme.of(context).colorScheme.primary,
                assetName: "assets/icons/star_icon.png",
                text: NumberFormat.decimalPattern().format(323233),
                iconColor: Theme.of(context).colorScheme.tertiary),
            Image.asset(
              "assets/icons/notification_icon.png",
              width: 40,
              height: 40,
            ),
          ],
        ),
        body: BlocProvider<DataCubit>(
          create: (context) => DataCubit(FirebaseRealtimeDatabaseRepo()),
          child: const HomePage(),
        ),
        bottomNavigationBar: const MyBottomNavigationBar(
          index: 0,
        ));
  }
}
