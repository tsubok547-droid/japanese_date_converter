// lib/japanese_date_converter.dart

import 'package:intl/intl.dart';

// 元号の設計図（プライベートクラス）
class _Era {
  final String name;
  final DateTime startDate;

  _Era({required this.name, required this.startDate});
}

// 元号のリスト（新しい順）
final List<_Era> _eras = [
  _Era(name: '令和', startDate: DateTime(2019, 5, 1)),
  _Era(name: '平成', startDate: DateTime(1989, 1, 8)),
  _Era(name: '昭和', startDate: DateTime(1926, 12, 25)),
  _Era(name: '大正', startDate: DateTime(1912, 7, 30)),
  _Era(name: '明治', startDate: DateTime(1868, 1, 25)),
  _Era(name: '慶応', startDate: DateTime(1865, 5, 1)),
  _Era(name: '元治', startDate: DateTime(1864, 3, 27)),
  _Era(name: '文久', startDate: DateTime(1861, 3, 29)),
  _Era(name: '万延', startDate: DateTime(1860, 4, 8)),
  _Era(name: '安政', startDate: DateTime(1855, 1, 15)),
];

/// Extends the [DateTime] class to provide Japanese date formatting.
/// (DateTimeクラスを拡張し、和暦フォーマット機能を提供します)
extension JapaneseDateConverter on DateTime {
  /// Returns the Japanese era string (e.g., "令和元年9月2日(火)").
  /// 和暦の文字列（例：令和元年9月2日(火)）を返します。
  String toJapaneseDateString() {
    final date = this;
    final dayOfWeek = DateFormat.E('ja_JP').format(date);

    for (int i = 0; i < _eras.length; i++) {
      final currentEra = _eras[i];

      final isBeforeNextEra = (i == 0) || date.isBefore(_eras[i - 1].startDate);

      if (date.isAfter(currentEra.startDate) ||
          date.isAtSameMomentAs(currentEra.startDate)) {
        if (isBeforeNextEra) {
          final eraYear = date.year - currentEra.startDate.year + 1;
          final yearString = eraYear == 1 ? '元' : eraYear.toString();

          return '${currentEra.name}$yearString年${date.month}月${date.day}日($dayOfWeek)';
        }
      }
    }

    return DateFormat('yyyy年M月d日(E)', 'ja_JP').format(date);
  }
}
