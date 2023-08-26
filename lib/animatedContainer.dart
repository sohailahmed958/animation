import 'dart:math';

import 'package:flutter/material.dart';

class ImageText extends StatefulWidget {
  const ImageText({Key? key}) : super(key: key);

  @override
  State<ImageText> createState() => _ImageTextState();
}

class _ImageTextState extends State<ImageText> {
  static const double minSize = 50;
  static const double maxSize = 200;
  double width = maxSize;
  double height = maxSize;
  Color color = Colors.green;
  BorderRadius borderRadius = BorderRadius.zero;
  bool isSmall = true;
  //var _urlList = ['https://pixabay.com/photos/tree-sunset-clouds-sky-silhouette-736885/','https://pixabay.com/photos/flowers-meadow-sunlight-summer-276014/','https://pixabay.com/photos/road-forest-fall-autumn-season-1072823/','https://pixabay.com/photos/avenue-trees-path-sunbeams-sunrays-815297/','https://pixabay.com/photos/pink-cherry-blossoms-flowers-branch-324175/','https://pixabay.com/photos/pink-cherry-blossoms-flowers-branch-324175/','https://pixabay.com/photos/road-forest-fall-path-trail-trees-1072821/'];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSmall = !isSmall;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  width: isSmall ? 50 : 170,
                  height: 50,
                  child: isSmall ? buildShrinked() : buildStretched(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.black.withOpacity(0.1),
                width: maxSize,
                height: maxSize,
                child: Center(
                    child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInBack,
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: borderRadius,
                  ),
                )),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  // shape: StadiumBorder(),
                  // color: Colors.red,
                  child: Text(
                    'Do Magic!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    final random = Random();
                    // Color
                    final red = random.nextInt(225);
                    final green = random.nextInt(225);
                    final blue = random.nextInt(225);
                    final color = Color.fromRGBO(red, green, blue, 1);

                    // Size
                    final size = generateSize();

                    // BorderRadius
                    final borderRadius =
                        BorderRadius.circular(random.nextDouble() * 80);
                    setState(() {
                      this.color = color;
                      this.width = size.width;
                      this.height = size.height;
                      this.borderRadius = borderRadius;
                    });
                  })
            ],
          ),
        ),
      );
  Size generateSize() {
    final random = Random();
    final addMax = maxSize.toInt() - minSize.toInt();
    final width = minSize + random.nextInt(addMax);
    final height = minSize + random.nextInt(addMax);
    return Size(width, height);
  }

  Widget buildStretched() => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.red, width: 2.5),
            borderRadius: BorderRadius.circular(24)),
        child: Center(
          child: FittedBox(
            child: Text(
              'FOLLOW',
              style: TextStyle(
                  color: Colors.red,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
  Widget buildShrinked() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.red),
        child: Icon(
          Icons.people,
          color: Colors.white,
        ),
      );
}
