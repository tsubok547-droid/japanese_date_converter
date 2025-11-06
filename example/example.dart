// ignore_for_file: avoid_print

import 'package:japanese_date_converter/japanese_date_converter.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  // 曜日の書式設定を初期化することが推奨されます
  initializeDateFormatting('ja_JP');

  final date = DateTime(2025, 9, 2);
  print(date.toJapaneseDateString()); // 出力: 令和7年9月2日(火)

  final gannenDate = DateTime(2019, 5, 1);
  print(gannenDate.toJapaneseDateString()); // 出力: 令和元年5月1日(水)

  final heiseiDate = DateTime(2019, 4, 30);
  print(heiseiDate.toJapaneseDateString()); // 出力: 平成31年4月30日(火)
}
