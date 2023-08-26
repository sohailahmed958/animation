import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  bool _first = true;
  double _fontSize = 30;
  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedText'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Align( alignment: Alignment.center,
          child: SizedBox(
            height: 120,
            child: AnimatedDefaultTextStyle(
              duration: Duration(seconds: 1),
              style: TextStyle(
                fontSize: _fontSize,
                fontWeight: FontWeight.bold,
                color: _color
              ),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _fontSize = _first ? 130 : 30;
                    _color = _first ? Colors.purpleAccent : Colors.red;
                    _first = !_first;
                  });
                },
                child: Text('TEXT'),
              ),
            ),
          ),
        )
      ],),
    );
  }

}
