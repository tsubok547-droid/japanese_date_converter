import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:japanese_date_converter/japanese_date_converter.dart';

void main() {
  // テストを実行する前に、日本語の曜日などを初期化
  initializeDateFormatting('ja_JP');

  test('基本的な日付が正しく和暦に変換されるべき', () {
    final date = DateTime(2025, 9, 2); // 令和7年9月2日(火)
    expect(date.toJapaneseDateString(), '令和7年9月2日(火)');
  });

  test('元号の初日（元年）が正しく変換されるべき', () {
    final date = DateTime(2019, 5, 1); // 令和元年5月1日(水)
    expect(date.toJapaneseDateString(), '令和元年5月1日(水)');
  });

  test('元号の境界日が正しく変換されるべき', () {
    final date = DateTime(2019, 4, 30); // 平成31年4月30日(火)
    expect(date.toJapaneseDateString(), '平成31年4月30日(火)');
  });

  test('明治時代の日付が正しく変換されるべき', () {
    final date = DateTime(1912, 7, 29); // 明治45年7月29日(月)
    expect(date.toJapaneseDateString(), '明治45年7月29日(月)');
  });
}
