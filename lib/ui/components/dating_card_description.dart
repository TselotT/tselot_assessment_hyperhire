import 'package:assessment/model/data_model.dart';
import 'package:assessment/ui/components/icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatingCardDescription extends StatelessWidget {
  final DataModel dataModel;
  final int index;
  const DatingCardDescription(
      {required this.dataModel, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.transparent,
          Theme.of(context).colorScheme.primary.withOpacity(0.5),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconAndText(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        assetName: "assets/icons/star_icon.png",
                        text: NumberFormat.decimalPattern()
                            .format(dataModel.likeCount),
                        iconColor: Theme.of(context).colorScheme.scrim),
                    Row(
                      children: [
                        Text(dataModel.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                        const SizedBox(width: 4),
                        Text(dataModel.age.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                      ],
                    ),
                    _dynamicDescriptionContent(context)
                  ],
                ),
              ),
              Expanded(
                  flex: 2, child: Image.asset("assets/icons/heart_icon.png"))
            ],
          ),
          Transform.rotate(
              angle: -3.14 / 2,
              child: Icon(Icons.arrow_back_ios,
                  size: 16, color: Theme.of(context).colorScheme.onPrimary)),
        ],
      ),
    );
  }

  Widget _dynamicDescriptionContent(BuildContext context) {
    switch (index) {
      case 0:
        return Text(
          dataModel.location,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        );
      case 1:
        return Text(
          dataModel.description,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        );

      case 2:
        return Wrap(
          spacing: 5,
          runSpacing: 5,
          children: [
            for (int i = 0; i < dataModel.tags.length; i++)
              IconAndText(
                backgroundColor: i == 0
                    ? Theme.of(context).colorScheme.tertiary.withOpacity(0.3)
                    : Theme.of(context).colorScheme.scrim,
                borderColor: i == 0
                    ? Theme.of(context).colorScheme.tertiary.withOpacity(0.3)
                    : Theme.of(context).colorScheme.scrim,
                text: dataModel.tags[i],
              ),
            // IconAndText(
            //   backgroundColor:
            //       Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
            //   borderColor: Theme.of(context).colorScheme.tertiary,
            //   text: "💖 진지한 연애를 찾는 중",
            // ),
            // IconAndText(
            //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            //   borderColor: Theme.of(context).colorScheme.scrim,
            //   text: "🍸 전혀 안 함",
            // ),
            // IconAndText(
            //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            //   borderColor: Theme.of(context).colorScheme.scrim,
            //   text: "🚬 비흡연",
            // ),
            // IconAndText(
            //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            //   borderColor: Theme.of(context).colorScheme.scrim,
            //   text: "💪🏻 매일 1시간 이상",
            // ),
            // IconAndText(
            //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            //     borderColor: Theme.of(context).colorScheme.scrim,
            //     text: "🤝 만나는 걸 좋아함",
            //     iconColor: Theme.of(context).colorScheme.scrim),
            // IconAndText(
            //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            //   borderColor: Theme.of(context).colorScheme.scrim,
            //   text: "INFP",
            // ),
          ],
        );
      default:
        return Container();
    }
  }
}
