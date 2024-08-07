import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/home_controller.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerimp controller =Get.put(HomeControllerimp());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            width: 300,
            color: Colors.teal,
            height: 200,
            foregroundDecoration: RotatedCornerDecoration.withColor(
              color: Colors.red, badgeSize: Size(80, 80),
              //textDirection: TextDirection.rtl,
              badgePosition :BadgePosition.values[4],
              textSpan: TextSpan(text: "50%", style: TextStyle(color: Colors.white, fontSize: 20)),
              
            ),
            ),
          Container(
            child: Row(children: [
              Expanded(
                child: TextFormField(
                  
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: "search",
                    filled: true,
                    fillColor: Color.fromARGB(255, 219, 217, 216),
                    border: OutlineInputBorder()
                    
                  ),
                ),
              ),SizedBox(width: 5,), Container(color:  Color.fromARGB(255, 219, 217, 216),child: IconButton(onPressed: (){}, icon: Icon(Icons.search)),)
            ],),
          )
        ],
      ),
      )
    );
  }
}