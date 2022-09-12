// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:mobx/mobx.dart';

// import '../../data/models/user.dart';
// import '../../store/user_store.dart';

// class UserList extends StatelessWidget {
//   UserStore store = UserStore();

//   UserList({super.key}) {
//     store.getTheUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final future = store.userListFuture;
//     return Observer(
//       builder: (_) {
//         switch (future.status) {
//           case FutureStatus.pending:
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           case FutureStatus.fulfilled:
//             final List<User> users = future.result;
//             print(users);
//             return RefreshIndicator(
//               onRefresh: _refresh,
//               child: ListView.builder(
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 itemCount: users.length,
//                 itemBuilder: (context, index) {
//                   final user = users[index];
//                   return ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: NetworkImage(user.avatar),
//                       radius: 25,
//                     ),
//                     title: Text(
//                       user.name,
//                       style: const TextStyle(
//                           color: Colors.black, fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text(
//                       user.email,
//                       style: const TextStyle(
//                           color: Colors.black, fontWeight: FontWeight.w400),
//                     ),
//                     trailing: Text(
//                       user.followers.toString(),
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w500, fontSize: 15),
//                     ),
//                   );
//                 },
//               ),
//             );
//           case FutureStatus.rejected:
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   const Text(
//                     'Failed to load items.',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton(
//                     onPressed: _refresh,
//                     child: const Text('Tap to retry'),
//                   )
//                 ],
//               ),
//             );
//         }
//       },
//     );
//   }

//   Future _refresh() => store.fetchUsers();
// }
