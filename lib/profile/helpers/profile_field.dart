import 'package:flutter/material.dart';

class ProfileField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool isPassword;
  final bool isEmail;
  final bool isSubmit;
  final bool isPhone;
  final Color color;
  const ProfileField({
    Key? key,
    required this.title,
    required this.controller,
    this.isPassword = false,
    this.isEmail = false,
    this.isSubmit = false,
    this.isPhone = false,
    this.color = Colors.transparent,
  }) : super(key: key);

  @override
  _ProfileFieldState createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<ProfileField> {
  bool isObsure = false;
  String text = "";
  @override
  void initState() {
    super.initState();
    isObsure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: widget.controller,
            obscureText: isObsure,
            keyboardType: widget.isEmail
                ? TextInputType.emailAddress
                : widget.isPassword
                    ? TextInputType.visiblePassword
                    : widget.isPhone
                        ? TextInputType.phone
                        : TextInputType.text,
            textInputAction:
                widget.isSubmit ? TextInputAction.done : TextInputAction.next,
            decoration: InputDecoration(
              suffixIconConstraints: const BoxConstraints(maxHeight: 25),
              contentPadding: const EdgeInsets.all(0.0),
              fillColor: widget.color,
              filled: true,
              border: _myBorder(),
              enabledBorder: _myBorder(),
              disabledBorder: _myBorder(),
              focusedBorder: _myBorder(),
              focusedErrorBorder: _myBorder(),
              labelText: widget.title,
              labelStyle: Theme.of(context).textTheme.headline6!.copyWith(
                    color: const Color(0xFFA8A8A8),
                  ),
              suffixIcon: text == ""
                  ? null
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          text = "";
                          widget.controller.text = "";
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFA8A8A8),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
            ),
            onChanged: (value) {
              setState(() {
                text = value;
              });
            },
          )
        ],
      ),
    );
  }

  UnderlineInputBorder _myBorder() {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: Color(0xFFA8A8A8),
        width: 2,
      ),
    );
  }
}
