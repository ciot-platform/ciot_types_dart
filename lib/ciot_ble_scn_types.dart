import 'dart:ffi';

@Packed(1)
enum CiotBleScnState {
  idle,
  passive,
  active,
}

@Packed(1)
enum CiotBleScnReqType {
  unknown,
}

enum CiotBleScnBitMask {
  active,
  bridgeMode,
}

@Packed(1)
final class CiotBleScnCfgT extends Struct {
  @Uint16() external int interval;
  @Uint16() external int window;
  @Uint16() external int timeout;
  @Uint8() external int bitmask;
}

@Packed(1)
final class CiotBleScnAdvInfoT extends Struct {
  @Array(6) external Array<Uint8> mac;
  @Int8() external int rssi;
}

@Packed(1)
final class CiotBleScnStatusT extends Struct {
  @Uint8() external int state;
  external CiotBleScnAdvInfoT advInfo;
}

// @Packed(1)
// final class CiotBleScnReqData extends Union {
// }

@Packed(1)
final class CiotBleScnReqT extends Struct {
  @Uint8() external int type;
  // external CiotBleScnReqData data;
}

final class CiotBleScnDataU extends Union {
  external CiotBleScnCfgT config;
  external CiotBleScnStatusT status;
  external CiotBleScnReqT request;
}