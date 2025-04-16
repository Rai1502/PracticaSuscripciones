import 'package:flutter/material.dart';
import 'package:suscription_manager_app/core/domain/models/user.dart';

class UserInfoTile extends StatelessWidget {
  const UserInfoTile({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        user.name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(user.email),
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
    );
  }
}
