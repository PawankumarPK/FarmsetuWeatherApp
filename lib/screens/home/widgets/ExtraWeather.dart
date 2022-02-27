import 'package:farmsethu_weatherapp/repository/dataset.dart';
import 'package:farmsethu_weatherapp/res/ConstantColors.dart';
import 'package:farmsethu_weatherapp/res/ConstantStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/Dimens.dart';
import '../../../utils/SizeConfig.dart';

class ExtraWeather extends StatelessWidget {
  final Weather temp;

  const ExtraWeather(this.temp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size1,
            ),
            ///-----------------Current Wind value -----------------
            Text(
              temp.wind.toString() + ConstantStrings.km,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.defaultSize! * Dimens.size1Point6),
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size1,
            ),
            ///----------------- Wind text ---------------------------
            Text(
              ConstantStrings.wind,
              style: TextStyle(
                  color: ConstantColors.whiteColor,
                  fontSize: SizeConfig.defaultSize! * Dimens.size1Point6),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size1,
            ),
            ///----------------- Humidity value -----------------
            Text(
              temp.humidity.toString() + " %",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.defaultSize! * Dimens.size1Point6),
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size1,
            ),
            ///----------------- Humidity text -----------------
            Text(
              ConstantStrings.humidity,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.defaultSize! * Dimens.size1Point6),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size1,
            ),
            ///----------------- Rain value -----------------
            Text(
              temp.chanceRain.toString() + " %",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.defaultSize! * Dimens.size1Point6),
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size1,
            ),
            ///----------------- Rain text -----------------
            Text(
              ConstantStrings.rain,
              style: TextStyle(
                  color: ConstantColors.whiteColor,
                  fontSize: SizeConfig.defaultSize! * Dimens.size1Point6),
            )
          ],
        )
      ],
    );
  }
}
