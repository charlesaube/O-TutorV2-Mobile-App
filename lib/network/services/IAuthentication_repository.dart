abstract class IAuthenticationRepository{
  Future<String> authenticate(Map<String, String> body);
  Future logout();
}