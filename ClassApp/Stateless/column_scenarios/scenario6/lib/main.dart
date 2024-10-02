import 'package:flutter/material.dart';

void main(){
  runApp(const MainApp());
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    print("Device Width:${MediaQuery.of(context).size.width}");
    print("Device height:${MediaQuery.of(context).size.height}");
    return  MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Column Demo",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.amber,
                )

              ],
            ),
          ),
        ),
    );
  }

}