import 'package:app_processo_seletivo_target/src/data/client/http_client.dart';
import 'package:app_processo_seletivo_target/src/data/infra/repository/todo_list_repository_imp.dart';
import 'package:app_processo_seletivo_target/src/domain/usecases/login_usecase_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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


class Providers {
  //Client
  static final httpI = Provider<IHttp>(
    (ref) => HttpClient(),
  );

  //datasource
  static final loginDatasource = Provider<LoginDatasourceI>(
    (ref) => DataSourceLoginImp(
      iHttp: ref.watch(httpI),
    ),
  );

  static final todoListDataSource = Provider<TodoListDatasourceLocalI>(
    (ref) => TodoListDatasourceImp(),
  );

  //Repository
  static final repositoryLogin = Provider<RepositoryLoginI>(
    (ref) => LoginRepositoryImp(
      loginDatasourceI: ref.watch(loginDatasource),
    ),
  );

  static final repositoryTodoList = Provider<TodoListRepositoryI>(
    (ref) => TodoListRepositoryImp(
      todoListDatasourceImp: ref.watch(todoListDataSource),
    ),
  );

  //UseCase
  static final loginUseCase = Provider<LoginIUsecase>(
    (ref) => LoginUserUsecaseImp(
      repositoryLogin: ref.watch(repositoryLogin),
    ),
  );

  static final todoListUseCase = Provider<TodoListUsecaseI>(
    (ref) => TodoListUsecaseImp(
      todoListRepositoryI: ref.watch(repositoryTodoList),
    ),
  );
}