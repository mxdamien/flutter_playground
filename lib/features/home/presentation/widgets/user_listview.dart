import 'package:flutter/material.dart';

import '../../domain/entities/user_entity.dart';
import 'user_card.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key, required this.users});

  final List<UserEntity> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return UserCard(user: user);
      },
    );
  }
}
