import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Receipt {
  final bool complete;
  final String id;
  final String note;
  final String task;

  Receipt(this.task, {this.complete = false, String note = '', String id})
      : this.note = note ?? '',
        this.id = id;

  Receipt copyWith({bool complete, String id, String note, String task}) {
    return Receipt(
      task ?? this.task,
      complete: complete ?? this.complete,
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  @override
  int get hashCode =>
      complete.hashCode ^ task.hashCode ^ note.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Receipt &&
          runtimeType == other.runtimeType &&
          complete == other.complete &&
          task == other.task &&
          note == other.note &&
          id == other.id;

  @override
  String toString() {
    return 'Todo{complete: $complete, task: $task, note: $note, id: $id}';
  }

  ReceiptEntity toEntity() {
    return ReceiptEntity(task, id, note, complete);
  }

  static Receipt fromEntity(ReceiptEntity entity) {
    return Receipt(
      entity.task,
      complete: entity.complete ?? false,
      note: entity.note,
      id: entity.id,
    );
  }
}
