import 'package:farmsethu_weatherapp/repository/dataset.dart';
import 'package:farmsethu_weatherapp/res/ConstantColors.dart';
import 'package:flutter/material.dart';
import '../../../res/Dimens.dart';
import '../../../utils/SizeConfig.dart';

class SevenDays extends StatelessWidget {
  final List<Weather> sevenDay;

  const SevenDays(this.sevenDay, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: ConstantColors.lightGreyColor,
        child: ListView.builder(
            itemCount: sevenDay.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.defaultSize! * Dimens.size2,
                      right: SizeConfig.defaultSize! * Dimens.size2,
                      bottom: SizeConfig.defaultSize! * Dimens.size2Point5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///----------------- 7 days name -----------------
                      Text(sevenDay[index].day,
                          style: TextStyle(
                            color: ConstantColors.blackColor,
                              fontSize: SizeConfig.defaultSize! * Dimens.size2)),
                      Container(
                        width: SizeConfig.defaultSize! * Dimens.size13,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ///-----------------  -----------------
                            Image(
                              image: AssetImage(sevenDay[index].image),
                              width: SizeConfig.defaultSize! * Dimens.size4,
                            ),
                            SizedBox(
                                width:
                                SizeConfig.defaultSize! * Dimens.size1Point5),
                            ///----------------- Temperature name of all days -----------------
                            Text(
                              sevenDay[index].name,
                              style: TextStyle(
                                  color: ConstantColors.blackColor,
                                  fontSize:
                                  SizeConfig.defaultSize! * Dimens.size2),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          ///----------------- Temperature values of all days -----------------
                          Text(
                            "+" + sevenDay[index].max.toString() + "\u00B0",
                            style: TextStyle(
                                fontSize: SizeConfig.defaultSize! * Dimens.size2),
                          ),
                        ],
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}
