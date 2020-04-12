import 'package:novis_compiler/tokenizer.dart' as novis_tk;
import 'package:novis_compiler/parser.dart';

/*
    var tokens = [
{'type': 'var', 'value': 'a', 'line': '2'},
    {'type': 'op', 'value': '=', 'line': '2'},
    {'type': 'var', 'value': 'b', 'line': '2'},
    {'type': 'op', 'value': '+', 'line': '2'},
    {'type': 'number', 'value': '15', 'line': '2'},
    {'type': 'op', 'value': '*', 'line': '2'},
    {'type': 'number', 'value': '20', 'line': '2'},
    {'type': 'kw', 'value': 'print', 'line': '7'},
    {'type': 'string', 'value': 'FUNCAAAAAA', 'line': '7'},
    {'type': 'kw', 'value': 'string', 'line': '0'},
    {'type': 'var', 'value': 'a', 'line': '0'},
    {'type': 'var', 'value': 'a', 'line': '1'},
    {'type': 'op', 'value': '=', 'line': '1'},
    {'type': 'var', 'value': 'a', 'line': '1'},
    {'type': 'op', 'value': '=', 'line': '1'},
    {'type': 'var', 'value': 'b', 'line': '1'},
    {'type': 'op', 'value': '+', 'line': '1'},
    {'type': 'number', 'value': '15', 'line': '1'},
    {'type': 'op', 'value': '*', 'line': '1'},
    {'type': 'number', 'value': '20', 'line': '1'},
    {'type': 'kw', 'value': 'if', 'line': '2'},
    {'type': 'var', 'value': 'a', 'line': '2'},
    {'type': 'op', 'value': '<=', 'line': '2'},
    {'type': 'var', 'value': 'b', 'line': '2'},
    {'type': 'kw', 'value': 'if', 'line': '2'},
    {'type': 'var', 'value': 'a', 'line': '2'},
    {'type': 'op', 'value': '<=', 'line': '2'},
    {'type': 'var', 'value': 'b', 'line': '2'},
    {'type': 'var', 'value': 'a', 'line': '3'},
    {'type': 'op', 'value': '=', 'line': '3'},
    {'type': 'number', 'value': '156', 'line': '3'},
    {'type': 'kw', 'value': 'end', 'line': '6'},
    {'type': 'kw', 'value': 'else', 'line': '4'},
    {'type': 'var', 'value': 'a', 'line': '5'},
    {'type': 'op', 'value': '=', 'line': '5'},
    {'type': 'number', 'value': '156', 'line': '5'},
    {'type': 'kw', 'value': 'end', 'line': '6'},
    {'type': 'kw', 'value': 'while', 'line': '2'},
    {'type': 'var', 'value': 'a', 'line': '2'},
    {'type': 'op', 'value': '<=', 'line': '2'},
    {'type': 'var', 'value': '15', 'line': '2'},
    {'type': 'var', 'value': 'a', 'line': '3'},
    {'type': 'op', 'value': '=', 'line': '3'},
    {'type': 'number', 'value': '200', 'line': '3'},
    {'type': 'kw', 'value': 'end', 'line': '6'},
    {'type': 'kw', 'value': 'print', 'line': '7'},
    {'type': 'string', 'value': 'FUNCAAAAAA', 'line': '7'},
    {'type': 'kw', 'value': 'for', 'line': '2'},
    {'type': 'var', 'value': 'i', 'line': '2'},
    {'type': 'op', 'value': '=', 'line': '2'},
    {'type': 'var', 'value': '0', 'line': '2'},
    {'type': 'kw', 'value': 'to', 'line': '2'},
    {'type': 'number', 'value': '10', 'line': '2'},
    {'type': 'var', 'value': 'a', 'line': '3'},
    {'type': 'op', 'value': '=', 'line': '3'},
    {'type': 'number', 'value': '156', 'line': '3'},
    {'type': 'kw', 'value': 'end', 'line': '4'},
    ];
*/
List<String> program = [
  'int a',
  'int b',
  'a = 5.5*b',
  'b = 100',
  'if a<=b',
  'print "El resultado es: "',
  'print a',
  'else',
  'print "<=a&& 8"',
  'end'
  'input martin'
];

compilar() {

  //try {
    var tokens = read(program);
    print(tokens);
    var arbol = parser(tokens);
    print(arbol['body'].length);
  /*} catch (e) {
    print(e);
  }*/
}

List<Map> read(List<String> program) {
  var mapProgram = <Map<String, dynamic>>[];
  for (var i = 0; i < program.length; i++) {
    //print('Linea $i => ' + program[i]);
    //print(novis_tk.tokenizer((program[i]).toString(), i));
    mapProgram = novis_tk.tokenizer((program[i]).toString(), i);
  }
  return mapProgram;
}
