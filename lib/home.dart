import 'dart:async';
import 'package:compass_app/core/features/home/widgets/custom_text.dart';
import 'package:compass_app/core/features/home/widgets/results_widget.dart';
import 'package:compass_app/core/resources/colors_manager.dart';
import 'package:compass_app/core/resources/images_manager.dart';
import 'package:compass_app/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'dart:math' as maths;
import 'package:provider/provider.dart';
import 'core/features/home/providers/compass_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final myProvider = Provider.of<CompassProvider>(context, listen: false);
      myProvider.streamValues();
    });
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<CompassProvider>(context);
    Size size = MediaQuery.sizeOf(context);
    double needleRotation = (myProvider.bearing + 180) * (maths.pi / 180);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: ColorsManager.background,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: ColorsManager.blue,
          centerTitle: true,
          title: CustomText(title: StringsManager.appName, fontSize: 30),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            ResultsWidget(
              bearing: myProvider.bearing,
              direction: myProvider.direction,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(ImagesManager.compassCircleImg),
                Transform.rotate(
                  angle: needleRotation,
                  child: Image.asset(
                    ImagesManager.needleImg,
                    width: size.width * .8,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
