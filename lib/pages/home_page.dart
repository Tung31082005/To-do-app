import 'package:flutter/material.dart';
import 'package:to_do_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {// chuyen stl sang stf de co the cap nhap duoc checkbox khi bam
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controler = TextEditingController();
  List toDoList = [
    ['Hello', false],
  ];

  void CheckBoxChanged(int index){
    //goi trong setState de co the cap nhap trang thai
    setState(() {
      toDoList[index][1] = ! toDoList[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      toDoList.add([_controler.text, false]);
      _controler.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      // tao thanh taskbar
      appBar: AppBar(
        title: const Text(
          'To Do App',
        ),
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.white,
      ),
      // Tạo listview cho list có thể scroll lấy thông tin từ List Todolist
      body: ListView.builder(itemCount: toDoList.length, itemBuilder: (BuildContext context, index){
        // hien thi TodoList
          return TodoList(
            // taskname goi danh sach cua toDolist sang Todolist de ket hop vs container
            taskName: toDoList[index][0],
            //hien thi trang thai checkbox
            taskCompleted: toDoList[index][1],
            //thay doi trang thai checkbox
            onChanged: (value) => CheckBoxChanged(index),
            deleteFunction: (context) => deleteTask(index),
          );
        }
      ),
      //tao nut add them danh sach
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controler,
                decoration: InputDecoration(
                  hintText: 'Add a new toDo items',
                  filled: true,
                  fillColor: Colors.grey.shade600,
                  enabledBorder: OutlineInputBorder(
                    borderSide:const BorderSide(
                      color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(15)
                  )
                ),
              ),
            )
            ),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: const Icon(Icons.add)
          ),
        ],
      ),
    );
  }
}