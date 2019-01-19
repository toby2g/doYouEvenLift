import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Do you even lift?',
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/entry': (context) => EntryPage(),
    },
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Do you even Lift?'),
      ),
      body: Center(
        child: Text('Yeet skeet'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/entry');
        },
        tooltip: 'Add Exercise',
        child: Icon(Icons.add),
      ),
    );
  }
}

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercises"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}