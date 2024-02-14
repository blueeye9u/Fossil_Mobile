class APIConfig {
  static const String baseUrlProduction = 'https://api.example.com';
  static const String baseUrlStaging = 'https://api.staging.example.com';
  static const String baseUrlDevelopment =
      'http://localhost:8081/api'; // Replace with your development server URL

  // Set the active environment here
  static const Environment environment = Environment.development;

  static String get baseUrl {
    switch (environment) {
      case Environment.staging:
        return baseUrlStaging;
      case Environment.development:
        return baseUrlDevelopment;
      case Environment.production:
        return baseUrlProduction;
      default:
        return baseUrlDevelopment;
    }
  }
}

enum Environment { production, staging, development }
