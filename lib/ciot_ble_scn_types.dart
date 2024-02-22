import 'dart:typed_data';

import 'package:ciot_types_dart/ciot_msg_types.dart';

enum CiotBleScnState { idle, passive, active }

enum CiotBleScnReqType { unknown }

class CiotBleScnCfg {
  int interval;
  int window;
  int timeout;
  bool active;
  bool bridgeMode;

  CiotBleScnCfg({
    required this.interval,
    required this.window,
    required this.timeout,
    required this.active,
    required this.bridgeMode,
  });

  static CiotBleScnCfg fromBytes(Uint8List bytes)
  {
    return CiotBleScnCfg(
      interval: ByteData.sublistView(bytes).getUint16(0, Endian.little),
      window: ByteData.sublistView(bytes).getInt16(2)
      timeout: ByteData.sublistView(bytes)
    );
  }
}

class CiotBleScnAdvInfo {
  List<int> mac;
  int rssi;

  CiotBleScnAdvInfo({
    required this.mac,
    required this.rssi,
  });

  static CiotBleScnCfg fromBytes(Uint8List bytes)
  {

  }
}

class CiotBleScnStatus {
  CiotBleScnState state;
  CiotBleScnAdvInfo advInfo;
  int errCode;

  CiotBleScnStatus({
    required this.state,
    required this.advInfo,
    required this.errCode,
  });

  static CiotBleScnStatus fromBytes(Uint8List bytes)
  {

  }
}

class CiotBleScnReqData {}

class CiotBleScnReq {
  CiotBleScnReqType type;
  CiotBleScnReqData data;

  CiotBleScnReq({required this.type, required this.data});

  static CiotBleScnReq fromBytes(Uint8List bytes)
  {

  }
}

class CiotBleScnData {
  CiotBleScnCfg? config;
  CiotBleScnStatus? status;
  CiotBleScnReq? request;
  CiotBleScnData({
    this.config,
    this.status,
    this.request,
  });

  static CiotBleScnData fromBytes<T>(Uint8List bytes) {
    if(T is CiotBleScnCfg) {
      return CiotBleScnData(config: CiotBleScnCfg.fromBytes(bytes));
    }
    if(T is CiotBleScnStatus) {
      return CiotBleScnData(status: CiotBleScnStatus.fromBytes(bytes));
    }
    if(T is CiotBleScnReq) {
      return CiotBleScnData(request: CiotBleScnReq.fromBytes(bytes));
    }
    return CiotBleScnData();
  }
}
