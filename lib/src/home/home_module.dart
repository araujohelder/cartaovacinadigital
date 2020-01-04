import 'package:carteira_vacina_digital/src/home/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:carteira_vacina_digital/src/login/login_page.dart';
import 'package:flutter/material.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => LoginPage();

  static Inject get to => Inject<HomeModule>.of();
}
