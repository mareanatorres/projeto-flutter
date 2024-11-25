import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<ToDoListScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tarefas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(labelText: 'Nova tarefa'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () async {
                    if (_taskController.text.isNotEmpty) {
                      await _firestore.collection('tasks').add({
                        'task': _taskController.text,
                        'isDone': false,
                        'timestamp': Timestamp.now(),
                      });
                      _taskController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('tasks')
                  .orderBy('isDone')
                  .orderBy('task')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final tasks = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return ListTile(
                      title: Text(task['task']),
                      leading: Checkbox(
                        value: task['isDone'],
                        onChanged: (value) async {
                          await _firestore
                              .collection('tasks')
                              .doc(task.id)
                              .update({'isDone': value});
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
