import 'package:novis_compiler/parser.dart';
import 'package:petitparser/petitparser.dart';

/*
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
*/
compilar() {
  var tokens = [
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
  try {
    var arbol = parser(tokens);
    print(arbol['body'].length);
  } catch (e) {
    print(e);
  }
}
