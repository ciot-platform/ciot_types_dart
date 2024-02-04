import 'dart:ffi';

@Packed(1)
enum CiotBridgeState
{
  idle,
  started,
  error,
}

@Packed(1)
enum CiotBridgeReqType
{
  unknown,
}

@Packed(1)
final class CiotBridgeCfgT extends Struct
{
  @Array(2) external Array<Uint8> ifacesId;
}

@Packed(1)
final class CiotBridgeStatusT extends Struct
{
  @Uint8() external int state;
}

// @Packed(1)
// final class CiotBridgeReqData extends Union
// {

// }

@Packed(1)
final class CiotBridgeReqT extends Struct
{
  @Uint8() external int type;
  // CiotBridgeReqData data;
}

@Packed(1)
final class CiotBridgeDataU extends Union
{
  external CiotBridgeCfgT config;
  external CiotBridgeStatusT status;
  external CiotBridgeReqT request;
}