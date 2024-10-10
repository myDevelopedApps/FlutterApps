//import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
//import "package:flutter/widgets.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recomended",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.blue,
          ),
        ),
        leading: const Icon(Icons.arrow_back),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text("Start a new career",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                    ),)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 91, 145, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Data Science",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 221, 231, 235),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Machine Learning",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 6, 85, 149),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 221, 231, 235),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Apache Spark",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                                                        color: Color.fromARGB(255, 6, 85, 149),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 221, 231, 235),
                            ),
                            child: Row(
                              children: [
                                Container(
                                margin:const  EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  height: 150,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromARGB(255, 8, 49, 110),
                                  ),
                                child: const Text("</>",
                                style: TextStyle(
                                    fontSize: 90,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                ),),
                                ),
                                const SizedBox(
                                    width: 5,
                                ),

                                 Column(
                                    children: [
                                        const SizedBox(
                                            height: 20,
                                        ),
                                       const  Text("Data Science           ",
                                        style: TextStyle(fontSize: 25,
                                        fontWeight: FontWeight.w700),
                                        ),
                                       const  SizedBox(
                                            height: 20,
                                            width: 200,
                                            child:  Text("Harvard Univercity                    "),
                                        ),
                                        const SizedBox(
                                            height: 60,
                                            width: 200,
                                            child:  Text("lorem isputn the organge that behdith hatshiun",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700
                                            ),),
                                        ),

                                        Row(
                                            children: [
                                                Container(
                                                    alignment: Alignment.center,
                                                    height: 40,
                                                    width: 120,
                                                    
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5),
                                                         color: Color.fromARGB(255, 179, 227, 240),
                                                    ),
                                                    child: const Text("Machine Learning",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w900,
                                                        color: Color.fromARGB(255, 6, 85, 149),
                                                    ),),
                                                ),
                                                const SizedBox(
                                                    width: 5,
                                                ),
                                                 Container(
                                                    alignment: Alignment.center,
                                                    height: 40,
                                                    width: 100,
                                                    
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(4),
                                                         color: Color.fromARGB(255, 179, 227, 240),
                                                    ),
                                                    child: const Text("Data Science",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w900,
                                                        color: Color.fromARGB(255, 6, 85, 149),
                                                    ),),
                                                ),

                                            ],
                                        )

                                    ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    ));
  }
}
