import 'dart:ffi';
import 'package:ciot_types_dart/ciot_msg_types.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('size test', () {
    var siz = sizeOf<CiotMsgT>();
    print(siz);
  });
}