import 'package:novis_compiler/parser.dart';
import 'package:petitparser/petitparser.dart';

/*

*/
compilar() {
  var tokens = [
    {'type': 'kw', 'value': 'string', 'line': '0'},
    {'type': 'var', 'value': 'a', 'line': '0'},
    {'type': 'var', 'value': 'a', 'line': '1'},
    {'type': 'op', 'value': '=', 'line': '1'},
    {'type': 'number', 'value': '156', 'line': '1'},
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
  ];

  var prueba = [
    {
      'type': 'program',
      'body': [
        {'type': 'declare', 'build': 'string', 'value': 'a'},
        {'type': 'assign', 'operator': '=', 'left': 'a', 'right': '156'},
        {
          'type': 'conditional',
          'cond': {
            'type': 'binary',
            'left': 'a',
            'operator': '<=',
            'right': 'b'
          },
          'body': [
            {
              'type': 'conditional',
              'cond': {
                'type': 'binary',
                'left': 'a',
                'operator': ' <=',
                'right': 'b'
              },
              'body': [
                {'type': 'assign', 'operator': '=', 'left': 'a', 'right': '156'}
              ],
              'else': []
            }
          ],
          'else': [
            {'type': 'assign', 'operator': '=', 'left': 'a', 'right': '156'}
          ]
        },
        {
          'type': 'whileLoop',
          'cond': {
            'type': 'binary',
            'left': 'a',
            'operator': '<=',
            'right': '15'
          },
          'body': [
            {'type': 'assign', 'operator': '=', 'left': 'a', 'right': '200'}
          ]
        },
        {'type': 'output', 'value': 'FUNCAAAAAA'}
      ]
    }
  ];
  try {
    parser(tokens);
  } catch (e) {
    print(e);
  }
}
