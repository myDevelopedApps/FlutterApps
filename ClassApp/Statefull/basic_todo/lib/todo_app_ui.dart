import 'package:basic_todo/todo_model.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:flutter_svg/svg.dart';

class TodoAppUI extends StatefulWidget {
  const TodoAppUI({super.key});
  @override
  State<StatefulWidget> createState() => _TodoAppUIState();
}

class _TodoAppUIState extends State {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<Color> cardColorList = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];

  List<TodoModel> todoCards = [
    TodoModel(
        title: "Flutter", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vestibulum eros at elit lacinia, non laoreet nisi tempor. Proin nulla orci, laoreet vitae elit et, consectetur aliquam tortor. Nunc nec lorem rutrum, vestibulum tortor quis, efficitur felis. Ut a efficitur nunc. Nulla eu euismod augue.", date: "28 feb,2024"),
    TodoModel(
        title: "Java", description: "Nulla auctor odio vitae gravida efficitur. Nullam in arcu a sem lacinia pulvinar. Aenean varius ante aliquam eros ornare pellentesque. Curabitur at porta mauris. Vivamus vitae vulputate urna. Suspendisse pulvinar justo ac justo posuere, sit amet tempus tellus gravida. Praesent eleifend sollicitudin maximus. ", date: "25 feb,2024"),
    TodoModel(
        title: "Python", description: "Nullam sagittis pulvinar felis eu rhoncus. Sed augue ipsum, faucibus in ante a, euismod elementum ipsum. Nullam pulvinar felis nec egestas malesuada. Vestibulum ac ornare odio. Pellentesque pharetra libero id consequat viverra. Nulla aliquet efficitur vulputate. Duis blandit rhoncus fermentum. ", date: "28 feb,2024"),
  ];

  void submit(bool isEdit, [TodoModel? todoObj]) {
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (isEdit) {
        //EDIT
        todoObj!.title = titleController.text;
        todoObj.description = descriptionController.text;
        todoObj.date = dateController.text;
      } else {
        //NEW ADD
        todoCards.add(TodoModel(
            title: titleController.text,
            description: descriptionController.text,
            date: dateController.text));
      }
    }
    Navigator.of(context).pop();
    clearController();
    setState(() {});
  }

  void clearController() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  void showBottomSheet(bool isEdit, [TodoModel? todoObj]) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 12,
              right: 12,
              left: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create ToDo",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 139, 141, 1),
                  ),
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ))),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Decription",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 139, 141, 1),
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ))),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Date",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 139, 141, 1),
                  ),
                ),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 139, 148, 1),
                          )),
                      suffixIcon: const Icon(
                        Icons.calendar_month_outlined,
                      )),
                  onTap: () async {
                    DateTime? pickDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2025));
                    String formattedDate = DateFormat.yMMMd().format(pickDate!);
                    setState(() {
                      dateController.text = formattedDate;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (isEdit == true) {
                        submit(true, todoObj);
                      } else {
                        submit(false);
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromRGBO(0, 139, 148, 1)),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        });
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
          padding: const EdgeInsets.all(12),
          child: ListView.builder(
            itemCount: todoCards.length,
            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
            itemBuilder: (BuildContext, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 130,
                  width: 400,
                  decoration: BoxDecoration(
                    // color: const Color.fromRGBO(250, 232, 232, 1),
                    color: cardColorList[index % cardColorList.length],
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
                              height: 62,
                              width: 62,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Colors.white,
                              ),
                              child: Center(
                                child:
                                    SvgPicture.asset("assets/svg/Group42.svg"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 235,
                                  child: Center(
                                    child: Text(
                                      todoCards[index].title,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 54,
                                  width: 235,
                                  child: Text(
                                    todoCards[index].description,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            todoCards[index].date,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          GestureDetector(
                              onTap: () {
                                titleController.text = todoCards[index].title;
                                descriptionController.text =
                                    todoCards[index].description;
                                dateController.text = todoCards[index].date;

                                showBottomSheet(
                                  true,
                                  todoCards[index],
                                );

                                setState(() {});
                              },
                              child: SvgPicture.asset("assets/svg/Vector.svg")),
                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                              onTap: () {
                                todoCards.remove(todoCards[index]);
                                setState(() {});
                              },
                              child: SvgPicture.asset(
                                "assets/svg/Vector1.svg",
                              )),
                        ],
                      )
                    ]),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showBottomSheet(false);
          },
          backgroundColor: const Color.fromRGBO(0, 139, 141, 1),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
