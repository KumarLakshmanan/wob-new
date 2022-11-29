import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wob/constants.dart';
import 'package:wob/controller/data_controller.dart';
import 'package:wob/screens/permissions.dart';

class UserDetails extends StatefulWidget {
  final String phone;
  const UserDetails({Key? key, required this.phone}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final dc = Get.put(DataController());
  String gender = "male";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: const [
              Icon(
                Icons.electric_bolt,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Kalyannagar, Bangalore.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Gilroy',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 8.0,
                  ),
                  child: ListView(
                    children: [
                      const Text(
                        "personal information",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Just information about you",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8C8E8F),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          buildGenderPicker(string: "male"),
                          buildGenderPicker(string: "female"),
                          buildGenderPicker(string: "others"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        readOnly: true,
                        initialValue: "+91 " + widget.phone,
                        cursorColor: Colors.black,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.5,
                          fontSize: 18,
                        ),
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          label: const Text(
                            'mobile number',
                            style: TextStyle(
                              color: Color(0xFFC7C7C7),
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 2.0,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 1.0,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/flag.png",
                              width: 30,
                            ),
                          ),
                          prefixIconColor: Colors.black,
                          prefixIconConstraints:
                              const BoxConstraints(minHeight: 17),
                          hintText: "9999999999",
                          hintStyle: const TextStyle(
                            color: Color(0xFFC7C7C7),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: Colors.black,
                        maxLines: 1,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          label: Text(
                            'enter your first name',
                            style: TextStyle(
                              color: Color(0xFFC7C7C7),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 1.0,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: Colors.black,
                        maxLines: 1,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          label: Text(
                            'enter your last name',
                            style: TextStyle(
                              color: Color(0xFFC7C7C7),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 1.0,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: Colors.black,
                        maxLines: 1,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          label: Text(
                            'enter your email id',
                            style: TextStyle(
                              color: Color(0xFFC7C7C7),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 1.0,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: KeyboardVisibilityBuilder(
                  builder: (p0, isKeyboardVisible) {
                    return isKeyboardVisible || !isPortrait
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                enableDrag: true,
                                context: context,
                                isDismissible: true,
                                elevation: 10,
                                backgroundColor: Colors.white,
                                builder: (builder) {
                                  return const WobBottomSheet();
                                },
                              );
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Ink(
                              width: MediaQuery.of(context).size.width,
                              height: !isPortrait ? 50 : 60,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "save details",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGenderPicker({
    required String string,
  }) {
    return Expanded(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                gender = string;
              });
            },
            borderRadius: BorderRadius.circular(30),
            child: Ink(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: gender == string ? primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: primaryColor,
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            string,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class WobBottomSheet extends StatefulWidget {
  const WobBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<WobBottomSheet> createState() => _WobBottomSheetState();
}

class _WobBottomSheetState extends State<WobBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                height: 5,
                width: 125,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF482D92),
                  Color(0xFF622CAA),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Image.asset(
                  "assets/images/avatar.png",
                  height: 60,
                ),
                const SizedBox(height: 10),
                const Text(
                  "hey👋 \nandrew james",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Are you above the legal drinking \nage as per your geographical \nlocation?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          const PermissionsScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 70,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFF8F5),
                              Color(0xFFFFE5D9),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text("yes!😍"),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          const PermissionsScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 80,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF502A8A),
                              Color(0xFF3F1B76),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "nooooo😭",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
