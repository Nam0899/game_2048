import 'package:game_2048/models/board.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BoardAdapter extends TypeAdapter<Board> {
  @override
  Board read(BinaryReader reader) {
    return Board.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  final typeId = 0;

  @override
  void write(BinaryWriter writer, Board obj) {
    writer.write(obj.toJson());
  }
}
