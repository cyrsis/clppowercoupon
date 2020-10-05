import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
// import '../Bloc/GloabBloc/GlobalBloc.dart';
import './AppStyleExport.dart';
import 'package:rxdart/rxdart.dart';

//AppStream Always return snapshot
class AppStream {




  // static YooumaUserFavorite() => Firestore.instance
  //     .collection(AppConst.YooumaFavourite)
  //     .document(globalBloc.User.uid)
  //     .snapshots();

  static YooumaSpaCustomerRecording(email) => Firestore.instance
      .collection(AppConst.YooumaUserRecording)
      .where('email', isEqualTo: email)
      .snapshots();

  static YooumaSpaUserRecording(SpaID) => Firestore.instance
      .collection(AppConst.YooumaUserRecording)
      .where('spa_id', isEqualTo: SpaID)
      .snapshots();

  static YooumaUserRecordStream() =>
      Firestore.instance.collection(AppConst.YooumaUserRecording).snapshots();

  static YooumaMusicWorld() => Firestore.instance
      .collection(AppConst.YooumaMusicAll)
      .where('genre', isEqualTo: "WORLD")
      .snapshots();

  static YooumaMusicWhere(String value) => Firestore.instance
      .collection(AppConst.YooumaMusicAll)
      .where('genre', isEqualTo: value)
      .snapshots();

  static YooumaSpaRecord() => Firestore.instance
      .collection(AppConst.YooumaSpaRecording)
      .orderBy(
        "date")
      .snapshots();

  static YooumaMusicLastByDeviceId() => Firestore.instance
      .collection(AppConst.YooumaUserRecording)
      .orderBy("createdAt", descending: true)
      .snapshots();

  static YooumaMusicLastTwo() => Firestore.instance
      .collection(AppConst.YooumaUserRecording)
      .orderBy("createdAt", descending: true)
      .limit(2)
      .snapshots();
  static YooumaMusicALL() =>
      Firestore.instance.collection(AppConst.YooumaMusicAll).snapshots();

  static YooumaMusicByID(ID) => Firestore.instance
      .collection(AppConst.YooumaMusicAll)
      .document(ID)
      .snapshots();

  static YooumaSpaDevice(id) => Firestore.instance
      .collection(AppConst.YooumaSpaUnit)
      .document("${id}")
      .snapshots();

  static CreatizeColumn(id) => Firestore.instance
      .collection(AppConst.CreatizeColumnWidget)
      .document("${id}")
      .snapshots();

  static CreatizeApp(id) => Firestore.instance
      .collection("CreatizeApp")
      .document("${id}")
      .snapshots();

  static TextWidgetNoFuture(id) =>
      Firestore.instance.collection("TextWidget").document("${id}").snapshots();

  static get userSnapShot => Firestore.instance.collection('users').snapshots();

  static get InstragramPost =>
      Firestore.instance.collection('insta_posts').snapshots();

  static get StripePayment =>
      Firestore.instance.collection('flutter').snapshots();

  static get MapClientAddress =>
      Firestore.instance.collection('markers').snapshots();

  static get HairVenu => Firestore.instance.collection('hairvenue').snapshots();

  static get hairPostSnapShot =>
      Firestore.instance.collection('hairpost').snapshots();

  static get ArroCafeSnapShot =>
      Firestore.instance.collection('arrocafe').snapshots();

  static get ArroCafeReviewSnapShot =>
      Firestore.instance.collection('arroreview').snapshots();

  static StripRefundes(userUid) => Firestore.instance
      .collection('stripecards')
      .document(userUid)
      .collection('refunds')
      .document();

  static StripeCharges(userUid) => Firestore.instance
      .collection('stripecards')
      .document(userUid)
      .collection('charges')
      .document();

  static StripeCard(userUid) => Firestore.instance
      .collection('stripecards')
      .document(userUid)
      .collection("sources")
      .snapshots();

  static MessageChat(groupChatId) => Firestore.instance
      .collection('messages')
      .document(groupChatId)
      .collection(groupChatId)
      .orderBy('timestamp', descending: true)
      .limit(20)
      .snapshots();

  static Query Stores(tag) => Firestore.instance
      .collection('stories')
      .where('tags', arrayContains: tag);

  static StreamText2() => _returnSteam();
  static StreamText() => () async* {
        StringBuffer buffer = StringBuffer();
        for (int i = 0; i < 20; i++) {
          await Future.delayed(Duration(seconds: 1));
          buffer.writeln("Line ${i}");
          yield buffer.toString();
        }
      };

  static ImageList() => _returnListofString();
}

Stream<List<String>> _returnListofString() {
//  List<String> buffer = [];
//  for (int i = 0; i < 10; i++) {
////    await Future.delayed(Duration(seconds: 1));
//    print("Line ${i}");
//    buffer.add(images[i]);
//    yield buffer;
//  }

  return Stream.fromIterable([AppImage.ImagesNetwork]).take(5);
}

Stream<int> _returnSteam() {
  return Stream.fromIterable([1, 2, 3, 4, 5]).asBroadcastStream();
//  return Stream.fromIterable(["1", "2", "3"]);
}
