import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 3)
class SettingsEntity{
  @HiveField(0)
  final String language;
  @HiveField(1)
  final String theme;
  @HiveField(2)
  final bool isLoggedIn;
  @HiveField(3)
  final String countryCode;
  @HiveField(4)
  final bool isLangChangedOnce;


  const SettingsEntity(this.language,this.theme, this.isLoggedIn, this.countryCode, this.isLangChangedOnce);
}

class SettingsEntityAdapter extends TypeAdapter<SettingsEntity>{
  @override
  SettingsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return SettingsEntity(
      fields[0] as String,
      fields[1] as String,
      fields[2] as bool,
      fields[3] as String,
      fields[4] as bool,

    );
  }

  @override
  final int typeId = 3;

  @override
  void write(BinaryWriter writer, SettingsEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.language)
      ..writeByte(1)
      ..write(obj.theme)
      ..writeByte(2)
      ..write(obj.isLoggedIn)
      ..writeByte(3)
      ..write(obj.countryCode)
      ..writeByte(4)
      ..write(obj.isLangChangedOnce);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is SettingsEntityAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}