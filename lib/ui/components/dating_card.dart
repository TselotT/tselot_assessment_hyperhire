import 'package:assessment/model/data_model.dart';
import 'package:assessment/ui/components/dating_card_description.dart';
import 'package:assessment/ui/components/image_index_counter.dart';
import 'package:flutter/material.dart';

class DatingCard extends StatefulWidget {
  final DataModel dataModel;
  final VoidCallback onDismissed;
  const DatingCard(
      {required this.onDismissed, required this.dataModel, super.key});

  @override
  State<DatingCard> createState() => _DatingCardState();
}

class _DatingCardState extends State<DatingCard> {
  late int _index;

  @override
  void initState() {
    _index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Dismissible(
        onDismissed: (direction) => widget.onDismissed(),
        key: Key(widget.dataModel.key),
        direction: DismissDirection.endToStart,
        child: Dismissible(
          onDismissed: (direction) => widget.onDismissed(),
          key: Key(widget.dataModel.key),
          direction: DismissDirection.down,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Theme.of(context).colorScheme.scrim, width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: size.height * 0.8,
                  child: Stack(
                    children: [
                      Image.network(
                        widget.dataModel.images[_index],
                        fit: BoxFit.cover,
                        height: size.height * 0.8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: const Alignment(0, -0.97),
                          child: ImageIndexCounter(
                              index: _index,
                              length: widget.dataModel.images.length),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: DatingCardDescription(
                            dataModel: widget.dataModel, index: _index),
                      ),
                      _prevGesture(size),
                      _nextGesture(size),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Align _nextGesture(Size size) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: _nextImage,
        child: Container(
          color: Colors.transparent,
          width: size.width / 2,
          height: size.height / 2,
        ),
      ),
    );
  }

  Align _prevGesture(Size size) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: _previousImage,
        child: Container(
          color: Colors.transparent,
          width: size.width / 2,
          height: size.height / 2,
        ),
      ),
    );
  }

  _nextImage() {
    if (_index < widget.dataModel.images.length - 1) {
      setState(() {
        _index++;
      });
    }
  }

  _previousImage() {
    if (_index > 0) {
      setState(() {
        _index--;
      });
    }
  }
}
