import 'package:farmsethu_weatherapp/repository/dataset.dart';
import 'package:farmsethu_weatherapp/res/ConstantColors.dart';
import 'package:farmsethu_weatherapp/screens/details/widgets/SevenDays.dart';
import 'package:farmsethu_weatherapp/screens/details/widgets/TomorrowWeather.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  late Weather tomorrowTemp;
  late List<Weather> sevenDay;

  DetailPage(this.tomorrowTemp, this.sevenDay, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///----------------- Selected city temperature details widgets -----------------
    return Scaffold(
      backgroundColor: ConstantColors.blackColor,
      body: Column(
        children: [TomorrowWeather(tomorrowTemp), SevenDays(sevenDay)],
      ),
    );
  }
}


