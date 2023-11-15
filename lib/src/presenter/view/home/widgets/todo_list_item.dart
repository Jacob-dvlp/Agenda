// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../controllers/home_controller/home_controller.dart';
import '../../add_page/add_page.dart';

class TodoListItem extends StatefulWidget {
  const TodoListItem({
    Key? key,
    required this.itemIndex,
    required this.value,
  }) : super(key: key);

  final int itemIndex;
  final String value;

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  late HomeControllerApp homeControllerApp;

  @override
  void initState() {
    homeControllerApp = GetIt.I.get<HomeControllerApp>();
    homeControllerApp.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                content: const Text("Continuar excluindo?"),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            icon: const Icon(Icons.close)),
                      ),
                      CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            homeControllerApp.delete(widget.itemIndex);

                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.check),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          );
        }
      },
      child: _buildBody(context),
    );
  }

  Card _buildBody(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(),
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text(widget.itemIndex.toString()),
                ),
                Text(homeControllerApp.entitieUserModel![widget.itemIndex]
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
                        title: const Text("Confirmação"),
                        content: const Text("Continuar editando?"),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.close)),
                              ),
                              CircleAvatar(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddPage(
                                            id: widget.itemIndex,
                                            name: homeControllerApp
                                                .entitieUserModel![
                                                    widget.itemIndex]
                                                .toString()),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.check),
                                ),
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
    );
  }
}
