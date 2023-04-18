import 'package:flutter/material.dart';
import 'package:task_lisst/models/Task.dart';
import 'package:intl/intl.dart';

class TaskCreatePage extends StatefulWidget {
  @override
  _TaskCreatePageState createState() => _TaskCreatePageState();
}

class _TaskCreatePageState extends State<TaskCreatePage> {
  final formKey = GlobalKey<FormState>();

  String formName = '';
  String formPriority = '';
  DateTime formDate = DateTime.now();

  saveTask(context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Navigator.pop(context, Task(formName, formPriority, formDate, false));
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
                onSaved: (value) => formName = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Título é obrigatório' : null,
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
                onChanged: (value) => formPriority = value.toString(),
                decoration: const InputDecoration(
                  labelText: 'Prioridade',
                ),
                validator: (value) =>
                    value == null ? 'Prioridade é obrigatório' : null,
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Data de Vencimento'),
                subtitle: Text(
                  'Data selecionada: ${DateFormat('dd/MM/yyyy').format(formDate)}',
                ),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: formDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      formDate = selectedDate;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => saveTask(context),
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
