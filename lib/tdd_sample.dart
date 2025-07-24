import 'package:string_extensions/string_extensions.dart';

int add(String numbers) {
  try {
    final String ip = numbers.trim().replaceAll(RegExp(r'//'), '');
    if (ip.isEmpty) {
      return 0;
    } else {
      final List<String> pts = ip.split('\n');
      final bool flag =
          !(pts.isEmpty || pts.length == 1) && (pts.first.toInt() ?? -1) < 0;
      final temp =
          (flag
                  ? pts.last.split(pts.first)
                  : ip.hewWithMultipleDelimiters(<String>[
                      ' ',
                      ',',
                      ';',
                      ':',
                      '.',
                      '_',
                      '\\',
                      '/',
                      '.',
                      '^',
                      '*',
                      '%',
                      '!',
                      '=',
                      '?',
                      '@',
                      '#',
                      '\$',
                      '&',
                      '+',
                    ]))
              .map<int>(toInteger);
      if (temp.where((n) => n < 0).isNotEmpty) {
        print('Negative');
        throw ArgumentError(
          "Negative numbers are not allowed <${temp.where((n) => n < 0).join(',')}>",
        );
      } else {
        return temp.sum.toInt();
      }
    }
  } catch (e) {
    print(e);
    rethrow;
  }
}

int toInteger(String str) {
  print(str);
  return str.toInt() ?? 0;
}

extension StringExtensions on String {
  List<String> hewWithMultipleDelimiters(List<String> delimiters) {
    String pattern = delimiters.map<String>(RegExp.escape).join('|');
    return split(RegExp(pattern));
  }
}

extension ListIntExtensions<T extends Iterable<U>, U extends num> on T {
  num get sum {
    if (isEmpty) {
      return '0'.toNum() ?? 0.0;
    } else if (length == 1) {
      return single;
    } else {
      num s = 0;
      for (U i in this) {
        s += i;
      }
      return s;
    }
  }
}
