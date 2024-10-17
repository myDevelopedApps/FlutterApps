import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<StatefulWidget> createState() => _TodoAppState();
}

class _TodoAppState extends State {

  void openBottamSHeet(){
    showModalBottomSheet(
      context: context, 
      builder: (context){
        return const Column(
          children: [
            Center(child: const Text("Create Task",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [

                const Text("Title"),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  
                )



              ],
            )
          ],
          
        );
        
      }
      );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "To-do list",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: 10,
            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
            itemBuilder: (BuildContext, Index) {
              return Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                  height: 112,
                  width: 330,
                  decoration: BoxDecoration(
                   // color: const Color.fromRGBO(250, 232, 232, 1),
                    color: changeColor(Index),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7),
                            child: Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                color: Colors.white,
                              ),
                              child: Center(
                                child:
                                    SvgPicture.asset("assets/svg/Group 42.svg"),
                              ),
                            ),
                          ),
                          const Column(
                            children: [
                              SizedBox(
                                height: 15,
                                width: 235,
                                child: Text(
                                  "Lorem Ipsum is simply setting industry.",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 44,
                                width: 235,
                                child: Text(
                                  "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "10 july 2023",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          SvgPicture.asset("assets/svg/Vector.svg"),
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset("assets/svg/Vector1.svg")
                        ],
                      )
                    ]),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton:FloatingActionButton(
          onPressed: (){
            openBottamSHeet();
          },
          backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
          child: const Icon(Icons.add,
          color: Colors.white,),
        

        )
      ),
    );
  }
}

Color changeColor(int index){
  if(index%4==0) {
    return const  Color.fromRGBO(250, 232, 232, 1);
  } else if(index%4==1){
        return const  Color.fromRGBO(232, 237, 250, 1);
  }else if(index%4==2){
        return const  Color.fromRGBO(250, 249, 232, 1);
  }else{
            return const  Color.fromRGBO(250, 232,250, 1);
  }
}
