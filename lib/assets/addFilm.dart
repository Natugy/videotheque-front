
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {


  String _title="";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(

              decoration: const InputDecoration(
                hintText: 'Enter film title',
                labelText: 'Title',
                ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value){
                _title = value!;
              },
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.



                    Navigator.pushNamed(context, "/add", arguments: _title);
                  }
                },
                child: const Text('Submit'),
              ),
            ),

          ],

        ),
      ),
    );
  }
}
