import 'dart:js' as js;

class LocalStorageService {
  static void save(String key, String value) {
    js.context['localStorage'].callMethod('setItem', [key, value]);
  }
  static String? get(String key) {
    return js.context['localStorage'].callMethod('getItem', [key]);
  }
  static void remove(String key) {
    js.context['localStorage'].callMethod('removeItem', [key]);
  }
}