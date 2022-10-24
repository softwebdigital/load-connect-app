abstract class ILocalStorageService {
  Future<void> init();
  Future<bool> setItem(box, key, value);
  Future<dynamic> getItem(box, key, {dynamic defaultValue});
  Future<bool> removeItem(box, key);
}