import 'package:flutter/material.dart';

class UserLoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  void _submitForm() {
    if (formKey.currentState!.validate()) {
      // passou na validação
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Obrigatorio';
                  } else if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b').hasMatch(value)) {
                    return 'Email invalido';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                onSaved: (value) =>  {
                  password = value!
                },
                validator: (value) => value!.isEmpty ? 'Senha invalida' : null
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
