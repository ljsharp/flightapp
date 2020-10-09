import 'package:flutter/material.dart';

import 'CustomShapeClipper.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flight App",
      home: HomeScreen(),
      theme: appTheme,
    ));

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);

ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFFF3791A),
  fontFamily: "Oxygen",
);

const locations = ["Ghana (GH)", "Nigeria (NG)"];

const dropPopMenuLabelStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);
const dropPopMenuItemStyle = TextStyle(
  color: Colors.black,
  fontSize: 16.0,
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeScreenTopPart(
            height: /*MediaQuery.of(context).size.height / 2*/ 400.0,
          ),
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  final height;
  HomeScreenTopPart({
    Key key,
    this.height,
  }) : super(key: key);

  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocation = 0;
  var isSelectedFlight = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                firstColor,
                secondColor,
              ]),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedLocation = index;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              locations[selectedLocation],
                              style: dropPopMenuLabelStyle,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text(
                              locations[0],
                              style: dropPopMenuItemStyle,
                            ),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text(
                              locations[1],
                              style: dropPopMenuItemStyle,
                            ),
                            value: 1,
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 22.0,),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(50.0),
                    child: TextField(
                      controller: TextEditingController(
                        text: locations[0],
                      ),
                      style: dropPopMenuItemStyle,
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 13.0,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Material(
                          elevation: 2.0,
                          child: Icon(
                            Icons.search,
                            color: appTheme.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ChoiceChip(
                      icon: Icons.flight_takeoff,
                      text: "Flight",
                      isSelected: isSelectedFlight,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    ChoiceChip(
                      icon: Icons.hotel,
                      text: "Hotels",
                      isSelected: isSelectedFlight,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  const ChoiceChip({
    Key key,
    this.icon,
    this.text,
    this.isSelected,
  }) : super(key: key);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0,),
      decoration: widget.isSelected ? BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20.0)
      ) : null,
      child: Row(
        children: [
          Icon(
            widget.icon,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
