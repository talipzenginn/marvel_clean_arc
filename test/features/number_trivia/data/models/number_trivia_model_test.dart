import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_bloc/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:marvel_bloc/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test');
  test('Should be a subclass of NumberTrivia entity', () async {
    //assert
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group("from json", () {
    test('Should return a valid model when the json number is an integer',
        () async {
      //arrange
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('trivia.json'));
      final result = NumberTriviaModel.fromJson(jsonMap);
      //act
      //assert
      expect(result, tNumberTriviaModel);
    });
    test('Should return a valid model when the json number is a double',
        () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('trivia_double.json'));
      final result = NumberTriviaModel.fromJson(jsonMap);
      //act
      //assert
      expect(result, tNumberTriviaModel);
    });
  });

  group("to json", () {
    test('Should return a JSON map containing the proper data', () async {
      //arrange
      final result = tNumberTriviaModel.toMap();
      final expectedMap = {
        "text": "Test",
        "number": 1,
      };
      //act
      //assert
      expect(result, expectedMap);
    });
  });
}
