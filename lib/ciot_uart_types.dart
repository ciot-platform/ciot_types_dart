import 'dart:ffi';

@Packed(1)
enum CiotUartState
{
  closed,
  started,
  internalError,
  ciotSError,
}

@Packed(1)
enum CiotUartError
{
  none,
  broked,
  bufferFull,
  fifoOverflow,
  frame,
  parity,
  dataBreak,
  unknownEvent,
}

@Packed(1)
enum CiotUartReqType
{
  unknown,
  sendData,
  sendBytes,
  enableBridgeMode,
}

@Packed(1)
enum CiotUartBitmask
{
  flowControl,
  dtr,
  bridgeMode,
}

@Packed(1)
final class CiotUartCfgT extends Struct
{
  @Uint32() external int  baud_rate;
  @Uint8() external int num;
  @Uint8() external int rxPin;
  @Uint8() external int txPin;
  @Uint8() external int rtsPin;
  @Uint8() external int ctsPin;
  @Uint16() external int parity;
  @Uint8() external int bitmask;
}

@Packed(1)
final class CiotUartStatusT extends Struct
{
  @Uint8() external int state;
  @Uint8() external int error;
}

@Packed(1)
final class CiotUartReqSendDataT extends Struct
{
  @Uint8() external int size;
  @Array(255) external Array<Uint8> data;
}

@Packed(1)
final class CiotUartReqDataU extends Union
{
  external CiotUartReqSendDataT sendData;
}

@Packed(1)
final class CiotUartReqT extends Struct
{
  @Uint8() external int type;
  external CiotUartReqDataU data;
}

@Packed(1)
final class CiotUartDataU extends Union
{
  external CiotUartCfgT config;
  external CiotUartStatusT status;
  external CiotUartReqT request;
}
