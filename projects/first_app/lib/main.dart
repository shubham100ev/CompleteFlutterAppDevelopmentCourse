import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: Home(),
    ));

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Hello Again"),
          backgroundColor: Colors.pinkAccent,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Text("Button"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade400,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () => debugPrint("Email"),
          ),
          IconButton(
            icon: Icon(Icons.alarm_add),
            onPressed: () => debugPrint("Tapped"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.call_missed),
        onPressed: null,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Frist")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("Second")),
        ],
        onTap: (int index) => debugPrint("Tapped item : $index"),
      ),
      body: Center(
        child: CustomButton(),
//        child: InkWell(
//            child: Text("Hello here"),
//        ),
      ),
    );

//    return Material(
//      color: Colors.blueGrey,
//      child: Center(
//          child: Text("Hello Flutter",
//            textDirection: TextDirection.ltr,)
//      ),
//    );

//    return Center(
//      child: Text("Hello Flutter",
//          textDirection: TextDirection.ltr,),
//    );
  }
}
