import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';

class DropdownMenu extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String?> onChanged;
  final String? title;
  const DropdownMenu({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    this.title,
  }) : super(key: key);

  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Text(
              widget.title!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: const Color(0xFFA8A8A8)),
            ),
          const SizedBox(height: 5),
          Container(
            height: 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? design.dark.background2
                  : design.light.background2,
              borderRadius: BorderRadius.circular(7.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 16,
                ),
              ],
            ),
            child: DropdownButtonFormField<String>(
              value: widget.selectedItem,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Get.isDarkMode
                    ? Colors.white
                    : design.light.secondary,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              selectedItemBuilder: (context) {
                return widget.items.map((item) {
                  return DropdownMenuItem(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    value: item,
                  );
                }).toList();
              },
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              onChanged: widget.onChanged,
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
