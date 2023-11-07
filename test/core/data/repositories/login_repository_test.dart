import 'package:app_processo_seletivo_target/src/data/infra/repository/login_repository_imp.dart';
import 'package:app_processo_seletivo_target/src/domain/datasource/remote/login_datasource_i.dart';
import 'package:app_processo_seletivo_target/src/domain/entities/entitie_user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataRepository extends Mock implements LoginDatasourceI {}

void main() {
  late LoginRepositoryImp repository;
  late MockRemoteDataRepository mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataRepository();
    repository = LoginRepositoryImp(
      loginDatasourceI: mockRemoteDataSource,
    );
  });

  var model = const EntitieUserModel(
    id: 17,
    username: "vcholdcroftg",
    email: "vcholdcroftg@ucoz.com",
    firstName: "Bradford",
    lastName: "Prohaska",
    gender: "male",
    image: "https://robohash.org/accusantiumvoluptateseos.png",
    token:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsInVzZXJuYW1lIjoidmNob2xkY3JvZnRnIiwiZW1haWwiOiJ2Y2hvbGRjcm9mdGdAdWNvei5jb20iLCJmaXJzdE5hbWUiOiJCcmFkZm9yZCIsImxhc3ROYW1lIjoiUHJvaGFza2EiLCJnZW5kZXIiOiJtYWxlIiwiaW1hZ2UiOiJodHRwczovL3JvYm9oYXNoLm9yZy9hY2N1c2FudGl1bXZvbHVwdGF0ZXNlb3MucG5nIiwiaWF0IjoxNjk5MzQyMjI0LCJleHAiOjE2OTkzNDU4MjR9.qY56nnJ5MA03za0XmiupLIHMqEJy2hRPhvQI6lSIliA",
  );

  test(
    'should get information de login from the repository',
    () async {
      when(
        () => mockRemoteDataSource.login(
            username: "vcholdcroftg", passWord: "mSPzYZfR"),
      ).thenAnswer((_) async => model);

      final result = await repository.login(
          username: "vcholdcroftg", passWord: "mSPzYZfR");
      expect(result, model);
    },
  );
}
