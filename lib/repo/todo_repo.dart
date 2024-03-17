import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/todo.dart';

class TodoRepo {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  static Future<List<Todo>?> read(String userID) async {
    try {
      QuerySnapshot querySnapshot =
          await userCollection.doc(userID).collection('todo').get();
      List<Todo> result = querySnapshot.docs
          .map((doc) => Todo.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return result;
    } catch (e) {
      return null;
    }
  }

  static Future<String> create(String userID, Todo todo) async {
    try {
      DocumentReference documentReference =
          userCollection.doc(userID).collection('todo').doc(todo.title);
      DocumentSnapshot documentSnapshot = await documentReference.get();

      if (documentSnapshot.exists) {
        return '${todo.title} already exists.';
      } else {
        await documentReference.set(todo.toJson());
        print('Todo created successfully.');
        return '';
      }
    } catch (e) {
      return 'Error occurred.';
    }
  }

  static Future<void> delete(String userID, Todo todo) async {
    try {
      DocumentReference documentReference =
          userCollection.doc(userID).collection('todo').doc(todo.title);

      await documentReference.delete();
      return;
    } catch (e) {
      return;
    }
  }
}
