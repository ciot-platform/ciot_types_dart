import 'dart:ffi';

@Packed(1)
enum CiotHttpsState
{
  stopped,
  started,
  error,
}

@Packed(1)
enum CiotHttpsReqType
{
  unknown,
}

@Packed(1)
final class CiotHttpsCfgT extends Struct
{
  @Array(64) external Array<Char> address;
  @Array(32) external Array<Char> route;
  @Int()external int port;
}

@Packed(1)
final class CiotHttpsStatusT extends Struct
{
  @Uint8() external int state;
  @Int() external int error;
}

// @Packed(1)
// final class CiotHttpsReqDataU extends Union
// {

// }

// @Packed(1)
// final class CiotHttpsReqT extends Struct
// {

// }

@Packed(1)
final class CiotHttpsDataU extends Union
{
  external CiotHttpsCfgT config;
  external CiotHttpsStatusT status;
  // external CiotHttpsReqT request;
}