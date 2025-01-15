import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Enum to represent different keys for shared preferences
enum PrefKey { value1, value2, value3 }

extension PrefKeyExtension on PrefKey {
  String get key {
    switch (this) {
      case PrefKey.value1:
        return 'value1';
      case PrefKey.value2:
        return 'value2';
      case PrefKey.value3:
        return 'value3';
    }
  }
}

// Provider for managing shared_preferences instance
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError(),
);

// Notifier for handling data retrieval and storage
class SharedPrefTest extends Notifier<String> {
  @override
  String build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final prefName = prefs.getString(PrefKey.value1.key) ?? 'test'; // Default to 'value1'
    return prefName;
  }

  void setName(WidgetRef ref, PrefKey key, String name) {
    final prefs = ref.watch(sharedPreferencesProvider);
    prefs.setString(key.key, name);  // Save with the specified key (value1, value2, or value3)
  }

  void getName(WidgetRef ref, PrefKey key) {
    final prefs = ref.watch(sharedPreferencesProvider);
    final prefName = prefs.getString(key.key) ?? '';
    state = prefName;
  }
}

final sharedPrefTestProvider = NotifierProvider<SharedPrefTest, String>(() {
  return SharedPrefTest();
});
