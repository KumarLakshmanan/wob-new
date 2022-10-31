import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  final Color color;
  final String title;
  final String stitle;
  final String time;
  final String offerImage;
  final String image;
  final String drink;
  const Popular(
      {Key? key,
      required this.color,
      required this.title,
      required this.stitle,
      required this.time,
      required this.offerImage,
      required this.image,
      required this.drink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: 10,
            left: -5,
            child: Image.asset(
              image,
              height: 50,
              width: 80,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Image.asset(
              offerImage,
              width: 40,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            alignment: Alignment.center,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset(
                      drink,
                      width: 40,
                    ),
                  ),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                ),
                Text(
                  stitle,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
