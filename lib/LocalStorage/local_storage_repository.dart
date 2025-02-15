import 'dart:convert';
import 'local_storage_service.dart';

class LocalStorageRepository {
  static const String _key = 'notes';

  static Future<void> saveNotes(List<Map<String, String>> notes) async {
    final notesJson = json.encode(notes);
    LocalStorageService.save(_key, notesJson);
  }

  static Future<List<Map<String, String>>> loadNotes() async {
    final notesJson = LocalStorageService.get(_key);
    if (notesJson != null) {
      return List<Map<String, String>>.from(json.decode(notesJson));
    }
    return [];
  }
}