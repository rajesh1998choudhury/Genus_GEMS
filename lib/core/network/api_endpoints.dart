class ApiEndpoints {
  // Base URL
  static const String baseUrl = "https://api.example.com";

  // 🔐 Auth
  static const String login = "/auth/login";
  static const String register = "/auth/register";

  // 📚 Learning / Education
  static const String getQuestions = "/questions";
  static const String getLevels = "/levels";

  // 📊 Progress
  static const String saveProgress = "/progress";
  static const String getProgress = "/progress";

  // 👤 User
  static const String profile = "/user/profile";
}
