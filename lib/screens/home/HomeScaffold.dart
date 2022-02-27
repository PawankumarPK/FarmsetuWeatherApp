import 'package:farmsethu_weatherapp/res/ConstantColors.dart';
import 'package:farmsethu_weatherapp/screens/home/widgets/CurrentWeather.dart';
import 'package:farmsethu_weatherapp/screens/home/widgets/TodayWeather.dart';
import 'package:farmsethu_weatherapp/utils/SizeConfig.dart';
import 'package:farmsethu_weatherapp/repository/dataset.dart';
import 'package:flutter/material.dart';

Weather? currentTemp;
Weather? tomorrowTemp;
List<Weather>? todayWeather;
List<Weather>? sevenDay;
String lat = "28.644800";
String lon = "77.216721";
String city = "New Delhi";



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ///--------------------- Fetch current temperature using weather api -----------------
  getData() async {
    fetchData(lat, lon, city).then((value) {
      currentTemp = value[0];
      todayWeather = value[1];
      tomorrowTemp = value[2];
      sevenDay = value[3];
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ConstantColors.blackColor,
      body: currentTemp == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            child: Column(
                children: [CurrentWeather(getData), TodayWeather()],
              ),
          ),
    );
  }
}










