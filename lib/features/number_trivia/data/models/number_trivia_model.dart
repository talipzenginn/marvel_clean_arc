import '../../domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({required int number, required String text})
      : super(text: text, number: number);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> jsonMap) {
    return NumberTriviaModel(
      text: jsonMap['text'],
      number: (jsonMap['number'] as num).toInt(),
    );
  }

  Map<String, dynamic> toMap() => {"text": text, "number": number};
}
