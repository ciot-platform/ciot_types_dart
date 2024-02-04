import 'dart:ffi';

@Packed(1)
enum CiotBleState {
  idle,
  started,
}

@Packed(1)
enum CiotBleReqType {
  unknown,
  setMac,
}

@Packed(1)
final class CiotBleCfgT extends Struct {
  @Array(6) external Array<Uint8> mac;
}

@Packed(1)
final class CiotBleInfoT extends Struct {
  @Array(6) external Array<Uint8> hwMac;
  @Array(6) external Array<Uint8> swMac;
}

@Packed(1)
final class CiotBleStatusT extends Struct {
  @Uint8() external int state;
  @Uint8() external int errCode;
  external CiotBleInfoT info;
}

@Packed(1)
final class CiotBleReqDataU extends Union {
  @Array(6) external Array<Uint8> setMac;
}

@Packed(1)
final class CiotBleReqT extends Struct {
  @Uint8() external int type;
  external CiotBleReqDataU data;
}

@Packed(1)
final class CiotBleDataU extends Union {
  external CiotBleCfgT config;
  external CiotBleStatusT status;
  external CiotBleReqT request;
}
