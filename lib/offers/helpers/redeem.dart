import 'package:flutter/material.dart';

class Redeem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String btn;
  final Function onTap;
  final String image;
  final String percent;
  final Color color;
  const Redeem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.btn,
    required this.onTap,
    required this.image,
    required this.color,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(12.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: color,
      ),
      height: 175.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: Text(
                    percent,
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(height: 14.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: 120,
                  height: 35,
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      onTap();
                    },
                    child: Text(
                      btn,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  alignment: Alignment.center,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                  ),
                ),
                Center(
                  child: Image.asset(
                    image,
                    height: 150,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
