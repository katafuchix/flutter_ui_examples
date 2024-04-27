import 'package:realm/realm.dart';

part 'person.realm.dart';// person.g.dartは、RealmObjectを継承するクラスから自動生成されます。

@RealmModel()// @RealmModelは、RealmObjectを継承するクラスに付与するアノテーションです。
class _Person {
  late String name;
  /*
  late String link;
  late String title;
  late String author;
  late String hour;
  late String minute;
  late String second;// lateをつけるのは、RealmObjectはデフォルトコンストラクタを持たないためです。
   */
}

// dart run realm generate