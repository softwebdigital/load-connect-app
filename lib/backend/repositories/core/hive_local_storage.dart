import 'package:hive/hive.dart';
import 'package:load_connect/backend/services/core/i_local_storage.dart';
import 'package:load_connect/shared/constants.dart';
import 'package:path_provider/path_provider.dart' as pat;

class HiveLocalStorageService implements ILocalStorageService {

  @override
  Future getItem(bx, key, {defaultValue}) async {
    await init();
    print("$bx ====== $key");
    final box = await Hive.openBox(bx);
    return box.get(key, defaultValue: defaultValue);
  }

  @override
  Future<void> init() async {
    // Get directory to initialize hive
    final path = await pat.getApplicationDocumentsDirectory();
    // initialize hive in the directory
    Hive.init(path.path);
    await Hive.openBox(userDataBox);
    // await Hive.openBox(appDataBox);
  }

  @override
  Future<bool> removeItem(bx, key) async {
    await init();
    print("$bx ====== $key");
    final box = await Hive.openBox(bx);
    await box.delete(key);
    return true;
  }

  @override
  Future<bool> setItem(bx, key, value) async {
    await init();
    print("$bx ====== $key ====== $value");
    final box = await Hive.openBox(bx);
    await box.put(key, value);
    return true;
  }
}