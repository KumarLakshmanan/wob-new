import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/widgets/alerts.dart';
import 'package:wob/widgets/button.dart';
import 'package:wob/widgets/inline_dropdown.dart';

import '../../constants.dart';

class DateOfBirth extends StatelessWidget {
  final List<String> daysList;
  final List<String> monthsList;
  final List<String> yearsList;
  final String selectedDay;
  final String selectedMonth;
  final String selectedYear;
  final Function(String?) onDayChanged;
  final Function(String?) onMonthChanged;
  final Function(String?) onYearChanged;
  final PageController pageController;
  const DateOfBirth(
      {Key? key,
      required this.daysList,
      required this.monthsList,
      required this.yearsList,
      required this.selectedDay,
      required this.selectedMonth,
      required this.selectedYear,
      required this.onDayChanged,
      required this.onMonthChanged,
      required this.onYearChanged,
      required this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 15,
        bottom: 10,
        right: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "BOOZE IS ONLY FOR\nOVER (18+)",
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Click enter only if you are at least 18 years of age.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Get.isDarkMode ? design.dark.textcolor.withOpacity(0.5) : design.light.textcolor.withOpacity(0.5),
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: InlineDropDown(
                    items: daysList,
                    selectedItem: selectedDay,
                    onChanged: (String? a) {
                      onDayChanged(a);
                    },
                  ),
                ),
                Expanded(
                  child: InlineDropDown(
                    items: monthsList,
                    selectedItem: selectedMonth,
                    onChanged: (String? a) {
                      onMonthChanged(a);
                    },
                  ),
                ),
                Expanded(
                  child: InlineDropDown(
                    items: yearsList,
                    selectedItem: selectedYear,
                    onChanged: (String? a) {
                      onYearChanged(a);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          MaterialBtn(
            onPressed: () {
              var monthNumber = monthsList.indexOf(selectedMonth);
              var dayNumber = int.parse(selectedDay);
              var yearNumber = int.parse(selectedYear);
              var ageInDays = DateTime.now()
                  .difference(
                    DateTime(yearNumber, monthNumber + 1, dayNumber),
                  )
                  .inDays;
              if (ageInDays < 6570) {
                Get.dialog(
                  AlearBox(
                    child: Text(
                      "You are not old enough to use this app.",
                      style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                    ),
                  ),
                );
              } else {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            text: "Enter",
            color:  Get.isDarkMode ? design.dark.secondary : design.light.secondary,
            margin: const EdgeInsets.only(),
            isPrimary: true,
            height: 50,
          ),
        ],
      ),
    );
  }
}
