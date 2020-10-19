import 'package:flutter/material.dart';


// a Custom Widget Made to be Used as a Bottom Drawer

class MyBottomDrawer extends StatefulWidget {
  @override
  _MyBottomDrawerState createState() => _MyBottomDrawerState();
}

class _MyBottomDrawerState extends State<MyBottomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.grey[100]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlatButton(

              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  children: [
                    Icon(Icons.camera_alt,color: Colors.grey,),
                    SizedBox(width: 20,),
                    Text('Use camera',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black54,fontSize: 16) ,),
                  ],
                ),
              ),
            ),
            FlatButton(

              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  children: [
                    Icon(Icons.collections,color: Colors.grey,),
                    SizedBox(width: 20,),
                    Text('Choose from gallery',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black54,fontSize: 16) ,),
                  ],
                ),
              ),
            ),
            FlatButton(

              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  children: [
                    Icon(Icons.create,color: Colors.grey,),
                    SizedBox(width: 20,),
                    Text('Write a story',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black54,fontSize: 16) ,),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
