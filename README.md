# japanese_date_converter

A Flutter package to convert `DateTime` objects to Japanese era date strings.
This package supports modern eras from Meiji onwards and handles era transition years correctly.

`DateTime`オブジェクトを、明治時代以降の日本の元号（和暦）を含んだ日付文字列に変換するパッケージです。元号が切り替わる年の日付も正確に扱います。

## Features

- Converts `DateTime` to a Japanese date string (e.g., "令和7年9月2日(火)").
- Supports eras from Meiji (明治) to Reiwa (令和).
- Correctly handles the first year of an era as "Gannen" (元年).
- No external dependencies other than `intl` for weekday formatting.

## Getting started

You need to add `intl` to your dependencies in `pubspec.yaml`.

```yaml
dependencies:
  intl: ^0.19.0
```

## Usage

Import the package and use the `toJapaneseDateString()` extension method on any `DateTime` object.

```dart
import 'package:japanese_date_converter/japanese_date_converter.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  // It's recommended to initialize date formatting for consistent weekday names.
  initializeDateFormatting('ja_JP');

  final date = DateTime(2025, 9, 2);
  print(date.toJapaneseDateString()); // Output: 令和7年9月2日(火)

  final gannenDate = DateTime(2019, 5, 1);
  print(gannenDate.toJapaneseDateString()); // Output: 令和元年5月1日(水)

  final heiseiDate = DateTime(2019, 4, 30);
  print(heiseiDate.toJapaneseDateString()); // Output: 平成31年4月30日(火)
}
```