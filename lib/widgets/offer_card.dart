import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wob/constants.dart';
import 'package:wob/painter/card.dart';

class OfferItemCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String brandImg;
  final String background;
  final bool claimOffer;

  const OfferItemCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.brandImg,
    required this.background,
    required this.claimOffer,
  }) : super(key: key);

  @override
  State<OfferItemCard> createState() => _OfferItemCardState();
}

class _OfferItemCardState extends State<OfferItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 255,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage(widget.background),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(widget.brandImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: Center(
              child: Image.asset(
                "assets/images/cheers.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: (-(("Limited Period Offer".length * 12 / 2)).toDouble()) + 15,
            top: 40,
            child: Transform(
              transform: Matrix4.rotationZ(1.5708),
              child: Text(
                ("Limited Period Offer").toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Gilroy',
                  letterSpacing: 1.5,
                  fontSize: 8,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: Center(
              child: Text(
                widget.subtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Super Retro M54',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: Container(
                height: 40,
                width: 40,
                decoration:const  BoxDecoration(
                  color: Color(0xFF482D92),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            bottom: 50,
            left: -20,
            top: 0,
          ),
          Positioned(
            child: Center(
              child: Container(
                height: 40,
                width: 40,
                decoration:const  BoxDecoration(
                  color: Color(0xFF482D92),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            bottom: 50,
            right: -20,
            top: 0,
          ),
        ],
      ),
    );
  }
}

List<Shadow> getShadows(Color stroke) {
  return [
    Shadow(
      offset: const Offset(-1.5, -1.5),
      color: stroke,
    ),
    Shadow(
      offset: const Offset(1.5, -1.5),
      color: stroke,
    ),
    Shadow(
      offset: const Offset(1.5, 1.5),
      color: stroke,
    ),
    Shadow(
      offset: const Offset(-1.5, 1.5),
      color: stroke,
    ),
  ];
}
