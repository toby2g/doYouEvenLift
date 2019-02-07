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
        child: ExerciseForm(),
        // child: RaisedButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Text('Go Back'),
        // ),
      ),
    );
  }
}

class ExerciseForm extends StatefulWidget {
    @override
    ExerciseFormFormState createState() {
      return ExerciseFormFormState();
    }
}

class ExerciseFormFormState extends State<ExerciseForm> {

    final _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hasFloatingPlaceholder: true,
                      labelText: 'Exerecise',
                      contentPadding: const EdgeInsets.all(16.0)
                      ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter an exercise you manlet';
                    }
                  },
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField(
                  items: List(5),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hasFloatingPlaceholder: true,
                      labelText: 'Sets',
                      contentPadding: const EdgeInsets.all(16.0)
                      ),
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'Enter an exercise you manlet';
                  //   }
                  // },
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Shit')));
                  }
                },
                child: Text('Submit'),
              ),
            )
          ],
        )
      );
    }
}