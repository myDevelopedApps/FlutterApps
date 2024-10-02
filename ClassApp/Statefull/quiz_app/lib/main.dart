
import "package:flutter/material.dart";
void main(){

    runApp(const MyApp());;
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:QuizApp(),
    );
  }
}
class QuizApp extends StatefulWidget{
  const QuizApp({super.key});
  @override
  State createState()=>_QuizAppState();
}
class _QuizAppState extends State{

  List<Map> allQuestions=[
    {
      "question":"who is a founder of microsoft",
      "Options":["Steve Jobs","Bil Gates","Larry Page","Elon Musk"],
      "correctAnswer":1,
    },
    {
      "question":"who is a founder of google",
      "Options":["Steve Jobs","Bil Gates","Larry Page","Elon Musk"],
      "correctAnswer":2,
    },
    {
      "question":"who is a founder of spaceX",
      "Options":["Steve Jobs","Bil Gates","Larry Page","Elon Musk"],
      "correctAnswer":3,
    },
    {
      "question":"who is a founder of Apple",
      "Options":["Steve Jobs","Bil Gates","Larry Page","Elon Musk"],
      "correctAnswer":0,
    },
    {
      "question":"who is a founder of Meta",
      "Options":["Steve Jobs","Mark Zuckerberg","Larry Page","Elon Musk"],
      "correctAnswer":1,
    },
  ];

  int currentQuestionIndex=0;
  int selectedAnswerIndex=-1;
  int totalScore=0;

WidgetStateProperty<Color?> cheakAnswer(int answerIndex){
  if(selectedAnswerIndex!=-1){
    if(answerIndex==allQuestions[currentQuestionIndex]["correctAnswer"]){
      return const WidgetStatePropertyAll(Colors.green);
    }else if(selectedAnswerIndex==answerIndex){
      return const WidgetStatePropertyAll(Colors.red);
    }else{
      return const WidgetStatePropertyAll(null);
    }
  }else{
    return const WidgetStatePropertyAll(null);
  }
}

bool questionPage=true;
  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
  Scaffold isQuestionScreen(){
    if(questionPage==true){
      return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App",
          style: TextStyle(fontSize: 28,
          fontWeight: FontWeight.w900,color:
          Colors.orange
          ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:  Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            //   QUESTION NUMBER
            Row(
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  Text("Question :${currentQuestionIndex+1}/${allQuestions.length}"
                  ,style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  
                  ),
                  ),  
                ],
            ),
            const SizedBox(
              height: 30,
            ),
            
            SizedBox(
              width: 380,
              height: 50,
              child: Text(allQuestions[currentQuestionIndex]["question"],
              
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.purple,
              ),
              
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //OPTION 1
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: cheakAnswer(0),
                ),
                onPressed: () {
                  if(selectedAnswerIndex==-1){
                    selectedAnswerIndex=0;
                    setState(() {});
                  }
                },
                child: Text("A.${allQuestions[currentQuestionIndex]['Options'][0]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,

              //OPTION 2
            ), SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: cheakAnswer(1),
                ),
                onPressed: () {
                  if(selectedAnswerIndex==-1){
                    selectedAnswerIndex=1;
                    setState(() {});
                  }
                },
                child: Text("B.${allQuestions[currentQuestionIndex]['Options'][1]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //OPTION 3
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: cheakAnswer(2),
                ),
                onPressed: () {
                  if(selectedAnswerIndex==-1){
                    selectedAnswerIndex=2;
                    setState(() {});
                  }
                },
                child: Text("C.${allQuestions[currentQuestionIndex]['Options'][2]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //OPTION 4

            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: cheakAnswer(3),
                ),
                onPressed: () {
                  if(selectedAnswerIndex==-1){
                    selectedAnswerIndex=3;
                    setState(() {});
                  }
                },
                child: Text("D.${allQuestions[currentQuestionIndex]['Options'][3]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(selectedAnswerIndex!=-1){
              if(selectedAnswerIndex==allQuestions[currentQuestionIndex]['correctAnswer']){
                    totalScore++;
                }
              if(currentQuestionIndex<allQuestions.length-1){
                currentQuestionIndex++;
                
              }else{
                questionPage=false;
              }
              selectedAnswerIndex=-1;
                setState(() {});
            }
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.forward,color: Colors.orange,
          ),
        ), 
        backgroundColor: const Color.fromARGB(255, 200, 207, 119),  
    );
    }else{
      return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz Result",
          style: TextStyle(fontSize: 28,
          fontWeight: FontWeight.w600),
        
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://static.vecteezy.com/system/resources/thumbnails/019/013/598/small_2x/medal-awards-and-trophies-png.png" ,
              height: 200,),
              const SizedBox( height: 30,),
              const Text("Congratulations",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.orange,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Score:$totalScore/${allQuestions.length}",
              style:const TextStyle(fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black),),  

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: (){
                  questionPage=true;
                  currentQuestionIndex=0;
                  selectedAnswerIndex=-1;
                  totalScore=0;
                  setState((){});
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                child: const Text("Start Again",
                style:  TextStyle(fontSize: 22,
                fontWeight: FontWeight.w300,
                color: Colors.orange
                ),
                ),
              ) 
            ],
          ),
        ),
      );
    }
  }
}
