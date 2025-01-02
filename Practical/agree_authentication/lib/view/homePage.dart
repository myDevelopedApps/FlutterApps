//import 'package:expence_manager_ui_ux/todo_model.dart';
//import 'dart:ffi';

//import 'package:expence_manager_ui_ux/farmerScreen.dart';
//import 'package:expence_manager_ui_ux/formerScreen.dart';
//import 'package:expence_manager_ui_ux/model_agreeConnect.dart';
//import 'package:expence_manager_ui_ux/widgets/searchbar.dart';
import 'package:agree_authentication/controller/widgets/searchBar.dart';
import 'package:agree_authentication/model/farmerModel.dart';
import 'package:agree_authentication/view/farmerScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:intl/intl.dart';

class ExpenceManagerAppUI extends StatefulWidget {
  const ExpenceManagerAppUI({super.key});

  @override
  State createState() => _ExpenceManagerAppUIState();
}

// ignore: non_constant_identifier_names

class _ExpenceManagerAppUIState extends State {
  TextEditingController nameController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController chargeController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  //TextEditingController contactController=TextEditingController();

  List<TodoModel> todoCards = [
    TodoModel(
        name: "Sunil Bandichode",
        skill: "Harvesting Crop,Shrub Crops, Vaccinations",
        charge: "800rs per day",
        contact: "8234543456",
        age: "22"),
    TodoModel(
        name: "Anurag Zade",
        skill: "Harvesting Crop,Shrub Crops, Vaccinations",
        charge: "900rs per day",
        contact: "9856214588",
        age: "22"),
    TodoModel(
        name: "Pranav",
        skill: "Harvesting Crop,Shrub Crops, Vaccinations",
        charge: "800rs per day",
        contact: "9632655552",
        age: "22"),
  ];

