import 'dart:ffi';
import 'ciot_types.dart';
import 'ciot_storage_types.dart';
import 'ciot_sys_types.dart';
import 'ciot_uart_types.dart';
import 'ciot_usb_types.dart';
import 'ciot_tcp_types.dart';
import 'ciot_wifi_types.dart';
import 'ciot_ble_types.dart';
import 'ciot_ble_scn_types.dart';
import 'ciot_ntp_types.dart';
import 'ciot_ota_types.dart';
import 'ciot_https_types.dart';
import 'ciot_httpc_types.dart';
import 'ciot_mqttc_types.dart';

@Packed(1)
enum CiotMsgType
{
  unknown,
  start,
  stop,
  getConfig,
  getStatus,
  request,
  error,
  event,
  custom,
}

@Packed(1)
final class CiotMsgIfaceType
{
  static const int unknown = 0;
  static const int ciot = 1;
  static const int storage = 2;
  static const int system = 3;
  static const int uart = 4;
  static const int usb = 5;
  static const int tcp = 6;
  static const int eth = 7;
  static const int wifi = 8;
  static const int ble = 9;
  static const int bleScn = 10;
  static const int ntp=127;
  static const int ota = 128;
  static const int httpClient = 129;
  static const int httpServer = 130;
  static const int mqtt = 131;
  static const int custom = 254;
  static const int bridge = 255;
}

@Packed(1)
final class CiotMsgIfaceInfoT extends Struct
{
  @Uint8() external int id;
  @Uint8() external int type;
}

@Packed(1)
final class CiotMsgErrorT extends Struct
{
  @Uint8() external int msg_type;
  @Int32() external int code;
}

@Packed(1)
final class CiotMsgDataU extends Union
{
  external CiotDataU ciot;
  external CiotStorageDataU storage;
  external CiotSysDataU system;
  external CiotUartDataU uart;
  external CiotUsbDataU usb;
  external CiotTcpDataU tcp;
  external CiotTcpDataU eth;
  external CiotWifiDataU wifi;
  external CiotBleDataU ble;
  external CiotBleScnDataU bleScn;
  external CiotNtpDataU ntp;
  external CiotOtaDataU ota;
  external CiotHttpsDataU https;
  external CiotHttpcDataU httpc;
  external CiotMqttcDataU mqtt;
  external CiotMsgErrorT error;
  @Array(256) external Array<Uint8> payload;
}

@Packed(1)
final class CiotMsgHeaderT extends Struct
{
  @Uint8() external int id;
  @Uint8() external int type;
  external CiotMsgIfaceInfoT iface;
}

@Packed(1)
final class CiotMsgT extends Struct
{
  @Uint8() external int id;
  @Uint8() external int type;
  external CiotMsgIfaceInfoT iface;
  external CiotMsgDataU data;
}
