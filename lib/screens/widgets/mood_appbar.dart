import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moody/helper/apptheme.dart';
import 'package:moody/variables/icons.dart';
import 'package:moody/variables/util_variables.dart';

class MoodAppbar extends StatefulWidget {
  const MoodAppbar({super.key, required this.onLeftCLicked, required this.onRightClicked, required this.onCalendarClicked});
final Function(bool isLeftClicked) onLeftCLicked;
final Function(bool isRightClicked) onRightClicked;
final VoidCallback onCalendarClicked;

  @override
  State<MoodAppbar> createState() => _MoodAppbarState();
}

class _MoodAppbarState extends State<MoodAppbar> {


  bool isLefClicked = true;
  bool isRightClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizeVer(20.o),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // Centers the row's children
          children: [
            sizeHor(50.o),
            Expanded(
              child: Text(
                '1 января 09:00',
                style: theme.primaryTextStyle.copyWith(
                    color: const Color(0xffBCBCBF),
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign
                    .center, // Center the text inside the Expanded
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.o),
              child: IconButton(
                onPressed:widget.onCalendarClicked,
                icon: SvgPicture.asset(SvgImages.calendar),
              ),
            ),
          ],
        ),
        sizeVer(10.o),
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: EdgeInsets.symmetric(horizontal: 4.o),
          decoration: BoxDecoration(color: Color(0xffF2F2F2),borderRadius: BorderRadius.circular(50.o)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(50.o),
                onTap: () {

                  widget.onLeftCLicked(true);
                  widget.onRightClicked(false);
                  setState(() {
                    isLefClicked = true;
                    isRightClicked = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(color: isLefClicked?theme.orange:theme.grey1,borderRadius: BorderRadius.circular(50.o)),
                  padding: EdgeInsets.symmetric(horizontal: 12.o,vertical: 8.o),
                  child: Row(
                    children: [
                      SvgPicture.asset(SvgImages.diary,color: isLefClicked?Colors.white:theme.grey2),
                      sizeHor(8.o),
                      Text('Дневник настроения',style: theme.primaryTextStyle.copyWith(fontSize: 14.o,color: isLefClicked?Colors.white:theme.grey2),)
                    ],
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50.o),
                onTap: () {
                  widget.onLeftCLicked(false);
                  widget.onRightClicked(true);
                  setState(() {
                    isLefClicked = false;
                    isRightClicked = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(color: isRightClicked?theme.orange: theme.grey1,borderRadius: BorderRadius.circular(50.o)),
                  padding: EdgeInsets.symmetric(horizontal: 14.o,vertical: 8.o),
                  child: Row(
                    children: [
                      SvgPicture.asset(SvgImages.stats,color: isRightClicked?Colors.white:theme.grey2),
                      sizeHor(8.o),
                      Text('Статистика',style: theme.primaryTextStyle.copyWith(fontSize: 14.o,color: isRightClicked?Colors.white:theme.grey2))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
