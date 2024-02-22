import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'mocks.dart';

void main() {
  test('size test', () {
    var bytes = File(datFilesDir + "ciot_ble_scn_cfg.dat").readAsBytesSync();
    
    print('test');
  });
}