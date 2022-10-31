import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wob/constants.dart';
import 'package:wob/painters/radius.dart';
import 'package:wob/widgets/button.dart';

import 'helpers/dropdown.dart';
import 'helpers/profile_field.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  TabController? tabController;
  List<String> yearsList = [];
  List<String> monthsList = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  List<String> daysList = [];
  int selectedDate = DateTime.now().millisecondsSinceEpoch;
  String birthdayYear = DateTime.now().year.toString();
  String birthdayMonth = 'Jan';
  String birthdayDay = '01';
  String spouseYear = DateTime.now().year.toString();
  String spouseMonth = 'Jan';
  String spouseDay = '01';
  String marriageYear = DateTime.now().year.toString();
  String marriageMonth = 'Jan';
  String marriageDay = '01';
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    print(selectedDate);
    tabController = TabController(length: 3, vsync: this);
    for (int i = 1; i <= 31; i++) {
      if (i.toString().length == 1) {
        daysList.add('0$i');
      } else {
        daysList.add(i.toString());
      }
    }
    for (int i = DateTime.now().year; i >= 1920; i--) {
      yearsList.add(i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor:
              Get.isDarkMode ? design.dark.secondary : design.light.secondary,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: ListView(
          shrinkWrap: true,
          children: [
            ClipPath(
              clipper: RadiusCliper(heightFactor: 30),
              child: Container(
                color: Get.isDarkMode
                    ? design.dark.secondary
                    : design.light.secondary,
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.3,
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      alignment: Alignment.center,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                height: MediaQuery.of(context).size.width * 0.3,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Image.asset(
                                  'assets/images/user.png',
                                  fit: BoxFit.cover,
                                ),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: -10,
                            child: GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Get.isDarkMode
                                      ? design.dark.secondary
                                      : design.light.secondary,
                                  size: 20,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Neel Bhesaniya',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                "General Information",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ProfileField(
              title: 'Name',
              controller: nameController,
            ),
            ProfileField(
              title: 'Email',
              controller: emailController,
            ),
            ProfileField(
              title: 'Location',
              controller: locationController,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              color: Get.isDarkMode
                  ? design.dark.background2
                  : design.light.background2,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                "Anniversery ( Disount On the Day)",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
              height: 60,
              alignment: Alignment.center,
              child: TabBar(
                isScrollable: true,
                labelColor:
                    Get.isDarkMode ? Colors.white : design.light.secondary,
                unselectedLabelColor:const Color(0xFFA8A8A8),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color:
                        Get.isDarkMode ? Colors.white : design.light.secondary,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  insets: const EdgeInsets.only(bottom: 5),
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                indicatorSize: TabBarIndicatorSize.label,
                controller: tabController,
                tabs: const [
                  Tab(
                    text: 'Anniversary 1',
                  ),
                  Tab(
                    text: 'Anniversary 2',
                  ),
                  Tab(
                    text: 'Anniversary 3',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: TabBarView(
                controller: tabController,
                children: [
                  for (var i = 0; i < 3; i++)
                    Column(
                      children: [
                        DropdownMenu(
                          items: const [
                            'Select Anniversary type',
                            'Black Day',
                            'Christmas',
                            'Valentine',
                            'Birthday',
                            'Wedding'
                          ],
                          selectedItem: 'Select Anniversary type',
                          onChanged: (value) {},
                        ),
                        GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.fromMillisecondsSinceEpoch(
                                  selectedDate),
                              firstDate: DateTime.now().subtract(
                                const Duration(days: 365),
                              ),
                              lastDate: DateTime(2100),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  selectedDate = value.millisecondsSinceEpoch;
                                });
                              }
                            });
                          },
                          child: Container(
                            height: 50.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: const Offset(0, 4),
                                  blurRadius: 16,
                                ),
                              ],
                              color: Get.isDarkMode
                                  ? design.dark.background2
                                  : design.light.background2,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    // 12 Feb 2020
                                    DateFormat('dd MMM yyyy').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                        selectedDate,
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : design.light.secondary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              color: Get.isDarkMode
                  ? design.dark.background2
                  : design.light.background2,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                "Other Information",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 20,
            //     vertical: 10,
            //   ),
            //   child: Text(
            //     "Birth Date",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText2!
            //         .copyWith(color: Colors.black),
            //   ),
            // ),
            // SizedBox(
            //   height: 45,
            //   child: Row(
            //     children: [
            //       const SizedBox(width: 10),
            //       Expanded(
            //         child: InlineDropDown(
            //           isDark: false,
            //           items: daysList,
            //           selectedItem: birthdayDay,
            //           onChanged: (String? a) {
            //             setState(() {
            //               birthdayDay = a!;
            //             });
            //           },
            //         ),
            //       ),
            //       Expanded(
            //         child: InlineDropDown(
            //           isDark: false,
            //           items: monthsList,
            //           selectedItem: birthdayMonth,
            //           onChanged: (String? a) {
            //             setState(() {
            //               birthdayMonth = a!;
            //             });
            //           },
            //         ),
            //       ),
            //       Expanded(
            //         child: InlineDropDown(
            //           isDark: false,
            //           items: yearsList,
            //           selectedItem: birthdayYear,
            //           onChanged: (String? a) {
            //             setState(() {
            //               birthdayYear = a!;
            //             });
            //           },
            //         ),
            //       ),
            //       const SizedBox(width: 10),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 20,
            //     vertical: 10,
            //   ),
            //   child: Text(
            //     "Spouse Birth Day",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText2!
            //         .copyWith(color: Colors.black),
            //   ),
            // ),
            // SizedBox(
            //   height: 45,
            //   child: Row(
            //     children: [
            //       const SizedBox(width: 10),
            //       Expanded(
            //         child: InlineDropDown(
            //           isDark: false,
            //           items: daysList,
            //           selectedItem: spouseDay,
            //           onChanged: (String? a) {
            //             setState(() {
            //               spouseDay = a!;
            //             });
            //           },
            //         ),
            //       ),
            //       Expanded(
            //         child: InlineDropDown(
            //           isDark: false,
            //           items: monthsList,
            //           selectedItem: spouseMonth,
            //           onChanged: (String? a) {
            //             setState(() {
            //               spouseMonth = a!;
            //             });
            //           },
            //         ),
            //       ),
            //       Expanded(
            //         child: InlineDropDown(
            //           isDark: false,
            //           items: yearsList,
            //           selectedItem: spouseYear,
            //           onChanged: (String? a) {
            //             setState(() {
            //               spouseYear = a!;
            //             });
            //           },
            //         ),
            //       ),
            //       const SizedBox(width: 10),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 20,
            //     vertical: 10,
            //   ),
            //   child: Text(
            //     "Marriage Date",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText2!
            //         .copyWith(color: Colors.black),
            //   ),
            // ),
            // SizedBox(
            //   height: 45,
            //   child: Row(
            //     children: [
            //       const SizedBox(width: 10),
            //       Expanded(
            //         child: InlineDropDown(
            //           isDark: false,
            //           items: daysList,
            //           selectedItem: marriageDay,
            //           onChanged: (String? a) {
            //             setState(() {
            //               marriageDay = a!;
            //             });
            //           },
            //         ),
            //       ),
            //       Expanded(
            //         child: InlineDropDown(
            //           isDark: false,
            //           items: monthsList,
            //           selectedItem: marriageMonth,
            //           onChanged: (String? a) {
            //             setState(() {
            //               marriageMonth = a!;
            //             });
            //           },
            //         ),
            //       ),
            //       Expanded(
            //         child: InlineDropDown(
            //           isDark: false,
            //           items: yearsList,
            //           selectedItem: marriageYear,
            //           onChanged: (String? a) {
            //             setState(() {
            //               marriageYear = a!;
            //             });
            //           },
            //         ),
            //       ),
            //       const SizedBox(width: 10),
            //     ],
            //   ),
            // ),
            DropdownMenu(
              items: const ['Lite', 'Strong'],
              selectedItem: 'Lite',
              onChanged: (value) {},
              title: "Your Choice of Liquid",
            ),
            DropdownMenu(
              items: const ['Yes', 'No'],
              selectedItem: 'Yes',
              onChanged: (value) {},
              title:
                  "Would you like to participate in events organized by brands ?",
            ),
            DropdownMenu(
              items: const ['Yes', 'No'],
              selectedItem: 'Yes',
              onChanged: (value) {},
              title: "Do you travel a lot?",
            ),
            const SizedBox(height: 20),
            MaterialBtn(
              height: 50,
              onPressed: () {
                Get.back();
              },
              color: Get.isDarkMode
                  ? design.dark.secondary
                  : design.light.secondary,
              isPrimary: true,
              text: "Save",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
