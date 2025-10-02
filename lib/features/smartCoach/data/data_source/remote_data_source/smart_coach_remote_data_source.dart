abstract interface class SmartCoachRemoteDataSource {
  Future<String> sendPromptToAI(String userMessage);
}
