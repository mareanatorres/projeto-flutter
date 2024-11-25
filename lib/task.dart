import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  // Lista de tarefas
  List<Map<String, dynamic>> tasks = [];

  // Controlador para o campo de entrada de texto
  TextEditingController _taskController = TextEditingController();

  // Função para adicionar uma nova tarefa
  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        tasks.add({
          'description': _taskController.text,
          'completed': false,
        });
      });
      _taskController.clear(); // Limpa o campo de entrada
    }
  }

  // Função para remover uma tarefa
  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  // Função para marcar a tarefa como concluída
  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de entrada para adicionar tarefa
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: "Adicionar Tarefa",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Botão para adicionar a tarefa
            ElevatedButton(
              onPressed: _addTask,
              child: Text("Adicionar Tarefa"),
            ),
            SizedBox(height: 20),
            // Exibe a lista de tarefas
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        task['description'],
                        style: TextStyle(
                          decoration: task['completed']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Ícone para marcar tarefa como concluída
                          IconButton(
                            icon: Icon(
                              task['completed'] ? Icons.undo : Icons.check,
                              color: task['completed'] ? Colors.green : null,
                            ),
                            onPressed: () => _toggleTaskCompletion(index),
                          ),
                          // Ícone para remover a tarefa
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removeTask(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
