import 'package:flutter/foundation.dart';

class AppConfig {
  /// The Supabase Project URL.
  /// Can be injected at build/run time via:
  /// `--dart-define=SUPABASE_URL=https://your-project.supabase.co`
  static String get supabaseUrl {
    const fromEnv = String.fromEnvironment('SUPABASE_URL');
    if (fromEnv.isNotEmpty) return fromEnv;
    
    // Android emulator needs 10.0.2.2 to reach host's localhost
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:54321';
    }
    // For Web and Desktop, use localhost to avoid CORS mismatch with flutter run
    return 'http://localhost:54321';
  }

  /// The Supabase Anon Key.
  /// Can be injected at build/run time via:
  /// `--dart-define=SUPABASE_ANON_KEY=your-anon-key`
  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'sb_publishable_ACJWlzQHlZjBrEguHvfOxg_3BJgxAaH',
  );

}
