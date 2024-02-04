import 'dart:ffi';

@Packed(1)
enum CiotTcpState
{
  stopped,
  started,
  connecting,
  connected,
}

@Packed(1)
enum CiotTcpDhcpState
{
  idle,
  started,
  stopped,
}

@Packed(1)
enum CiotTcpDhcpCfg
{
  noChange,
  client,
  server,
  disabled,
}

@Packed(1)
enum CiotTcpReqType
{
  ciotTcpReqUnknown,
}

@Packed(1)
final class CiotTcpCfgT extends Struct
{
  @Uint8() external int dhcp;
  @Array(4) external Array<Uint8> ip;
  @Array(4) external Array<Uint8> gateway;
  @Array(4) external Array<Uint8> mask;
  @Array(4) external Array<Uint8> dns;
}

@Packed(1)
final class CiotTcpDhcpStatusT extends Struct
{
  @Uint8() external int client;
  @Uint8() external int server;
}

@Packed(1)
final class CiotTcpInfoT extends Struct
{
  @Array(6) external Array<Uint8> mac;
  @Array(4) external Array<Uint8> ip;
}

@Packed(1)
final class CiotTcpStatusT extends Struct
{
  @Uint8() external int state;
  @Uint8() external int connCount;
  @Uint8() external int dhcp;
  external CiotTcpInfoT info;
}

// @Packed(1)
// final class CiotTcpReqDataU extends Union
// {

// }

// @Packed(1)
// final class CiotTcpReqT extends Struct
// {
//     CiotTcpReqTypeT type;
//     CiotTcpReqDataU data;
// }

@Packed(1)
final class CiotTcpDataU extends Union
{
  external CiotTcpCfgT config;
  external CiotTcpStatusT status;
  // CiotTcpReqT request;
}