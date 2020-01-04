import 'package:carteira_vacina_digital/src/user/create_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class UserModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CreateBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<UserModule>.of();
}
