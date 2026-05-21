import 'package:compass_app/core/features/home/widgets/custom_text.dart';
import 'package:compass_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class ResultsWidget extends StatelessWidget {
  final double bearing;
  final String direction;
  const ResultsWidget({
    super.key,
    required this.bearing,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorsManager.shadow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(title:   '${bearing.toStringAsFixed(0)}°'),
          SizedBox(width: 10),
          CustomText(title: direction)
        ],
      ),
    );
  }
}
