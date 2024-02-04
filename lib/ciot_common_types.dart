import 'dart:ffi';

@Packed(1)
final class CiotEventDataT extends Struct
{
  @UintPtr() external int ptr;
  @Uint32() external int size;  
}