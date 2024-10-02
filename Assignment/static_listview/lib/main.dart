import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Divice Width:${MediaQuery.of(context).size.width}");
    print("Divece Widht:${MediaQuery.of(context).size.height}");
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ListVeiw Demo",
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:ListView(
          children: [
            Image.network("https://incubator.ucf.edu/wp-content/uploads/2023/07/artificial-intelligence-new-technology-science-futuristic-abstract-human-brain-ai-technology-cpu-central-processor-unit-chipset-big-data-machine-learning-cyber-mind-domination-generative-ai-scaled-1-1500x1000.jpg"),
            const Icon(Icons.favorite,
            color: Colors.red,
            ),
            const Text("Bharii",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            Image.network("https://incubator.ucf.edu/wp-content/uploads/2023/07/artificial-intelligence-new-technology-science-futuristic-abstract-human-brain-ai-technology-cpu-central-processor-unit-chipset-big-data-machine-learning-cyber-mind-domination-generative-ai-scaled-1-1500x1000.jpg"),
            GestureDetector(
              onTap: () {
                print("Button Pressed");
              },
              child: Container(
                height: 50,
                color: Colors.amber,
                child: const Text("Press me"),
              ),
            ),
             Image.network("https://incubator.ucf.edu/wp-content/uploads/2023/07/artificial-intelligence-new-technology-science-futuristic-abstract-human-brain-ai-technology-cpu-central-processor-unit-chipset-big-data-machine-learning-cyber-mind-domination-generative-ai-scaled-1-1500x1000.jpg"),
            const Icon(Icons.favorite,
            color: Colors.red,
            ),
            const Text("Bharii",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),

            Image.network("https://incubator.ucf.edu/wp-content/uploads/2023/07/artificial-intelligence-new-technology-science-futuristic-abstract-human-brain-ai-technology-cpu-central-processor-unit-chipset-big-data-machine-learning-cyber-mind-domination-generative-ai-scaled-1-1500x1000.jpg"),
            const Icon(Icons.favorite,
            color: Colors.red,
            ),
            const Text("Bharii",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
             Image.network("https://incubator.ucf.edu/wp-content/uploads/2023/07/artificial-intelligence-new-technology-science-futuristic-abstract-human-brain-ai-technology-cpu-central-processor-unit-chipset-big-data-machine-learning-cyber-mind-domination-generative-ai-scaled-1-1500x1000.jpg"),
            const Icon(Icons.favorite,
            color: Colors.red,
            ),
            const Text("Bharii",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
          ],
        )
      ),
    );
  }
}
