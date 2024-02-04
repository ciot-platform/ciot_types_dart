import 'dart:ffi';

@Packed(1)
enum CiotHttpcState
{
  ciotHttpcStateIdle,
  ciotHttpcStateStarted,
  ciotHttpcStateConnecting,
  ciotHttpcStateConnected,
  ciotHttpcStateDataReceived,
  ciotHttpcStateTimeout,
  ciotHttpcStateError,
}

@Packed(1)
enum CiotHttpcReqType
{
  ciotHttpcReqUnknown,
  ciotHttpcReqSendData,
  ciotHttpcReqSetHeader,
}

@Packed(1)
enum CiotHttpcMethod
{
  ciotHttpcMethodGet,
  ciotHttpcMethodPost,
  ciotHttpcMethodPut,
  ciotHttpcMethodPatch,
  ciotHttpcMethodDelete,
  ciotHttpcMethodHead,
  ciotHttpcMethodNotify,
  ciotHttpcMethodSubscribe,
  ciotHttpcMethodUnsubscribe,
  ciotHttpcMethodOptions,
  ciotHttpcMethodCopy,
  ciotHttpcMethodMove,
  ciotHttpcMethodLock,
  ciotHttpcMethodUnlock,
  ciotHttpcMethodPropfind,
  ciotHttpcMethodProppatch,
  ciotHttpcMethodMkcol,
  ciotHttpcMethodMax,
}

@Packed(1)
enum CiotHttpcTransportType
{
  ciotHttpcTransportUnknown,
  ciotHttpcTransportTcp,
  ciotHttpcTransportSsl,
}

@Packed(1)
final class CiotHttpcCfgT extends Struct
{
  @Array(64) external Array<Char> url;
  @Uint8() external int method;
  @Uint8() external int transport;
  @Uint16() external int  timeout;
}

@Packed(1)
final class CiotHttpcStatusT extends Struct
{
  @Uint8() external int state;
  @Int() external int error;
}

@Packed(1)
final class CiotHttpcReqSendT extends Struct
{
  external CiotHttpcCfgT cfg;
  @Array(256) external Array<Uint8> body;
  @Int() external int content_length;
}

@Packed(1)
final class CiotHttpcReqSetHeaderT extends Struct
{
  @Array(48) external Array<Char> header;
  @Array(48) external Array<Char> value;
}

@Packed(1)
final class CiotHttpcReqDataU extends Union
{
  external CiotHttpcReqSendT send;
  external CiotHttpcReqSetHeaderT setHeader;
}

@Packed(1)
final class CiotHttpcReqT extends Struct
{
  @Uint8() external int type;
  external CiotHttpcReqDataU data;
}

@Packed(1)
final class CiotHttpcDataU extends Union
{
  external CiotHttpcCfgT config;
  external CiotHttpcStatusT status;
  external CiotHttpcReqT request;
}
