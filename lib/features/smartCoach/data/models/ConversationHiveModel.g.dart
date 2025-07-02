// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConversationHiveModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConversationHiveModelAdapter extends TypeAdapter<ConversationHiveModel> {
  @override
  final int typeId = 0;

  @override
  ConversationHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConversationHiveModel(
      messages: (fields[0] as List).cast<ChatMessageHiveModel>(),
      timestamp: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ConversationHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.messages)
      ..writeByte(1)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
