class AppConfig {
  /// The Supabase Project URL.
  /// Can be injected at build/run time via:
  /// `--dart-define=SUPABASE_URL=https://your-project.supabase.co`
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://ervvgjioggfxygtjlpts.supabase.co',
  );

  /// The Supabase Anon Key.
  /// Can be injected at build/run time via:
  /// `--dart-define=SUPABASE_ANON_KEY=your-anon-key`
  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVydnZnamlvZ2dmeHlndGpscHRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA0NzE5OTgsImV4cCI6MjA5NjA0Nzk5OH0.EzYtQrAoBJ_kGd36mPOsmfcsGSV8hLnOs1dc5sCSr4I',
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
