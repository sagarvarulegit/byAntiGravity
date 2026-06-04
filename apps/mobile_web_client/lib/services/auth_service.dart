import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

/// User profile details returned upon successful authentication.
class AuthUser {
  final String id;
  final String email;
  final String fullName;
  final bool isPremium;

  AuthUser({
    required this.id,
    required this.email,
    required this.fullName,
    this.isPremium = false,
  });
}

/// Abstract definition of the authentication provider.
abstract class AuthService {
  /// Stream that fires whenever the user logs in or out.
  Stream<AuthUser?> get authStateChanges;

  /// Exposes the currently logged-in user, if any.
  AuthUser? get currentUser;

  /// Log in with email and password.
  Future<AuthUser> signIn(String email, String password);

  /// Register a new account with name, email, and password.
  Future<AuthUser> signUp(String email, String password, String fullName);

  /// Log out the currently authenticated user.
  Future<void> signOut();

  /// Request a password reset link sent via email.
  Future<void> resetPassword(String email);
}


/// Supabase-backed authentication service for production.
class SupabaseAuthService implements AuthService {
  final sb.SupabaseClient _client = sb.Supabase.instance.client;
  final _controller = StreamController<AuthUser?>.broadcast();

  SupabaseAuthService() {
    // Listen to changes in Supabase session state and forward to stream.
    _client.auth.onAuthStateChange.listen((data) {
      final user = data.session?.user;
      if (user != null) {
        _controller.add(_mapSupabaseUser(user));
      } else {
        _controller.add(null);
      }
    });
  }

  @override
  Stream<AuthUser?> get authStateChanges => _controller.stream;

  @override
  AuthUser? get currentUser {
    final user = _client.auth.currentUser;
    if (user == null) return null;
    return _mapSupabaseUser(user);
  }

  @override
  Future<AuthUser> signIn(String email, String password) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final user = response.user;
    if (user == null) {
      throw Exception("Sign in failed: No user profile returned.");
    }
    return _mapSupabaseUser(user);
  }

  @override
  Future<AuthUser> signUp(String email, String password, String fullName) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': fullName},
    );
    final user = response.user;
    if (user == null) {
      throw Exception("Sign up failed: User is null.");
    }
    return _mapSupabaseUser(user);
  }

  @override
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  @override
  Future<void> resetPassword(String email) async {
    await _client.auth.resetPasswordForEmail(email);
  }

  /// Maps a Supabase user metadata object into our custom AuthUser model.
  AuthUser _mapSupabaseUser(sb.User user) {
    final String fullName = user.userMetadata?['full_name'] as String? ?? 'Student';
    return AuthUser(
      id: user.id,
      email: user.email ?? '',
      fullName: fullName,
      isPremium: false, // Default false; premium status can be resolved downstream
    );
  }
}
