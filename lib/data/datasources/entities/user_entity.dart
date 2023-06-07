import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 2)
class UserEntity{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String surname;
  @HiveField(2)
  final String id;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String status;

  const UserEntity(this.name,this.surname,this.id, this.email, this.status);
}

class UserEntityAdapter extends TypeAdapter<UserEntity>{
  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return UserEntity(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  final int typeId = 2;

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.surname)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is UserEntityAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}