import 'package:expence_manager_ui_ux/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ExpenceManagerAppUI extends StatefulWidget {
  const ExpenceManagerAppUI({super.key});

  @override
  State createState() => _ExpenceManagerAppUIState();
}

class _ExpenceManagerAppUIState extends State {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<TodoModel> todoCards = [
    TodoModel(
        title: "Flutter",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vestibulum eros at elit lacinia, non laoreet nisi tempor. Proin nulla orci, laoreet vitae elit et, consectetur aliquam tortor. Nunc nec lorem rutrum, vestibulum tortor quis, efficitur felis. Ut a efficitur nunc. Nulla eu euismod augue.",
        date: "28 feb,2024"),
    TodoModel(
        title: "Java",
        description:
            "Nulla auctor odio vitae gravida efficitur. Nullam in arcu a sem lacinia pulvinar. Aenean varius ante aliquam eros ornare pellentesque. Curabitur at porta mauris. Vivamus vitae vulputate urna. Suspendisse pulvinar justo ac justo posuere, sit amet tempus tellus gravida. Praesent eleifend sollicitudin maximus. ",
        date: "25 feb,2024"),
    TodoModel(
        title: "Python",
        description:
            "Nullam sagittis pulvinar felis eu rhoncus. Sed augue ipsum, faucibus in ante a, euismod elementum ipsum. Nullam pulvinar felis nec egestas malesuada. Vestibulum ac ornare odio. Pellentesque pharetra libero id consequat viverra. Nulla aliquet efficitur vulputate. Duis blandit rhoncus fermentum. ",
        date: "28 feb,2024"),
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
        isDismissible: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 12,
              right: 12,
              top: 12,
            ),
            child: Column(
              ///USED TO SET SIZE OF BOTTOMSHEET AS MINIMUM
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create To-Do",
                      style: GoogleFonts.quicksand(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                ///TITLE
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: "Add Title Here...",
                          hintStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(117, 115, 115, 1),
                          ),

                          ///WHEN WE CLICK ON TEXTFIELD IT WILL SHOW FOUSEDBORDER
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(0, 139, 148, 1),
                            ),
                          ),

                          ///USED WHEN WE HAVE TO GIVE BORDER TO TEXTFIELD
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.purpleAccent,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///DESCRIPTION
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                      TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          hintText: "Add Description Here...",
                          hintStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(117, 115, 115, 1),
                          ),

                          ///WHEN WE CLICK ON TEXTFIELD IT WILL SHOW FOUSEDBORDER
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(0, 139, 148, 1),
                            ),
                          ),

                          ///USED WHEN WE HAVE TO GIVE BORDER TO TEXTFIELD
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.purpleAccent,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///DATE & DATE PICKER
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                      TextField(
                        controller: dateController,
                        decoration: InputDecoration(
                          hintText: "eg. Oct 20,2024",
                          hintStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(117, 115, 115, 1),
                          ),

                          ///WHEN WE CLICK ON TEXTFIELD IT WILL SHOW FOUSED BORDER
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(0, 139, 148, 1),
                            ),
                          ),

                          ///USED TO SHOW CALENDER
                          suffixIcon: const Icon(Icons.calendar_month_outlined),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.purpleAccent,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2002),
                            lastDate: DateTime(2025),
                          );
                          String formattedDate =
                              DateFormat.yMMMd().format(pickedDate!);

                          setState(() {
                            dateController.text = formattedDate;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 10,
                    bottom: 10,
                  ),
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
                        Color.fromRGBO(89, 57, 241, 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: GoogleFonts.quicksand(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
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
        backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 60,
                left: 40,
              ),
              child: Text(
                "Good morning",
                style: GoogleFonts.quicksand(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
              ),
              child: Text(
                "Sunil ,",
                style: GoogleFonts.quicksand(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 450,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              "CREATE TO DO LIST",
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 800,
                              width: 460,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                ),
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: todoCards.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                      ),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                            motion: const ScrollMotion(),
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 15,
                                                      ),
                                                      child: Container(
                                                        height: 36,
                                                        width: 36,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color.fromRGBO(
                                                              89, 57, 241, 1),
                                                        ),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            titleController
                                                                    .text =
                                                                todoCards[index]
                                                                    .title;
                                                            descriptionController
                                                                    .text =
                                                                todoCards[index]
                                                                    .description;
                                                            dateController
                                                                    .text =
                                                                todoCards[index]
                                                                    .date;

                                                            showBottomSheet(
                                                              true,
                                                              todoCards[index],
                                                            );

                                                            setState(() {});
                                                          },
                                                          child: const Icon(
                                                            Icons.edit,
                                                            color: Colors.white,
                                                            size: 22,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 7,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        //top: 5,
                                                        left: 15,
                                                      ),
                                                      child: Container(
                                                        height: 36,
                                                        width: 36,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color.fromRGBO(
                                                              89, 57, 241, 1),
                                                        ),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            todoCards.remove(
                                                                todoCards[
                                                                    index]);
                                                                    setState(() {
                                                                    });
                                                          },
                                                          child: const Icon(
                                                            Icons.delete,
                                                            color: Colors.white,
                                                            size: 22,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.16),
                                                  spreadRadius: 0,
                                                  blurRadius: 12,
                                                  offset: Offset(0, 4)),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Container(
                                                  height: 54,
                                                  width: 54,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromRGBO(
                                                        217, 217, 217, 1),
                                                  ),
                                                  child: Center(
                                                      child: SvgPicture.asset(
                                                    "assets/svg/img.svg",
                                                    height: 23,
                                                    // ignore: deprecated_member_use
                                                    color: Colors.white,
                                                  )),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        todoCards[index].title,
                                                        style: GoogleFonts
                                                            .quicksand(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          bottom: 5,
                                                          top: 5,
                                                        ),
                                                        child: Text(
                                                          todoCards[index]
                                                              .description,
                                                          style: GoogleFonts
                                                              .quicksand(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: const Color
                                                                .fromARGB(
                                                                255, 0, 0, 0),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        todoCards[index].date,
                                                        style: GoogleFonts
                                                            .quicksand(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showBottomSheet(false);
          },
          backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
