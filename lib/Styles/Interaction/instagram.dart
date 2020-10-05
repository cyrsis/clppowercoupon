// import 'package:flutter/material.dart';
// import 'package:flare_flutter/flare_actor.dart';
// import 'package:flare_flutter/flare_controls.dart';
//
// class InstagramInteraction extends StatefulWidget {
//   @override
//   _InstagramInteractionState createState() => _InstagramInteractionState();
// }
//
// class _InstagramInteractionState extends State<InstagramInteraction> {
//   final FlareControls flareControls = FlareControls();
//   bool isLiked = false;
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           GestureDetector(
//             onDoubleTap: () {
//               setState(() {
//                 isLiked = !isLiked;
//               });
//               flareControls.play("like");
//             },
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   width: double.infinity,
//                   height: 250,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/interaction/laptop.jpg'))),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 250,
//                   child: Center(
//                     child: SizedBox(
//                       width: 80,
//                       height: 80,
//                       child: FlareActor(
//                         'assets/interaction/instagram_like.flr',
//                         controller: flareControls,
//                         animation: 'idle',
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             children: <Widget>[
//               Expanded(
//                 child: Row(
//                   children: <Widget>[
//                     IconButton(
//                       iconSize: 30,
//                       icon:
//                           Icon(isLiked ? Icons.favorite : Icons.favorite_border),
//                       onPressed: () {},
//                     ),
//                     IconButton(
//                       iconSize: 30,
//                       icon: Icon(Icons.comment),
//                       onPressed: () {},
//                     )
//                   ],
//                 ),
//               ),
//               IconButton(
//                 iconSize: 30,
//                 icon: Icon(Icons.bookmark),
//                 onPressed: () {},
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
