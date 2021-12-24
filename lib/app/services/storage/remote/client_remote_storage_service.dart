import 'package:dio/dio.dart';

import 'interfaces/remote_storage_service_interface.dart';

class ClientHttpService implements IClientHttp {
  final Dio dio = Dio();

  @override
  Future get(String url) async {}

  @override
  Future post(String url, Object jsonEncode) async {}
}
