import 'dart:ffi';

@Packed(1)
enum CiotStorageType
{
  unknown,
  eeprom,
  flash,
  fs,
}

@Packed(1)
enum CiotStorageState
{
  idle,
}

@Packed(1)
enum CiotStorageReqType
{
  unknown,
  save,
  load,
  delete,
  format,
}

@Packed(1)
final class CiotStorageCfgT extends Struct
{
  @Uint8() external int type;
}

@Packed(1)
final class CiotStorageStatusT extends Struct
{
  @Uint8() external int state;
}

@Packed(1)
final class CiotStorageReqSaveT extends Struct
{
  @Array(32) external Array<Char> path;
  @Uint8() external int size;
  @Array(255) external Array<Uint8> data;
}

@Packed(1)
final class CiotStorageReqLoadT extends Struct
{
  @Array(16) external Array<Char> path;
  @Array(255) external Array<Uint8> data;
  @Uint8() external int size;
}

@Packed(1)
final class CiotStorageReqRemoveT extends Struct
{
  @Array(16) external Array<Char> path;
}

@Packed(1)
final class CiotStorageReqDataU extends Union
{
  external CiotStorageReqSaveT save;
  external CiotStorageReqLoadT load;
  external CiotStorageReqRemoveT remove;
}

@Packed(1)
final class CiotStorageReqT extends Struct
{
  @Uint8() external int type;
  external CiotStorageReqDataU data;
}

@Packed(1)
final class CiotStorageDataU extends Union
{
  external CiotStorageCfgT config;
  external CiotStorageStatusT status;
  external CiotStorageReqT request;
}