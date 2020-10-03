import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:backend_repository/backend_repository.dart';
import 'entities/entities.dart';

class FirebaseTodosRepository {
  final todoCollection = FirebaseFirestore.instance.collection('todos');

  Future<void> addNewTodo(Receipt todo) {
    return todoCollection.add(todo.toEntity().toDocument());
  }

  Future<void> deleteTodo(Receipt todo) async {
    return todoCollection.doc(todo.id).delete();
  }

  Stream<List<Receipt>> todos() {
    return todoCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Receipt.fromEntity(ReceiptEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  Future<void> updateTodo(Receipt update) {
    return todoCollection.doc(update.id).update(update.toEntity().toDocument());
  }
}
