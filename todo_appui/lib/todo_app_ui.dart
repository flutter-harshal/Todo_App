import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_appui/todo_model.dart';

class ToDoAppUI extends StatefulWidget {
  const ToDoAppUI({super.key});

  @override
  State createState() => _ToDoAppUIState();
}

class _ToDoAppUIState extends State {
  List<ToDoModel> todoCards = [
    ToDoModel(
      title: "Flutter",
      description: "Dart,Oop",
      date: "12 November,2024",
    ),
    ToDoModel(
      title: "Java",
      description: "Exception,Oop",
      date: "13 November,2024",
    ),
    ToDoModel(
      title: "Python",
      description: "Generators,Oop",
      date: "14 November,2024",
    ),
  ];

  List<Color> cardColorsList = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];

  // TextEditingController<ToDoAppUI> dateController = TextEditingController();
  // TextEditingController<ToDoAppUI> titleController = TextEditingController();
  // TextEditingController<ToDoAppUI> descriptionController =
  //     TextEditingController();

  void showBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      isDismissible: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20.0,
            right: 20.0,
            top: 12.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create To-Do Task",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Title",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color.fromRGBO(0, 139, 148, 1),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.purpleAccent,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Discription",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color.fromRGBO(0, 139, 148, 1),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.purpleAccent,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Date",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color.fromRGBO(0, 139, 148, 1),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 139, 148, 1),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.purpleAccent,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: const Icon(
                    Icons.calendar_month_outlined,
                  ),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2025),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),

              //Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Color.fromRGBO(0, 139, 148, 1),
                  )),
                  child: Text(
                    "Submit",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        title: Text(
          "To-Do list",
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 26,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: todoCards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              // height: 112,
              // width: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: cardColorsList[index % cardColorsList.length],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      //Image
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          width: 52,
                          height: 52,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Image.asset("assets/Group 42.png"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),

                      //content
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              todoCards[index].title,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              todoCards[index].description,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          todoCards[index].date,
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: const Color.fromRGBO(132, 132, 132, 1),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.edit,
                          color: Color.fromRGBO(0, 139, 148, 1),
                        ),
                        const Icon(
                          Icons.delete,
                          color: Color.fromRGBO(0, 139, 148, 1),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet();
        },
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
//1.38