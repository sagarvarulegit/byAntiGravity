class AppConfig {
  /// The Supabase Project URL.
  /// Can be injected at build/run time via:
  /// `--dart-define=SUPABASE_URL=https://your-project.supabase.co`
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );

  /// The Supabase Anon Key.
  /// Can be injected at build/run time via:
  /// `--dart-define=SUPABASE_ANON_KEY=your-anon-key`
  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: '',
  );

  /// Automatically fall back to local Mock Auth Mode if Supabase credentials are not provided.
  /// This lets the app run and preview the authentication flow offline.
  static bool get useMockAuth {
    return supabaseUrl.isEmpty ||
        supabaseAnonKey.isEmpty ||
        supabaseUrl.startsWith('YOUR_') ||
        supabaseAnonKey.startsWith('YOUR_');
  }
}
