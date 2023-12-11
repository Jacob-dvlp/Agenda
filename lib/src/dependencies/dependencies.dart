import 'package:app_processo_seletivo_target/src/data/client/http_client.dart';
import 'package:app_processo_seletivo_target/src/data/infra/repository/todo_list_repository_imp.dart';
import 'package:app_processo_seletivo_target/src/domain/usecases/login_usecase_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../data/client/i_http.dart';
import '../data/infra/datasources/local/todo_list_datasource_imp.dart';
import '../data/infra/datasources/remote/data_source_login_imp.dart';
import '../data/infra/repository/login_repository_imp.dart';
import '../domain/datasource/local/todo_list_datasource_local_i.dart';
import '../domain/datasource/remote/login_datasource_i.dart';
import '../domain/respository/login_repository_l.dart';
import '../domain/respository/todo_list_repository_i.dart';
import '../domain/usecases/login_usecase_i.dart';
import '../domain/usecases/todo_list_usecase_i.dart';
import '../domain/usecases/todo_list_usecase_imp.dart';
import '../presenter/controllers/home_controller/home_controller.dart';
import '../presenter/controllers/login_controller/login_controller.dart';

class Dependencies {
  static final getIt = GetIt.instance;

  inject() {
    //Controller
    getIt.registerFactory(
      () => LoginControllerApp(loginIUsecase: getIt.get()),
    );

    getIt.registerLazySingleton<HomeControllerApp>(
        () => HomeControllerApp(todoListUsecaseI: getIt.get()));
    //datasource
    getIt.registerLazySingleton<LoginDatasourceI>(
      () => DataSourceLoginImp(iHttp: getIt.get()),
    );
    getIt.registerLazySingleton<TodoListDatasourceLocalI>(
      () => TodoListDatasourceImp(),
    );
    //Repository
    getIt.registerLazySingleton<RepositoryLoginI>(
      () => LoginRepositoryImp(loginDatasourceI: getIt.get()),
    );
    getIt.registerLazySingleton<TodoListRepositoryI>(
      () => TodoListRepositoryImp(todoListDatasourceImp: getIt.get()),
    );
    //UseCases
    getIt.registerLazySingleton<LoginIUsecase>(
      () => LoginUserUsecaseImp(repositoryLogin: getIt.get()),
    );
    getIt.registerLazySingleton<TodoListUsecaseI>(
      () => TodoListUsecaseImp(todoListRepositoryI: getIt.get()),
    );
  }

}
