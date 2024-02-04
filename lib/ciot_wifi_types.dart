import 'dart:ffi';
import 'ciot_tcp_types.dart';

@Packed(1)
enum CiotWifiType
{
  sta,
  ap,
}

@Packed(1)
enum CiotWifiScanState
{
  idle,
  scanning,
  scanned,
}

@Packed(1)
enum CiotWifiState
{
  idle,
}

@Packed(1)
enum CiotWifiReqType
{
  unknown,
  scan,
}

@Packed(1)
final class CiotWifiApInfoT extends Struct
{
  @Array(6) external Array<Uint8> bssid;
  @Array(33) external Array<Char> ssid;
  @Uint8() external int rssi;
  @Uint8() external int authmode;
}

@Packed(1)
final class CiotWifiCfgT extends Struct
{
  @Array(32) external Array<Char> ssid;
  @Array(64) external Array<Char> password;
  external CiotTcpCfgT tcp;
  @Uint8() external int type;
}

@Packed(1)
final class CiotWifiStatusT extends Struct
{
  @Uint8() external int disconnect_reason;
  external CiotWifiApInfoT info;
  @Uint8() external int tcp;
}

@Packed(1)
final class CiotWifiScanResultT extends Struct
{
  @Uint8() external int count;
  @Array(8) external Array<CiotWifiApInfoT> ap_list;
}

@Packed(1)
final class CiotWifiReqDataU extends Union
{
  external CiotWifiScanResultT scan_result;
}

@Packed(1)
final class CiotWifiReqT extends Struct
{
  @Uint8() external int type;
  external CiotWifiReqDataU data;
}

@Packed(1)
final class CiotWifiDataU extends Union
{
  external CiotWifiCfgT config;
  external CiotWifiStatusT status;
  external CiotWifiReqT request;
}
