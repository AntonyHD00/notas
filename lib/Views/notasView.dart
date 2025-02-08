import 'package:flutter/material.dart';

class Notasview extends StatefulWidget {
  final List<Map<String, String>> notas;
  final Function(int) onDelete;

  const Notasview({super.key, required this.notas, required this.onDelete});

  @override
  State<Notasview> createState() => _NotasviewState();
}

class _NotasviewState extends State<Notasview> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: widget.notas.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.notas[index]['title'] ?? 'Sin título',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            widget.onDelete(index);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        widget.notas[index]['content'] ?? 'Sin contenido',
                        style: const TextStyle(fontSize: 14),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
