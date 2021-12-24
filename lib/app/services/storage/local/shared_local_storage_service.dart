import 'interfaces/local_storage_service_interface.dart';

class SharedLocalStorageService implements ILocalStorage {
  @override
  Future delete(String key) async {}

  @override
  Future get(String key) async {}

  @override
  Future put(String key, value) async {}
}
