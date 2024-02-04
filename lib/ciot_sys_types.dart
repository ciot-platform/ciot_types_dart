import 'dart:ffi';

@Packed(1)
enum CiotSysReqType
{
  unknonw,
  restart,
}

@Packed(1)
final class CiotSysFeaturesT extends Struct
{
  @Uint16() external int hw;
  @Uint16() external int sw;
}

@Packed(1)
final class CiotSysInfoT extends Struct
{
  @Array(16) external Array<Char> hwName;
  @Array(3) external Array<Uint8> appVer;
  external CiotSysFeaturesT features;
}

@Packed(1)
final class CiotSysStatusT extends Struct
{
  @Uint8() external int rstReason;
  @Uint8() external int rstCount;
  @Uint32() external int freeMemory;
  @Uint32() external int lifetime;
  external CiotSysInfoT info;
}

// @Packed(1)
// final class CiotSysCfgT extends Struct
// {

// }

// @Packed(1)
// final class CiotSysReqDataU extends Union
// {

// }

// @Packed(1)
// final class CiotSysReqT extends Struct
// {
//     CiotSysReqTypeT type;
//     CiotSysReqDataU data;
// }

@Packed(1)
final class CiotSysDataU extends Union
{
    // CiotSysCfgT config;
    external CiotSysStatusT status;
    // CiotSysReqT request;
}