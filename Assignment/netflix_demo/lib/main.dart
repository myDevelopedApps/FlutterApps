import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

void main(){
  runApp(const MainApp());
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("NetFlix Demo",
            style:  TextStyle(fontSize: 30,
            fontWeight:FontWeight.w400
            ),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: ListView.builder(
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            itemBuilder:(BuildContext context,int index){
              return   Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  const Text("Action Movie",
                  style: TextStyle(fontSize: 20,fontWeight:FontWeight.w400),),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 300,
                          width: 200,
                          child: Image.network("https://yt3.ggpht.com/a/AATXAJz_9qwvYLb-o372Lfj_bOf-TSAy3Sgq_M4tNg=s900-c-k-c0xffffffff-no-rj-mo"
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 300,
                          width: 200,
                          child: Image.network("https://yt3.ggpht.com/a/AATXAJz_9qwvYLb-o372Lfj_bOf-TSAy3Sgq_M4tNg=s900-c-k-c0xffffffff-no-rj-mo"
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 300,
                          width: 200,
                          child: Image.network("https://yt3.ggpht.com/a/AATXAJz_9qwvYLb-o372Lfj_bOf-TSAy3Sgq_M4tNg=s900-c-k-c0xffffffff-no-rj-mo"
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 300,
                          width: 200,
                          child: Image.network("https://yt3.ggpht.com/a/AATXAJz_9qwvYLb-o372Lfj_bOf-TSAy3Sgq_M4tNg=s900-c-k-c0xffffffff-no-rj-mo"
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 300,
                          width: 200,
                          child: Image.network("https://yt3.ggpht.com/a/AATXAJz_9qwvYLb-o372Lfj_bOf-TSAy3Sgq_M4tNg=s900-c-k-c0xffffffff-no-rj-mo"
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 300,
                          width: 200,
                          child: Image.network("https://yt3.ggpht.com/a/AATXAJz_9qwvYLb-o372Lfj_bOf-TSAy3Sgq_M4tNg=s900-c-k-c0xffffffff-no-rj-mo"
                          ),
                        ),
                      ],
                    ),
                  )
                ],

              );
            } 
            ),
        ),
    );
  }
}