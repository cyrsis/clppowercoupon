import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math' as math;
import 'AppConst.dart';

class AppServices {
  var db = Firestore.instance;

  Future<void> SingleFileWrtie(text) async {
    await Firestore.instance
        .collection('docs')
        .document()
        .setData({'text': text});
  }

  Future<void> SingleFileUpdate(item, text) async {
    await Firestore.instance
        .collection('docs')
        .document(item.documentID)
        .updateData({'text': text});
  }

  Future<void> SingleFileFilters(item, searchtext) async {
    var query = await Firestore.instance
        .collection('docs')
        .where('text', isEqualTo: searchtext)
        .getDocuments();
    var _queriedDocs = query.documents.length;
  }

  Future<void> SingleFileDelete(itemID) {
    Firestore.instance.collection('docs').document(itemID).delete();
  }

  void batchMutliples() {
    var storyRef = db.collection('stories').document('hello-world');
    var statsRef = db.collection('stories').document('--stats--');

    var increment = FieldValue.increment(1);

    var batch = db.batch();
    var storyRefRand = db.collection('stories').document('${math.Random}');

    batch.setData(storyRef, {'title': 'New Story2!'});

    //Make sure use Updatedate
    batch.updateData(statsRef, {'storyCount': increment});

    batch.commit();
  }

  void batchDeleteData() {
    //And use this batch to write a document.
    var batch = db.batch();

    batch.delete(db.collection('test').document('testid'));

    batch.commit();
    //Confirm working
  }

  void batchUpdateData() {
    //And use this batch to write a document.
    var batch = db.batch();

    batch
        .updateData(db.collection('test').document('testid'), {'status': 'No'});

    batch.commit();
    //Confirm working
  }

  void batchSetData() {
    //And use this batch to write a document.
    var batch = db.batch();

    batch.setData(
        db.collection('test').document('testid'), {'status': 'Approved'});

    batch.commit();
    //Confirm working
  }

  Future<void> addcard(token) async {
    var user = FirebaseAuth.instance.currentUser;
    await Firestore.instance
        .collection('cards')
        .document(user.uid)
        .collection('stripeToken')
        .add({'stripId': token}).then((val) {
      print("saved");
    });
  }

  GetYooumaMusicByID(String MusicUid) async {
    var MusicDoc = await db
        .collection(AppConst.YooumaMusicAll)
        .document(MusicUid)
        .get()
        .asStream();

    return MusicDoc;
  }
}
