import 'package:flutter/material.dart';
import 'package:notas/Views/addNotes.dart';
import 'package:notas/Views/notasView.dart';
import 'package:notas/Views/perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NOTAS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;
  final List<Map<String, String>> _notes = []; 

  void _addNote(String title, String content) {
    setState(() {
      _notes.add({'title': title, 'content': content});
    });
  }
    void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final List<Widget> _pages = [
      Notasview(notas: _notes,onDelete: _deleteNote),
      AddNote(onSave: _addNote),
      const perfildeusuario(),
    ];

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: screenWidth >= 800,
            selectedIndex: _selectIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectIndex = index;
              });
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.book),
                label: Text('Notas'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.add),
                label: Text('Agregar Nota'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text('Perfil'),
              ),
            ],
          ),
          VerticalDivider(
            thickness: 1,
            width: 1,
            color: Colors.grey[300],
          ),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: _pages[_selectIndex],
            ),
          ),
        ],
      ),
    );
  }
}
