import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  final Function(String, String) onSave;

  const AddNote({super.key, required this.onSave});

  @override
  State<AddNote> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNote> {
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  void _saveNote() {
    if (_titleController.text.isNotEmpty || _noteController.text.isNotEmpty) {
      widget.onSave(_titleController.text, _noteController.text);
      _titleController.clear();
      _noteController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Nota'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: 'Escribe tu nota',
                border: OutlineInputBorder(),
              ),
              maxLines: 3, 
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text('Guardar Nota'),
            ),
          ],
        ),
      ),
    );
  }
}
