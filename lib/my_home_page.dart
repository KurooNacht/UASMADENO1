import 'package:flutter/material.dart';
import 'package:madeuas/todo_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 147, 148, 149),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Todo Application",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.task,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Todo List",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(60),
                ),
                color: Colors.white,
              ),
              child: Consumer<TodoModel>(
                builder: (context, todo, child) {
                  return ListView.builder(
                    itemCount: todo.taskList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(
                            left: 32,
                            right: 32,
                            top: 8,
                            bottom: 8,
                          ),
                          title: Text(
                            todo.taskList[index].title,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            todo.taskList[index].detail,
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          bottom: 8,
                          left: 16,
                          right: 16,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<TodoModel>(context, listen: false).addTaskInList();
        },
      ),
    );
  }
}
