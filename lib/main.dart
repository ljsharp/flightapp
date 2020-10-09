import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Flight App",
    home: HomeScreen(),
  )
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  HomeScreenTopPart(double heightSize, {Key key, }) : super(key: key);

  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ClipPath(
        //   clipper: CustomShapeClipper(),
        // ),
        Container(
          height: 12,
        ),
      ],
    );
  }
}