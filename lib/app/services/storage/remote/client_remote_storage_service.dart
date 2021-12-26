import 'package:dio/dio.dart';

import 'interfaces/remote_storage_service_interface.dart';

class ClientHttpService implements IClientHttp {
  final Dio dio;

  ClientHttpService(this.dio);

  @override
  Future get(String url) async {}

  @override
  Future post(String url, Object jsonEncode) async {}
}
