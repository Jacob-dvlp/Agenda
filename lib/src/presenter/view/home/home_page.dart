import 'package:app_processo_seletivo_target/helpers/constants.dart';
import 'package:app_processo_seletivo_target/src/presenter/view/home/widgets/todo_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/home_controller/home_controller.dart';
import 'widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeControllerApp homeControllerApp;

  @override
  void initState() {
    homeControllerApp = GetIt.I.get<HomeControllerApp>();
    homeControllerApp.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("home"),
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      drawer: const DrawerScreen(),
      body: Observer(
        builder: (context) {
          return homeControllerApp.isLoadingReadData
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : _buildBodySection();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/add");
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBodySection() {
    return homeControllerApp.entitieUserModel!.isEmpty
        ? const Center(
            child: Text("Lista vazia"),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: homeControllerApp.entitieUserModel!.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: kDefaultPadding / 2);
              },
              itemBuilder: (context, index) {
                return TodoListItem(
                  itemIndex: index,
                  value: homeControllerApp.entitieUserModel![index],
                );
              },
            ),
          );
  }
}
