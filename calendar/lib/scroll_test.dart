
// import 'package:flutter/material.dart';
// // import 'package:flutter_calendar/flutter_calendar.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final datas = List.generate(20, (i) => i + 1);
//   final scrollController = ScrollController();
//   bool isLoading = false;
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(() {
//       if (scrollController.position.maxScrollExtent ==
//           scrollController.offset) {
//         loadMore();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         title: Text('Demo load more flutter'),
//       ),
//       body: RefreshIndicator(
//         child: ListView.builder(
//           controller: scrollController,
//           itemBuilder: (BuildContext context, int index) {
//             if (index < datas.length) {
//               return Card(
//                 child: Column(children: <Widget>[
//                   Text(" index idk $index"),
//                   new Calendar(),
//                 ],),
                
//               );   
//             }
//             return Center(
//               child: Opacity(
//                 opacity: isLoading ? 1.0 : 0.0,
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           },
//           itemCount: datas.length + 1,
//         ),
//         onRefresh: () async {
//           datas
//             ..clear()
//             ..addAll(await fetchDatas(1, 21));

//           setState(() {});
//         },
//       ),
//     );
//   }

//   loadMore() async {
//     if (!isLoading) {
//       setState(() => isLoading = true);

//       if (datas.length >= 79) {
//         await Future.delayed(Duration(seconds: 3));
//         setState(() => isLoading = false);
//         await makeAnimation();
//         scaffoldKey.currentState?.showSnackBar(
//           SnackBar(
//             content: Text('Get max data!'),
//           ),
//         );
//         return;
//       }

//       final newDatas = await fetchDatas(datas.length + 1, datas.length + 21);
//       datas.addAll(newDatas);
//       isLoading = false;
//       setState(() {});
//     }
//   }

//   makeAnimation() async {
//     final offsetFromBottom =
//         scrollController.position.maxScrollExtent - scrollController.offset;
//     if (offsetFromBottom < 50) {
//       await scrollController.animateTo(
//         scrollController.offset - (50 - offsetFromBottom),
//         duration: Duration(milliseconds: 500),
//         curve: Curves.easeOut,
//       );
//     }
//   }
// }

// Future<List<int>> fetchDatas(int start, int end) {
//   return Future.delayed(Duration(seconds: 3), () {
//     return List.generate(end - start, (i) => i + start);
//   });
// }