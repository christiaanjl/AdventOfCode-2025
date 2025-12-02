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
