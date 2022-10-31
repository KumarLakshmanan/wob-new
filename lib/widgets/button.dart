import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';

class MaterialBtn extends StatefulWidget {
  final String text;
  final Widget child;
  final bool isPrimary;
  final bool isShadow;
  final EdgeInsets margin;
  final Function onPressed;
  final double height;
  final bool isDisabled;
  final bool isBorder;
  final Color? color;
  final List<Color>? gradient;
  const MaterialBtn({
    Key? key,
    this.text = '',
    this.child = const SizedBox(),
    this.isPrimary = false,
    this.isShadow = false,
    this.height = 40,
    this.margin = const EdgeInsets.symmetric(horizontal: 10),
    required this.onPressed,
    this.isDisabled = false,
    this.isBorder = true,
    this.color,
    this.gradient,
  })  : assert(color != null || gradient != null),
        super(key: key);

  @override
  _MaterialBtnState createState() => _MaterialBtnState();
}

class _MaterialBtnState extends State<MaterialBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.isDisabled) {
          widget.onPressed();
        }
      },
      child: Container(
        height: widget.height,
        margin: widget.margin,
        decoration: BoxDecoration(
          gradient: (widget.color != null && !Get.isDarkMode)
              ? LinearGradient(
                  colors: [widget.color!, widget.color!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : Get.isDarkMode
                  ? design.dark.gradient2
                  : design.light.gradient2,
          borderRadius: BorderRadius.circular(10),
          boxShadow: widget.isShadow
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 16,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: widget.text != ""
              ? Text(
                  widget.text,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: widget.isPrimary ? Colors.white : Colors.black,
                      ),
                )
              : widget.child,
        ),
      ),
    );
  }
}
