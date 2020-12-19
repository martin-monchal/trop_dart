import 'package:trop_dart/data/storage/hive/model/hive_beer.dart';

abstract class Storage {
  Future<void> init();

  Future<StorageBox> get defaultBox;

  Future<StorageBox> create(String name, {bool replaceExisting});
}

abstract class StorageBox {
  Future<void> saveItem(String key, Object value);

  Future<HiveBeer> getItem(String key, [Object defaultValue]);

  Future<void> clear();
}
