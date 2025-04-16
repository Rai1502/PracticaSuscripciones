import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:suscription_manager_app/core/domain/models/user.dart';

final UserDataPool userDataPool = UserDataPool._();

class UserDataPool {
  UserDataPool._();
  final _subject = BehaviorSubject<User?>();

  // Llamar cuando el login es exitoso
  void addUser(User user) {
    _subject.add(user);
  }

  void clearUser() {
    _subject.add(null);
  }

  void dispose() {
    _subject.close();
  }

  User? get user => _subject.valueOrNull;
  Stream<User?> get stream => _subject.stream.distinct();
}

class UserBuilder extends StatelessWidget {
  const UserBuilder({
    super.key,
    required this.builder,
    this.emptyBuilder,
  });

  final Widget Function(BuildContext context, User user) builder;
  final Widget Function(BuildContext context)? emptyBuilder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: userDataPool.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(context, snapshot.data!);
        }
        return emptyBuilder?.call(context) ?? const SizedBox.shrink();
      },
    );
  }
}
