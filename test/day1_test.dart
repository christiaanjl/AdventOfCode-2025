import 'package:advent_of_code_2025/day1.dart';
import 'package:test/test.dart';

void main() {
  test('Part 1 - Test with sample data', () async {
    expect(await password('data/day1/sample.txt'), 3);
  });

  test('Part 1 - Test with puzzle data', () async {
    expect(await password('data/day1/input.txt'), 1048);
    expect(await passwordWithMissedRefactorings('data/day1/input.txt'), 1048);
  });
}
