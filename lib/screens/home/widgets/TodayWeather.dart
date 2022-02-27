import 'package:farmsethu_weatherapp/screens/home/widgets/WeatherWidget.dart';
import 'package:flutter/material.dart';
import '../../../res/ConstantColors.dart';
import '../../../res/ConstantStrings.dart';
import '../../../res/Dimens.dart';
import '../../../utils/SizeConfig.dart';
import '../../details/DetailScaffold.dart';
import '../HomeScaffold.dart';


class TodayWeather extends StatelessWidget {
  const TodayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size5),
      child: Container(
        color: ConstantColors.lightGreyColor,
        child: Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.defaultSize! * Dimens.size3,
              right: SizeConfig.defaultSize! * Dimens.size3,
              top: SizeConfig.defaultSize! * Dimens.size1),
          child: Column(
            children: [
              ///-----------------Today & possible temperature section -----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ConstantStrings.today,
                    style: TextStyle(
                      color: ConstantColors.blackColor,
                        fontSize: SizeConfig.defaultSize! * Dimens.size2Point5,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return DetailPage(tomorrowTemp!, sevenDay!);
                          }));
                    },
                    child: Row(
                      children: [
                        ///----------------- 7 days text with icon-----------------
                        Text(
                          ConstantStrings.sevenDays,
                          style: TextStyle(
                              fontSize:
                              SizeConfig.defaultSize! * Dimens.size1Point7,
                              color: ConstantColors.blackColor),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: ConstantColors.blackColor,
                          size: SizeConfig.defaultSize! * Dimens.size1Point5,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * Dimens.size1Point5,
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: SizeConfig.defaultSize! * Dimens.size3,
                ),
                ///-----------------Today's hourly temperature details -----------------
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WeatherWidget(todayWeather![0]),
                      WeatherWidget(todayWeather![1]),
                      WeatherWidget(todayWeather![2]),
                      WeatherWidget(todayWeather![3])
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

