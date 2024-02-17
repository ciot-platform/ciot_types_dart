import 'dart:ffi';

@Packed(1)
enum CiotMqttcState
{
  disconnected,
  connecting,
  disconnecting,
  connected,
}

@Packed(1)
enum CiotMqttcTransport
{
  unknown,
  overTcp,
  overSsl,
  overWs,
  overWss,
}

@Packed(1)
enum CiotMqttcReqType
{
  unknonw,
  publish,
  subscribe,
}

@Packed(1)
final class CiotMqttcErrorT extends Struct
{
  @Int() external int tlsLastErr;
  @Int() external int tlsStackErr;
  @Int() external int tlsCertVerifyFlags;
  @Int() external int type;
  @Int() external int code;
  @Int() external int transportSock;
}

@Packed(1)
final class CiotMqttcTopicsCfgT extends Struct
{
  @Array(48) external Array<Char> d2b;
  @Array(48) external Array<Char> b2d;
}

@Packed(1)
final class CiotMqttcCfgT extends Struct
{
  @Array(32) external Array<Char> clientId;
  @Array(64) external Array<Char> url;
  @Array(32) external Array<Char> user;
  @Array(32) external Array<Char> pass;
  @Uint32() external int port;
  @Uint8() external int qos;
  @Uint8() external int transport;
  external CiotMqttcTopicsCfgT topics;
}

@Packed(1)
final class CiotMqttcStatusT extends Struct
{
  @Uint8() external int state;
  @Uint8() external int connCount;
  @Uint16() external int dataRate;
  @Int64() external int lastMsgTime;
  @Uint8() external int error;
}

@Packed(1)
final class CiotMqttcReqPublishT extends Struct
{
  @Array(48) external Array<Char> topic;
  @Array(256) external Array<Uint8> msg;
  @Int() external int size;
  @Uint8() external int qos;
}

@Packed(1)
final class CiotMqttcReqSubscribeT extends Struct
{
  @Array(32) external Array<Char> topic;
  @Uint8() external int qos;
}

@Packed(1)
final class CiotMqttcReqDataU extends Union
{
  external CiotMqttcReqPublishT publish;
  external CiotMqttcReqSubscribeT subscribe;
}

@Packed(1)
final class CiotMqttcReqT extends Struct
{
  @Uint8() external int type;
  external CiotMqttcReqDataU data;
}

@Packed(1)
final class CiotMqttcDataU extends Union
{
  external CiotMqttcCfgT config;
  external CiotMqttcStatusT status;
  external CiotMqttcReqT request;
}
