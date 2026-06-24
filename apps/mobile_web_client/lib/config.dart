class AppConfig {
  /// The Supabase Project URL.
  /// Can be injected at build/run time via:
  /// `--dart-define=SUPABASE_URL=https://your-project.supabase.co`
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://composite-subscription-commodity-nobody.trycloudflare.com',
  );

  /// The Supabase Anon Key.
  /// Can be injected at build/run time via:
  /// `--dart-define=SUPABASE_ANON_KEY=your-anon-key`
  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'sb_publishable_ACJWlzQHlZjBrEguHvfOxg_3BJgxAaH',
  );

}
