import 'package:novis_compiler/parser.dart';
import 'package:petitparser/petitparser.dart';

int calculate() {
    final id = ((word().star() | string('<=').star() )).flatten();
    print(id.matchesSkipping('if a<=5')); 
  return 6 * 7;
}
