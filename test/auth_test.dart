import 'package:learningdart/services/auth/auth_exception.dart';
import 'package:learningdart/services/auth/auth_provider.dart';
import 'package:learningdart/services/auth/auth_user.dart';
import 'package:test/test.dart';

void main() {
  group("Mock Authentication", () {
    final provider = MockAuthProvider();

    test('Should not de initialized to begin with', () {
      expect(provider.isInitialized, false);
    });

    test('Cannot log out if not initialized', () {
      expect(
        provider.logOut(),
        throwsA(const TypeMatcher<NotInitializedException>()),
      );
    });

    test("Should be able to initialized", () async {
      await provider.initialize();
      expect(provider.isInitialized, true);
    });

    test("User should not be null after initialized", () {
      expect(provider.currentUser, null);
    });

    test(
      "Should be able to initialized in less then 2 seconds",
      () async {
        await provider.initialize();
        expect(provider.isInitialized, true);
      },
      timeout: const Timeout(Duration(seconds: 2)),
    );

    test("Create user deligate to login", () async {
      final badEmailUser = provider.createUser(
        email: "faizan@gmail.com",
        password: "password",
      );

      expect(badEmailUser,
          throwsA(const TypeMatcher<UserNotFoundAuthException>()));

      final badPasswordUser =
          provider.createUser(email: "someon@gmail.com", password: "Faizan1");

      expect(badPasswordUser,
          throwsA(const TypeMatcher<WrongPasswordAuthException>()));

      final user = await provider.createUser(
        email: "Faizan",
        password: "password",
      );

      expect(user.isEmailVerified, false);
      expect(provider.currentUser, user);
    });

    test("Logged in user should be able to get verified", () {
      provider.sendEmailVerification();
      final user = provider.currentUser;
      expect(user, isNotNull);
      expect(user!.isEmailVerified, true);
    });

    test("User should be login and log out", () async {
      await provider.logOut();
      await provider.logIn(
        email: "email",
        password: "password",
      );

      final user = provider.currentUser;
      expect(user, isNotNull);
    });
  });
}

class NotInitializedException implements Exception {}

class MockAuthProvider implements AuthProvider {
  AuthUser? _user;
  var _isInitialized = false;

  bool get isInitialized => _isInitialized;

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    if (!isInitialized) throw NotInitializedException();
    await Future.delayed(const Duration(seconds: 1));
    return logIn(
      email: email,
      password: password,
    );
  }

  @override
  // TODO: implement currentUser
  AuthUser? get currentUser => _user;

  @override
  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    _isInitialized = true;
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) {
    if (!isInitialized) throw NotInitializedException();
    if (email == "faizan6340@gmail.com") throw UserNotFoundAuthException();
    if (password == "Faizan1") throw WrongPasswordAuthException();
    const user = AuthUser(isEmailVerified: false);
    _user = user;
    return Future.value(user);
  }

  @override
  Future<void> logOut() async {
    if (!isInitialized) throw NotInitializedException();
    if (_user == null) throw UserNotFoundAuthException();
    await Future.delayed(const Duration(seconds: 1));
    _user = null;
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmailVerification() async {
    if (!isInitialized) throw NotInitializedException();
    final user = _user;
    if (user == null) throw UserNotFoundAuthException();
    const newUser = AuthUser(isEmailVerified: true);
    _user = newUser;
  }
}
