import 'package:flutter/material.dart';
void main(){
  runApp(const ToggleColor());
}
class ToggleColor extends StatefulWidget{
  const ToggleColor({super.key});

  @override
  State<StatefulWidget> createState()=> _ToggleColorState();
}
class _ToggleColorState extends State{

  bool changecolor=true;
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Toggle_color"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:  Center(
          child: Container(
                height: 200,
                width: 250,
                color:changecolor?Colors.red:Colors.black,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(changecolor==true){
              changecolor=false;
            }else{
              changecolor=true;
            }
            setState(() {});
          },
          backgroundColor: Colors.blue,
          child: const Text("click Me")
        ),
      ),
    );

  }
}