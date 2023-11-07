import 'package:app_processo_seletivo_target/src/domain/entities/entitie_user_model.dart';
import 'package:app_processo_seletivo_target/src/domain/respository/login_repository_l.dart';
import 'package:app_processo_seletivo_target/src/domain/usecases/login_usecase_i.dart';
import 'package:app_processo_seletivo_target/src/domain/usecases/login_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginRepository extends Mock implements RepositoryLoginI {}

class MockLoginUsecase extends Mock implements LoginIUsecase {}

void main() {
  late LoginIUsecase usecase;
  late MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    usecase = LoginUserUsecaseImp(repositoryLogin: mockLoginRepository);
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
        () => mockLoginRepository.login(
            username: "vcholdcroftg", passWord: "mSPzYZfR"),
      ).thenAnswer((_) async => model);

      final result = await usecase.login(username: "vcholdcroftg", passWord: "mSPzYZfR");
      expect(result, model);
      verify(() => mockLoginRepository.login(username: "vcholdcroftg", passWord: "mSPzYZfR"));
      verifyNoMoreInteractions(mockLoginRepository);
    },
  );

}
