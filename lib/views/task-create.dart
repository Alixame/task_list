import 'package:flutter/material.dart';
import 'package:task_lisst/models/Task.dart';

class TaskCreatePage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  String formTitle = '';
  String formPriorit = '';
  
  saveTask(context) {

    if(formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Navigator.pop(context, Task(formTitle, formPriorit));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Tarefa'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                minLines: 1,
                maxLines: 1,
                maxLength: 100,
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
                onSaved: (value) =>  {
                  formTitle = value!
                },
                validator: (value) => value!.isEmpty ? 'Título é obrigatório' : null
              ),
              DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    child: const Text('Baixa'),
                    value: 'Baixa',
                  ),
                  DropdownMenuItem(
                    child: const Text('Média'),
                    value: 'Média',
                  ),
                  DropdownMenuItem(
                    child: const Text('Alta'),
                    value: 'Alta',
                  ),
                ],
                onChanged: (value) => {
                  formPriorit = value.toString()
                },
                decoration: const InputDecoration(
                  labelText: 'Prioridade',
                ),
                validator: (value) => value == null ? 'Prioridade é obrigatorio' : null,
              ),
              ElevatedButton(
                onPressed: () => saveTask(context),
                child: const Text('Salvar'),
              )
            ],
          ),
        ), 
      ),
    );
  }
}