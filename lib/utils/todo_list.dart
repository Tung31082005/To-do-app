import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.taskName, required this.taskCompleted, required this.onChanged, required this.deleteFunction});

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 0,
          ),
          // ham tao slide de xoa phan tu
          child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                SlidableAction(
                  // function xoa
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                  borderRadius: BorderRadius.circular(15),
                  backgroundColor: Colors.red,
                  )
              ]
              ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadiusDirectional.circular(15)
              ),
              
              child: Row(
                children: [
                  Checkbox(
                    value: taskCompleted, 
                    onChanged: onChanged,
                    checkColor: Colors.grey,
                    activeColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    ),
                  Text(
                    taskName,
                    style: TextStyle(color: Colors.white, fontSize: 18, 
                    decoration: 
                    //Dung trang thai cua taskCompleted de xac dinh luc nao dung gach ngang
                    taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                    ),
                    
                  ),
                ],
              ),
            ),
          ),
        );
  }
}