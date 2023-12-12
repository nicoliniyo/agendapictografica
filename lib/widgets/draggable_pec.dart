import 'package:app/widgets/card_pec.dart';
import 'package:flutter/material.dart';

class DraggablePec extends StatelessWidget {
  final CardPec cardPec;

  const DraggablePec({
    super.key,
    required this.cardPec,
  });

  static double size = 150;

  @override
  Widget build(BuildContext context) => Draggable<CardPec>(
    data: cardPec,
    feedback: buildImage(),
    child: buildImage(),
    childWhenDragging: Opacity(
        opacity: 0.5,)
  );

  Widget buildImage() => Container(
    height: size,
    width: size,
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(24),
    //   color: Colors.white,
    // ),
    child: cardPec,
  );
}
