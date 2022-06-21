import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_bloc/core/usecases/usecases.dart';
import 'package:marvel_bloc/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:marvel_bloc/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:marvel_bloc/features/number_trivia/domain/usecases/get_random_trivia.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });
  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(number: 1, text: 'test');
  test('should get random trivia from the repository', () async {
    //arrange
    when(mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async => const Right(tNumberTrivia));
    //act
    final result =
        await usecase(NoParams()); //same as usecase.call(...)
    //assert
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}