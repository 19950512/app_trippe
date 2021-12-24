abstract class IClientHttp {
  Future get(String url);
  Future post(String url, Object jsonEncode);
}
