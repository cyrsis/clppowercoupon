import 'package:cloud_firestore/cloud_firestore.dart';
import 'AppConst.dart';
import 'AppStyleExport.dart';

//AppFuture always return get()
class AppFuture {

  Future<DocumentSnapshot> getFireStoreDocs() async {
    return await Firestore.instance
        .document("/user_data/b1wNo6gKATTiGNWK7DJb")
        .get();
  }



  static get TextWidgetByFuture => Firestore.instance
          .collection("TextWidget")
          .document("-LfThwyuUZKQxUq20feQ")
          .get()
          .then((DocumentSnapshot doc) {
        print(" docs data values ${doc.data}");

        return doc.data;
      });

//  getGames is not returning the gameList you created. Make the function return the list of games. I can't test it, but give this a try

  // Future<List<YooumaUserRecording>> getGames() async {
  //   List<YooumaUserRecording> PreviousCustomers = [];
  //
  //   QuerySnapshot result = await Firestore.instance
  //       .collection(AppConst.YooumaUserRecording)
  //       .getDocuments();
  //
  //   List<DocumentSnapshot> documents = result.documents;
  //
  //   documents.forEach((DocumentSnapshot doc) {
  //     YooumaUserRecording game = new YooumaUserRecording.fromFirestore(doc);
  //     PreviousCustomers.add(game);
  //   });
  //
  //   return PreviousCustomers;
  // }
  //


//  static get InstagramFeed(currentUserModel) async {
//    List<ActivityFeedItem> items = [];
//    var snap = await Firestore.instance
//        .collection('insta_a_feed')
//        .document(currentUserModel.id)
//        .collection("items")
////        .orderBy("timestamp")
//        .getDocuments();
//
//    for (var doc in snap.documents) {
//      items.add(new ActivityFeedItem.fromDocument(doc));
//    }
//    return items;
//  }
}
