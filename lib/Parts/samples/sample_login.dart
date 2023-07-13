import 'package:flutter/material.dart';

class SampleScreenLogin extends StatefulWidget {
  @override
  _SampleScreenLoginState createState() => _SampleScreenLoginState();
}

class _SampleScreenLoginState extends State<SampleScreenLogin> {
  final formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        /*디지털 양식서*/child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /*이메일*/TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Email can\'t be empty' : null,
                onSaved: (value) => _email = value!,
              ),
              /*패스워드*/TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) => value!.isEmpty ? 'Password can\'t be empty' : null,
                onSaved: (value) => _password = value!,
              ),
              TextButton(
                onPressed: validateAndSave,
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validateAndSave() {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      print('Form is valid Email: $_email, password: $_password');
      form.save();
    } else {
      print('Form is invalid Email: $_email, password: $_password');
    }
  }
}
