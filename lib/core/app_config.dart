/// API hosts — override at build time, e.g.
/// `flutter run --dart-define=USER_API_BASE=http://localhost:5000 --dart-define=COMPANY_API_BASE=http://localhost:5002`
///
/// **Mock API (offline demo):** `USE_MOCK_API=true` uses in-memory dummy data (no network).
/// Set to `false` when your backend is available again.
class AppConfig {
  AppConfig._();

  static const bool useMockApi = bool.fromEnvironment(
    'USE_MOCK_API',
    defaultValue: true,
  );

  static const String userApiBase = String.fromEnvironment(
    'USER_API_BASE',
    defaultValue: 'http://161.97.137.220:5000',
  );

  static const String companyApiBase = String.fromEnvironment(
    'COMPANY_API_BASE',
    defaultValue: 'http://161.97.137.220:5002',
  );
}
