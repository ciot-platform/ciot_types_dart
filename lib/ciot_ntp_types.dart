import 'dart:ffi';

@Packed(1)
enum CiotNtpState
{
  reset,
  completed,
  inProgress,
}

@Packed(1)
enum CiotNtpReqType
{
  unknown,
}

@Packed(1)
enum CiotNtpBitMask
{
  init,
  sync
}

@Packed(1)
final class CiotNtpCfgT extends Struct
{
  @Uint8() external int opMode;
  @Uint8() external int syncMode;
  @Uint32() external int syncInterval;
  @Array(16) external Array<Char> timezone;
  @Array(64) external Array<Char> server1;
  @Array(64) external Array<Char> server2;
  @Array(64) external Array<Char> server3;
}

@Packed(1)
final class CiotNtpStatusT extends Struct
{
  @Uint8() external int state;
  @Int64() external int lastSync;
  @Uint16() external int syncCount;
  @Uint8() external int bitmask;
}

// final class CiotNtpReqDataU extends Union
// {

// }

@Packed(1)
final class CiotNtpReqT extends Struct
{
  @Uint8() external int type;
  // CiotNtpReqDataU data;
}

@Packed(1)
final class CiotNtpDataU extends Union
{
  external CiotNtpCfgT config;
  external CiotNtpStatusT status;
  // CiotNtpReqT request;
}
