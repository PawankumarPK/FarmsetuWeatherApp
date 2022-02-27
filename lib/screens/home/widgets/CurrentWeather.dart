import 'package:farmsethu_weatherapp/repository/dataset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../repository/dataset.dart';
import '../../../res/ConstantColors.dart';
import '../../../res/ConstantStrings.dart';
import '../../../res/Dimens.dart';
import '../../../utils/SizeConfig.dart';
import 'ExtraWeather.dart';
import '../HomeScaffold.dart';

class CurrentWeather extends StatefulWidget {
  final Function() updateData;

  const CurrentWeather(this.updateData, {Key? key}) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  bool searchBar = false;
  bool updating = false;
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (searchBar) {
          setState(() {
            searchBar = false;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: SizeConfig.defaultSize! * Dimens.size5,
            left: SizeConfig.defaultSize! * Dimens.size3,
            right: SizeConfig.defaultSize! * Dimens.size3),
        color: ConstantColors.blackColor,
        child: Column(
          children: [
            ///----------------- Search bar textfield with city name -----------------
            Container(
              child: searchBar
                  ? TextField(
                      focusNode: focusNode,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.defaultSize! * Dimens.size1)),
                          fillColor: ConstantColors.blackColor,
                          filled: true,
                          hintStyle:
                              TextStyle(color: ConstantColors.whiteColor),
                          hintText: ConstantStrings.enterYourCityName),
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) async {
                        CityModel? temp = await fetchCity(value);
                        if (temp == null) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: ConstantColors.blackColor,
                                  title: Text(ConstantStrings.cityNotFound),
                                  content: Text(
                                      ConstantStrings.pleaseCheckTheCityName),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(ConstantStrings.ok))
                                  ],
                                );
                              });
                          searchBar = false;
                          return;
                        }

                        city = temp.name;
                        lat = temp.lat;
                        lon = temp.lon;
                        updating = true;
                        setState(() {});
                        widget.updateData();
                        searchBar = false;
                        updating = false;
                        setState(() {});
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///----------------- City name after search -----------------
                        Row(
                          children: [
                            Icon(CupertinoIcons.search,
                                color: ConstantColors.whiteColor),
                            GestureDetector(
                              onTap: () {
                                searchBar = true;
                                setState(() {});
                                focusNode.requestFocus();
                              },
                              child: Text(
                                " " + currentTemp!.location,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        SizeConfig.defaultSize! * Dimens.size2),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  ///----------------- Temperature related image -----------------
                  Image(
                    image: AssetImage(currentTemp!.image),
                    width: SizeConfig.defaultSize! * Dimens.size20,
                    height: SizeConfig.defaultSize! * Dimens.size20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.defaultSize! * Dimens.size4),
                    child: Center(
                        child: Column(
                      children: [
                        ///----------------- Current Temperature value text -----------------
                        Text(
                          currentTemp!.current.toString(),
                          style: TextStyle(
                              height: 0.1,
                              fontSize: SizeConfig.defaultSize! * Dimens.size12,
                              fontWeight: FontWeight.bold),
                        ),

                        ///----------------- Temperature name text -----------------
                        Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.defaultSize! * Dimens.size2),
                          child: Text(currentTemp!.name,
                              style: TextStyle(
                                color: ConstantColors.whiteColor,
                                fontSize:
                                    SizeConfig.defaultSize! * Dimens.size2,
                              )),
                        ),
                      ],
                    )),
                  ),
                  Divider(
                    color: ConstantColors.blackColor,
                  ),

                  ///----------------- Extra info of temperature -----------------
                  Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.defaultSize! * Dimens.size2),
                      child: ExtraWeather(currentTemp!))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
