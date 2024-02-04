import 'dart:ffi';

@Packed(1)
enum CiotState
{
  idle,
  busy,
  error,
}

@Packed(1)
enum CiotReqType
{
  unknown,
  saveIfaceCfg,
  deleteIfaceCfg,
  proxyMsg,
}

// final class CiotCfgT extends Struct
// {

// }

@Packed(1)
final class CiotStatusT extends Struct
{
  @Uint8() external int state;
}

@Packed(1)
final class CiotReqSaveIfaceCfgT extends Struct
{
  @Uint8() external int ifaceId;
}

@Packed(1)
final class CiotReqDeleteIfaceCfgT extends Struct
{
  @Uint8() external int ifaceId;
}

@Packed(1)
final class CiotReqResultT extends Struct
{
  @Uint8() external int ifaceId;
  @Int32() external int err;
}

@Packed(1)
final class CiotReqProxyMsgT extends Struct
{
  @Uint8() external int iface;
  @Uint16() external int size;
  @Array(256) external Array<Uint8> data;
}

@Packed(1)
final class CiotReqDataU extends Union
{
  external CiotReqSaveIfaceCfgT saveIfaceCfg;
  external CiotReqDeleteIfaceCfgT deleteIfaceCfg;
  external CiotReqProxyMsgT proxyMsg;
  external CiotReqResultT result;
}

@Packed(1)
final class CiotReqT extends Struct
{
  @Uint8() external int type;
  external CiotReqDataU data;
}

@Packed(1)
final class CiotDataU extends Union
{
  // external CiotCfgT config;
  external CiotStatusT status;
  external CiotReqT request;
}