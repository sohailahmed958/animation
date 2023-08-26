
import 'package:flutter/material.dart';

class DirectionText extends StatefulWidget {
  const DirectionText({Key? key}) : super(key: key);

  @override
  State<DirectionText> createState() => _DirectionTextState();
}

class _DirectionTextState extends State<DirectionText> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('Directionality'),),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context,int index) {
              return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://www.whatsappimages.in/wp-content/uploads/2021/07/Top-HD-sad-quotes-for-whatsapp-status-in-hindi-Pics-Images-Download-Free.gif'),
                  ),
                title: Text('Roman Khan'),
                trailing: Icon(Icons.person),
              );
            }
      ),
    ),
    );
  }
}
