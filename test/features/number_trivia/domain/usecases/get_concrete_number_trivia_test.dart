import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_bloc/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:marvel_bloc/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:marvel_bloc/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });
  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(number: 1, text: 'test');
  test('Should get triva for the number from the repository', () async {
    //arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => const Right(tNumberTrivia));
    //act
    final result =
        await usecase(const Params(number: tNumber)); //same as usecase.call(...)
    //assert
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}