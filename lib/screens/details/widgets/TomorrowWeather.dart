import 'package:farmsethu_weatherapp/repository/dataset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/ConstantColors.dart';
import '../../../res/ConstantStrings.dart';
import '../../../res/Dimens.dart';
import '../../../utils/SizeConfig.dart';
import '../../home/widgets/ExtraWeather.dart';

class TomorrowWeather extends StatelessWidget {
  final Weather tomorrowTemp;

  const TomorrowWeather(this.tomorrowTemp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConstantColors.blackColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.defaultSize! * Dimens.size5,
                right: SizeConfig.defaultSize! * Dimens.size5,
                left: SizeConfig.defaultSize! * Dimens.size3,
                bottom: SizeConfig.defaultSize! * Dimens.size2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    ///-----------------Back arrow icon -----------------
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: ConstantColors.whiteColor,
                    )),
              ],
            ),
          ),
          Padding(
            padding:
            EdgeInsets.all(SizeConfig.defaultSize! * Dimens.sizePoint8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: SizeConfig.defaultSize! * Dimens.size18,
                  height: SizeConfig.defaultSize! * Dimens.size18,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(tomorrowTemp.image))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///-----------------Tomorrow text -----------------
                    Text(
                      ConstantStrings.tomorrow,
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize! * Dimens.size3,
                          height: 0.1),
                    ),
                    Container(
                      height: SizeConfig.defaultSize! * Dimens.size12,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ///----------------- Max possible temperature value -----------------
                          Text(
                            tomorrowTemp.max.toString(),
                            style: TextStyle(
                                fontSize:
                                SizeConfig.defaultSize! * Dimens.size10,
                                fontWeight: FontWeight.bold),
                          ),
                          ///----------------- Min possible temperature value -----------------

                          Text(
                            "/" + tomorrowTemp.min.toString() + "\u00B0",
                            style: TextStyle(
                                color: ConstantColors.lightGreyColor,
                                fontSize:
                                SizeConfig.defaultSize! * Dimens.size4,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * Dimens.size1,
                    ),
                    ///----------------- Temperature name text -----------------
                    Text(
                      " " + tomorrowTemp.name,
                      style: TextStyle(
                        fontSize: SizeConfig.defaultSize! * Dimens.size1Point5,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: SizeConfig.defaultSize! * Dimens.size2,
              right: SizeConfig.defaultSize! * Dimens.size2,
              left: SizeConfig.defaultSize! * Dimens.size2,
            ),
            child: Column(
              children: [
                Divider(color: ConstantColors.whiteColor),
                SizedBox(
                  height: SizeConfig.defaultSize! * Dimens.size1,
                ),

                ///----------------- Extra temperature details section -----------------
                ExtraWeather(tomorrowTemp)
              ],
            ),
          )
        ],
      ),
    );
  }
}