  void submit(bool isEdit, [TodoModel? todoObj]) {
    if (nameController.text.trim().isNotEmpty &&
        skillController.text.trim().isNotEmpty &&
        chargeController.text.trim().isNotEmpty &&
        ageController.text.trim().isNotEmpty &&
        contactController.text.trim().isNotEmpty) {
      if (isEdit) {
        //EDIT
        todoObj!.name = nameController.text;
        todoObj.skill = skillController.text;
        todoObj.charge = chargeController.text;
        todoObj.age = ageController.text;
        todoObj.contact = contactController.text;
      } else {
        //NEW ADD
        todoCards.add(TodoModel(
          name: nameController.text,
          skill: skillController.text,
          charge: chargeController.text,
          contact: contactController.text,
          age: ageController.text,
        ));

        Map<String, dynamic> info = {
          "workerName": nameController.text.trim(),
          "Age": ageController.text.trim(),
          "contact": contactController.text.trim(),
          "skills": skillController.text.trim(),
          "charge": chargeController.text.trim(),
        };
        FirebaseFirestore.instance.collection("Farmer Information").add(info);
        nameController.clear();
        ageController.clear();
        contactController.clear();
        skillController.clear();
        chargeController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Submitted"),
          ),
        );
      }
    }
    Navigator.of(context).pop();
    clearController();
    setState(() {});
  }

  void clearController() {
    nameController.clear();
    skillController.clear();
    chargeController.clear();
    ageController.clear();
    contactController.clear();
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
                      "ADD WORKER",
                      style: GoogleFonts.quicksand(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                ///name
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Worker Name",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "eg Sunil Banichode",
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

                ///skill
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Age",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                      TextField(
                        controller: ageController,
                        decoration: InputDecoration(
                          hintText: "Add Age Here...",
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

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "contact",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                      TextField(
                        controller: contactController,
                        decoration: InputDecoration(
                          hintText: "Male/Female",
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

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Skills",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                      TextField(
                        controller: skillController,
                        decoration: InputDecoration(
                          hintText: "Add Skills Here...",
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

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Charges",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(89, 57, 241, 1),
                        ),
                      ),
                      TextField(
                        controller: chargeController,
                        decoration: InputDecoration(
                          hintText: "eg.800 per day",
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

                ///charge & charge PICKER

                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 5,
                    bottom: 5,
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
        home: Builder(
          builder: (context) => Scaffold(
            backgroundColor: Colors.green,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                    left: 40,
                  ),
                  child: Text(
                    "Worker",
                    style: GoogleFonts.quicksand(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 40,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const MysearchBar(),
                            const SizedBox(
                              height: 20,
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
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const farmerScreen(Index)));
                                  },
                                  child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: todoCards.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 7,
                                              bottom: 7,
                                              left: 10,
                                              right: 10),
                                          child: Container(
                                            height: 150,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              boxShadow: const [
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
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Container(
                                                      height: 94,
                                                      width: 84,
                                                      decoration: BoxDecoration(
                                                        shape:
                                                            BoxShape.rectangle,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: const Color
                                                            .fromRGBO(
                                                            217, 217, 217, 1),
                                                      ),
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      child: Image.asset(
                                                        "assets/images/farmer2.jpg",
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          todoCards[index].name,
                                                          style: GoogleFonts
                                                              .quicksand(
                                                            fontSize: 22,
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
                                                                .skill,
                                                            style: GoogleFonts
                                                                .quicksand(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255, 0, 0, 0),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        // Text(
                                                        //   todoCards[index].charge,
                                                        //   style: GoogleFonts
                                                        //       .quicksand(
                                                        //     fontSize: 12,
                                                        //     fontWeight:
                                                        //         FontWeight.w800,
                                                        //     color: const Color
                                                        //         .fromARGB(
                                                        //         255, 0, 0, 0),
                                                        //   ),
                                                        // ),
                                                        //Spacer(),
                                                        Row(children: [
                                                          //Expanded(child: Image.asset("assets/images/star.png")),

                                                          const Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          const Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          const Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .star_border_outlined,
                                                            //color: Colors.amber,
                                                          ),
                                                          //  SvgPicture.asset("assets/svg/Vector.svg"),
                                                          //  SvgPicture.asset("assets/svg/Vector2.svg"),

                                                          //   const Icon(Icons.call,
                                                          //   size: 20,),
                                                          //   const SizedBox(
                                                          //     width: 4,
                                                          //   ),

                                                          // //   Text(
                                                          //   todoCards[index].contact,
                                                          //   style: GoogleFonts
                                                          //       .quicksand(
                                                          //     fontSize: 14,
                                                          //     fontWeight:
                                                          //         FontWeight.w600,
                                                          //     color: const Color
                                                          //         .fromARGB(
                                                          //         255, 0, 0, 0),
                                                          //   ),
                                                          // ),

                                                          const Spacer(),
                                                          Container(
                                                            height: 36,
                                                            width: 36,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,

                                                              color:
                                                                  Colors.green,
                                                              //  Color.fromRGBO(
                                                              //     89,
                                                              //     57,
                                                              //     241,
                                                              //     1),
                                                            ),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                nameController
                                                                        .text =
                                                                    todoCards[
                                                                            index]
                                                                        .name;
                                                                skillController
                                                                        .text =
                                                                    todoCards[
                                                                            index]
                                                                        .skill;
                                                                chargeController
                                                                        .text =
                                                                    todoCards[
                                                                            index]
                                                                        .charge;
                                                                ageController
                                                                        .text =
                                                                    todoCards[
                                                                            index]
                                                                        .age;
                                                                contactController
                                                                        .text =
                                                                    todoCards[
                                                                            index]
                                                                        .contact;

                                                                showBottomSheet(
                                                                    true,
                                                                    todoCards[
                                                                        index]);
                                                                setState(() {});
                                                              },
                                                              child: const Icon(
                                                                Icons.edit,
                                                                color: Colors
                                                                    .white,
                                                                size: 22,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),

                                                          GestureDetector(
                                                            onTap: () {
                                                              todoCards.remove(
                                                                  todoCards[
                                                                      index]);
                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              height: 36,
                                                              width: 36,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .green,
                                                                // color: Color.fromRGBO(
                                                                //     89, 57, 241, 1),
                                                              ),
                                                              child: const Icon(
                                                                Icons.delete,
                                                                color: Colors
                                                                    .white,
                                                                size: 22,
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ),
                          ],
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
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
