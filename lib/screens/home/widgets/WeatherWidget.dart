import 'package:farmsethu_weatherapp/repository/dataset.dart';
import 'package:flutter/material.dart';
import '../../../res/ConstantColors.dart';
import '../../../res/Dimens.dart';
import '../../../utils/SizeConfig.dart';


class WeatherWidget extends StatelessWidget {
  final Weather weather;

  WeatherWidget(this.weather);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * Dimens.sizePoint7),
      child: Column(
        children: [
          ///----------------- temperature value text -----------------
          Text(
            weather.current.toString() + "\u00B0",
            style: TextStyle(
              color: ConstantColors.blackColor,
                fontSize: SizeConfig.defaultSize! * Dimens.size2),
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * Dimens.sizePoint5,
          ),
          ///----------------- temperature related image -----------------
          Image(
            image: AssetImage(weather.image),
            width: SizeConfig.defaultSize! * Dimens.size5,
            height: SizeConfig.defaultSize! * Dimens.size5,
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * Dimens.sizePoint5,
          ),
          ///----------------- Today's time text -----------------
          Text(
            weather.time,
            style: TextStyle(
                fontSize: SizeConfig.defaultSize! * Dimens.size1Point6,
                color: ConstantColors.blackColor),
          )
        ],
      ),
    );
  }
}
