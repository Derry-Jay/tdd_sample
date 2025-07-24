// import 'dart:math';

import 'package:tdd_sample/tdd_sample.dart';
import 'package:test/test.dart';

void main() {
  group('Add Numbers In String Test', () {
    test('Empty Input', () {
      expect(add(''), 0);
    });
    test('Input length is 1', () {
      expect(add('1'), 1);
    });
    test('Input length is 2', () {
      expect(add('1,5'), 6);
    });
    // test('Multiple Delimiters', () {
    //   expect(add('1:2,5'), 8);
    // });
    // test('Other Delimiters', () {
    //   expect(add('//;\n1;2'), 3);
    // });
    // test('Long String', () {
    //   final list = List<int>.generate(20, (i) => Random().nextInt(i + 1) + 1);
    //   expect(add(list.join(',')), list.sum);
    // });
    // test('Negative Numbers in the String should throw error', () {
    //   expect(add('1:4,-5;-7'), throwsA(predicate((e) => e is ArgumentError && e.message == 'Negative numbers are not allowed <-5,-7>')));
    // });
  });
}
