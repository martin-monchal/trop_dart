import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trop_dart/data/storage/hive/model/hive_beer.dart';
import 'package:trop_dart/data/storage/storage.dart';

class StorageWithHive extends Storage {
  final Map<String, _StorageHiveBox> _boxes = <String, _StorageHiveBox>{};
  _StorageHiveBox _defaultBox;
  bool _isInitialized = false;

  @override
  @override
  Future<void> init() async {
    _isInitialized = false;
    await Hive.initFlutter();
    Hive.registerAdapter(HiveBeerAdapter());
    _defaultBox = _StorageHiveBox._(await Hive.openBox('default'));
    _isInitialized = true;
  }

  @override
  Future<StorageBox> create(String name, {bool replaceExisting}) async {
    if (!_isInitialized) {
      await init();
    }

    if (name == 'default') {
      throw Exception(
          'The name \"default\" is reserved. Please use another one.');
    } else {
      if (_boxes[name] == null) {
        _boxes[name] = _StorageHiveBox._(await Hive.openBox(name));
      }

      return _boxes[name];
    }
  }

  @override
  Future<StorageBox> get defaultBox => Future<void>.value(_defaultBox);
}

class _StorageHiveBox extends StorageBox {
  final Box<Object> box;

  _StorageHiveBox._(this.box);

  @override
  Future<HiveBeer> getItem(String key, [Object defaultValue]) =>
      getValue(key, defaultValue: defaultValue);

  Future<T> getValue<T>(String key, {T defaultValue}) async {
    return box.get(key, defaultValue: defaultValue) ?? defaultValue;
  }

  @override
  Future<void> saveItem(String key, Object value) {
    return box.put(key, value);
  }

  @override
  Future<void> clear() {
    return box.clear();
  }
}
