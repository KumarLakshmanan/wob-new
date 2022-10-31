
import 'package:flutter/material.dart';

class GoldCardItem extends StatelessWidget {
  const GoldCardItem({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String image;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              onTap();
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Image.asset(
                image,
                width: 30,
                height: 30,
              ),
            ),
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: const Color(0xFF1C2D57)),
          ),
        ],
      ),
    );
  }
}