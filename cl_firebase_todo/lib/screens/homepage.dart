import 'package:cl_firebase_todo/model/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../services/auth_service.dart';
import '../widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthClass _auth = AuthClass();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  final Stream<QuerySnapshot?> _stream =
      FirebaseFirestore.instance.collection("ToDo").snapshots();

  List<ToDo> firestoreToDos = [];
  // List<Select> selected = [];

  @override
  void initState() {
    fetchFirestoreData();
    // _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _appBarWidget(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: searchBox(),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: const Text(
                          'All ToDos',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (ToDo todo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                          hintText: 'Add a new todo item',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_todoController.text.isNotEmpty) {
                        _addToDoItem(_todoController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      "+",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addToDoItem(String toDo) async {
    await FirebaseFirestore.instance.collection("ToDo").add({
      "id": DateTime.now().microsecondsSinceEpoch.toString(),
      "todoText": _todoController.text,
    });
    print("added todo to db");
    // setState(() {
    //   todosList.add(
    //     ToDo(
    //       id: DateTime.now().microsecondsSinceEpoch.toString(),
    //       todoText: toDo,
    //     ),
    //   );
    // });
    _todoController.clear();
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    var instance = FirebaseFirestore.instance.collection("ToDo");

    instance.doc().delete();

    // setState(() {
    //   todosList.removeWhere((item) => item.id == id);
    // });
  }

  AppBar _appBarWidget() {
    return AppBar(
      backgroundColor: tdBGColor,
      leading: GestureDetector(
        onTap: () {
          print("Logout");
          _auth.signout(context: context);
          Navigator.pushNamed(context, "/signIn");
          // showToast(message: "Successfully signed out");
        },
        child: const Icon(
          Icons.logout,
          color: tdBlack,
          size: 30,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/user.png'),
            ),
          ),
        )
      ],
    );
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        // onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  // void _runFilter(String enteredKeyword) {
  //   List<ToDo> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     results = todosList;
  //   } else {
  //     results = todosList
  //         .where((item) => item.todoText!
  //             .toLowerCase()
  //             .contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //   }

  //   setState(() {
  //     _foundToDo = results;
  //   });
  // }

  void fetchFirestoreData() {
    FirebaseFirestore.instance
        .collection('ToDo')
        .get()
        .then((QuerySnapshot snapshot) {
      List<ToDo> fetchedToDos = [];
      snapshot.docs.forEach((DocumentSnapshot doc) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

        if (data != null) {
          ToDo todo = ToDo(
            id: doc.id,
            todoText: data['todoText'] ??
                '', // Replace 'todoText' with your actual field name
          );
          fetchedToDos.add(todo);
        }
      });

      setState(() {
        _foundToDo = fetchedToDos.reversed.toList();
      });
    }).catchError((error) {
      print('Error fetching Firestore data: $error');
    });
  }
}
