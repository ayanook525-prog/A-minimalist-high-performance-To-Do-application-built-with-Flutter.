import 'package:flutter/material.dart';

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFd5d9e0),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14)
              )
          )
      ),
      home: ToDoApp(),
    );
  }
}



class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {

  final List<String> todos = [];
  final TextEditingController todoController = TextEditingController();


  void addTodo(){
    if(todoController.text.isNotEmpty){
      setState(() {
        todos.add(todoController.text);
        todoController.clear();

      });
    }
  }

  void deleteTodo(int index){
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('ToDo List'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: TextField(
                      controller: todoController,
                      decoration: InputDecoration(
                          hintText: "Add New task",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                      ),
                    )),
                    SizedBox(width: 8,),
                    ElevatedButton(onPressed: (){
                      addTodo();
                    }, child: Icon(Icons.add, color: Colors.white,))
                  ],
                ),
              ),

              Expanded(
                  child: todos.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.hourglass_bottom, size: 60, color: Colors.grey,),
                        SizedBox(height: 10,),
                        Text('No task yet', style: TextStyle(fontSize: 18, color: Colors.grey),)
                      ],
                    ),
                  )

                      :   ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index){
                        return Padding(padding: EdgeInsets.only(bottom: 12),
                          child: Card(
                            child: ListTile(
                              title: Text(todos[index]),
                              trailing: IconButton(onPressed: (){deleteTodo(index);}, icon: Icon(Icons.delete, color: Colors.red,)),
                            ),
                          ),
                        );
                      }
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}