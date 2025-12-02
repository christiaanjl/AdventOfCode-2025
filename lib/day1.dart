import 'dart:io';

typedef DialState = ({int dialPosition, int zeroCount});

Future password(String file) async {
  var rotations = await File(file).readAsLines();

  return rotations.where((rotation) => rotation.isNotEmpty).fold<DialState>((dialPosition: 50, zeroCount: 0),
      (result, rotation) {
    var [direction, ...numberString] = rotation.split('');
    var numberInt = int.parse(numberString.join(''));

    var temp = result.dialPosition + (direction == 'L' ? -1 * numberInt : numberInt);

    int newDialPosition = (temp < 0 || temp > 99) ? temp % 100 : temp;
    int newZeroCount = newDialPosition == 0 ? result.zeroCount + 1 : result.zeroCount;

    return (dialPosition: newDialPosition, zeroCount: newZeroCount);
  }).zeroCount;
}

Future<int> passwordWithMissedRefactorings(String file) async => (await File(file).readAsLines())
        .where((rotation) => rotation.isNotEmpty)
        .fold<DialState>((dialPosition: 50, zeroCount: 0), (state, rotation) {
      var delta = int.parse(rotation.substring(1));
      var tmp = state.dialPosition + (delta * (rotation[0] == 'L' ? -1 : 1));

      int newDialPosition = (tmp < 0 || tmp > 99) ? tmp % 100 : tmp;
      int newZeroCount = newDialPosition == 0 ? state.zeroCount + 1 : state.zeroCount;

      return (dialPosition: newDialPosition, zeroCount: newZeroCount);
    }).zeroCount;
