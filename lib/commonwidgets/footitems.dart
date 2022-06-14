// import 'package:flutter/material.dart';
//  int? activeTab;
// class footitems extends StatefulWidget {
//   final IconData icon;
//   final String name;
//    footitems({
//     required this.icon,
//     required this.name,
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<footitems> createState() => _footitemsState();
// }

// class _footitemsState extends State<footitems> {
// int pageindex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         setState(() {
//           pageindex =0;
//         });
//         print("active=$pageindex");

//       },

//       child: Column(
//        children: [
//          Icon(widget.icon,color: Colors.white,),
//          SizedBox(height: 5,),
//          Text(widget.name,style: TextStyle(
//            color: Colors.white,
//          ),)

//        ],
//       ),
//     );
//   }
// }
