import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/model/failure.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    store.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => store.upcomingMovies.handleState(
          () {
            return const CircularProgressIndicator();
          },
          (data) {
            return ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text(data![index].title),
              ),
              itemCount: data!.length,
            );
          },
          (error) {
            if (error is DioFailure) {
              return const Center(child: Text('Sem internet'));
            }
            if (error is DataFailure) {
              return const Center(
                child: Text('Não foi possível carregar os dados'),
              );
            }
            return Center(
              child: Text(error.message),
            );
          },
        ),
      ),
    );
  }
}
