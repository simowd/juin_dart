import 'package:novis_compiler/novis_compiler.dart' as novis_comp;

List<String> program = [
  'int a',
  'int b',
  'a = 5.5*b',
  'b = 100',
  'if (a<=b)',
  'print "El resultado es: "',
  'print a',
  'else',
  'print <=a&& 8',
  'input martin'
];

void main() {
  novis_comp.read(program);
}
