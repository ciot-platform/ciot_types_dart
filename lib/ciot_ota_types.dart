import 'dart:ffi';

@Packed(1)
enum CiotOtaState
{
  IDLE,
  INIT,
  IN_PROGRESS,
  START,
  CONNECTED,
  CHECKING_DATA,
  DECRYPTING,
  FLASHING,
  UPDATE_BOOT_PARTITION,
  DONE,
}

@Packed(1)
enum CiotOtaReqType
{
  UNKNOWN,
}

@Packed(1)
enum CiotOtaBitMask
{
  force,
  encrypted,
  restart
}

@Packed(1)
final class CiotOtaCfgT extends Struct
{
  @Array(128) external Array<Char> url;
  @Uint8() external int bitmask;
}

@Packed(1)
final class CiotOtaStatusT extends Struct
{
  @Uint8() external int state;
  @Int() external int error;
  @Uint32() external int imageSize;
  @Uint32() external int imageRead;
}

// @Packed(1)
// final class CiotOtaReqDataU extends Union
// {

// }

// @Packed(1)
// final class CiotOtaReqT extends Struct
// {
//   CiotOtaReqTypeT type;
//   CiotOtaReqDataU data;
// }

@Packed(1)
final class CiotOtaDataU extends Union
{
  external CiotOtaCfgT config;
  external CiotOtaStatusT status;
  // CiotOtaReqT request;
}