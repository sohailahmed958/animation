
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> with TickerProviderStateMixin {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Animated Positioned'),),
        body: SizedBox(
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                width: selected ? 360.0 : 360.0,
                height: selected ? 50.0 : 50.0,
                top: selected ? 1.0 : 510.0,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Container(
                    color: selected ? Colors.blue : Colors.red,
                    child: Center(child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.menu),
                        Icon(Icons.search)
                      ],)),
                  ),
                ),
              ),
            ],


            /* AnimatedSize(
              vsync: this,
              duration: Duration(seconds: 1),
          child: Container(
            height: double.infinity,
            child: Image.network('https://picsum.photos/250?image=9',
            fit: BoxFit.cover,),),)  */
          ),
        ),
      ),
    );
  }
}
