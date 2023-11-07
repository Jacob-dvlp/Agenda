// ignore_for_file: use_build_context_synchronously

import 'package:app_processo_seletivo_target/src/presenter/view/home/home_page.dart';
import 'package:app_processo_seletivo_target/src/presenter/view/shared/elevation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../helpers/rgx.dart';
import '../../controllers/create_new_todo_controller/create_controller.dart';

class AddPage extends StatefulWidget {
  final int? id;
  final String? name;
  const AddPage({super.key, this.id, this.name});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    CreateNewTodoApp createNewTodoApp =
        CreateNewTodoApp(todoListUsecaseI: GetIt.I.get());
    if (widget.name != null) {
      createNewTodoApp.nameController.text = widget.name!;
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Criar'),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        },
        icon: const CircleAvatar(child: Icon(Icons.arrow_back)),
      ),
      body: SizedBox(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: createNewTodoApp.nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: const Text("Digite o nome"),
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Observer(
                  builder: (context) {
                    return !createNewTodoApp.isLoading
                        ? ElevationButton(
                            onPressed: () async {
                              if (createNewTodoApp
                                  .nameController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                          "Campos vazios não são permetidos")),
                                );
                                return;
                              } else if (createNewTodoApp
                                      .nameController.text.length <=
                                  2) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                            "Nome muito culto,deve conter no maxímo 3 letras")));
                                return;
                              }
                              if (widget.name != null) {
                                await createNewTodoApp.update(
                                    id: widget.id!,
                                    name: createNewTodoApp.nameController.text,
                                    context: context);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              } else {
                                await createNewTodoApp.create(context);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              }
                            },
                            child: "Guardar",
                          )
                        : const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
