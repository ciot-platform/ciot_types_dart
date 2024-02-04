import 'dart:ffi';

@Packed(1)
enum CiotUsbState
{
  stopped,
  started,
}

@Packed(1)
enum CiotUsbReqType
{
  unknown,
}

@Packed(1)
final class CiotUsbCfgT extends Struct
{
  @Uint8() external int bridgeMode;
}

@Packed(1)
final class CiotUsbStatusT extends Struct
{
  @Uint8() external int state;
}

// @Packed(1)
// final class CiotUsbReqDataU extends Union
// {

// }

// @Packed(1)
// final class CiotUsbReqT extends Struct
// {
//     CiotUsbReqTypeT id;
//     CiotUsbReqDataU data;
// }

@Packed(1)
final class CiotUsbDataU extends Union
{
  external CiotUsbCfgT config;
  external CiotUsbStatusT status;
  // external CiotUsbReqT request;
}