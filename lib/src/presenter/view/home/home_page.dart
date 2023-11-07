import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/home_controller/home_controller.dart';
import '../add_page/add_page.dart';
import 'widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeControllerApp homeControllerApp =
      HomeControllerApp(todoListUsecaseI: GetIt.I.get());
  @override
  void initState() {
    homeControllerApp.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("home"),
      drawer: const DrawerScreen(),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/add");
          },
          icon: const Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Observer(
        builder: (context) {
          return homeControllerApp.isLoadingReadData
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : homeControllerApp.entitieUserModel!.isEmpty
                  ? const Center(
                      child: Text("Lista vazia"),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: homeControllerApp.entitieUserModel!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) async {
                              if (direction == DismissDirection.startToEnd ||
                                  direction == DismissDirection.endToStart) {
                                showAdaptiveDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog.adaptive(
                                      title: const Text("Confirmação"),
                                      content:
                                          const Text("Continuar excluindo?"),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            CircleAvatar(
                                              child: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      homeControllerApp.read();
                                                    });
                                                    Navigator.pop(context);

                                                    DismissDirection.none;
                                                  },
                                                  icon:
                                                      const Icon(Icons.close)),
                                            ),
                                            CircleAvatar(
                                              child: IconButton(
                                                  onPressed: () {
                                                    homeControllerApp
                                                        .delete(index);

                                                    Navigator.of(context).pop();
                                                  },
                                                  icon:
                                                      const Icon(Icons.check)),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Card(
                              shape: const RoundedRectangleBorder(),
                              elevation: 15,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          child: Text(index.toString()),
                                        ),
                                        Text(homeControllerApp
                                            .entitieUserModel![index]
                                            .toString()),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () => showAdaptiveDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog.adaptive(
                                                title:
                                                    const Text("Confirmação"),
                                                content: const Text(
                                                    "Continuar editando?"),
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      CircleAvatar(
                                                        child: IconButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            icon: const Icon(
                                                                Icons.close)),
                                                      ),
                                                      CircleAvatar(
                                                        child: IconButton(
                                                            onPressed: () {
                                                              Navigator
                                                                  .pushReplacement(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (context) => AddPage(
                                                                            id:
                                                                                index,
                                                                            name:
                                                                                homeControllerApp.entitieUserModel![index].toString()),
                                                                      ));
                                                            },
                                                            icon: const Icon(
                                                                Icons.check)),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.edit_outlined,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
        },
      ),
    );
  }
}
