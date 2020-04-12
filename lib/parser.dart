//ast List Map
Map ast;
//parser function
Map parser(List<Map> tokens) {
  var copy = tokens;
  var current = 0;
  var token;

  walk() {
    //initializer
    token = copy[current];
    //var constructor
    if (token['type'] == 'var') {
      var variable = token['value'];
      token = tokens[++current];
      if (token['type'] == 'op' && token['value'] == '=') {
        token = tokens[++current];
        if (token['type'] == 'string' ||
            token['type'] == 'number' ||
            token['type'] == 'var') {
          current++;
          return {
            'type': 'assign',
            'operator': '=',
            'left': variable,
            'right': token['value']
          };
        } else {
          throw ('Expected on line ' +
              copy[current]['line'] +
              ' number or string but got ' +
              token['value'] +
              ' instead');
        }
      } else {
        throw ("Expected '=' on line " +
            copy[current]['line'] +
            ' but got ' +
            token['value'] +
            ' instead');
      }
    }

    //verif and build kw;
    if (token['type'] == 'kw') {
      //verif int
      if (token['value'] == 'int') {
        token = copy[++current];
        if (token['type'] == 'var') {
          token = copy[++current];
          return {'type': 'declare', 'build': 'int', 'value': token['value']};
        } else {
          throw ("Expected 'var' on line " +
              copy[current]['line'] +
              ' but got ' +
              token['value'] +
              ' instead');
        }
      }

      //verify float
      if (token['value'] == 'float') {
        token = copy[++current];
        if (token['type'] == 'var') {
          token = copy[++current];
          return {'type': 'declare', 'build': 'float', 'value': token['value']};
        } else {
          throw ("Expected 'var' on line " +
              copy[current]['line'] +
              ' but got ' +
              token['value'] +
              ' instead');
        }
      }
      //verify string
      if (token['value'] == 'string') {
        token = copy[++current];
        if (token['type'] == 'var') {
          token = copy[++current];
          return {
            'type': 'declare',
            'build': 'string',
            'value': token['value']
          };
        } else {
          throw ("Expected 'var' on line " +
              copy[current]['line'] +
              ' but got ' +
              token['value'] +
              ' instead');
        }
      }
      //verify print
      if (token['value'] == 'print') {
        token = copy[++current];
        if (token['type'] == 'var' ||
            token['type'] == 'string' ||
            token['type'] == 'var' ||
            token['type'] == 'number') {
          current++;
          return {'type': 'output', 'value': token['value']};
        } else {
          throw ('Unexpected error on line ' +
              copy[current]['line'] +
              ' but got ' +
              token['value'] +
              ' instead');
        }
      }

      //verify while
      if (token['value'] == 'while') {
        token = copy[++current];
        if (token['type'] == 'var' ||
            token['type'] == 'number' ||
            token['type'] == 'string') {
          var varA = token['value'];
          token = copy[++current];
          if (token['type'] == 'op') {
            var operate = token['value'];
            token = copy[++current];
            if (token['type'] == 'var' ||
                token['type'] == 'number' ||
                token['type'] == 'string') {
              var binary = {
                'type': 'binary',
                'left': varA,
                'operator': operate,
                'right': token['value']
              };
              Map<String, dynamic> parent = {
                'type': 'whileLoop',
                'cond': binary,
                'body': [],
              };
              token = tokens[++current];
              //recursive function to get all lower level body
              while (token['value'] != 'end') {
                parent['body'].add(walk());
                token = copy[current];
              }
              token = copy[current];
              current++;
              return parent;
            } else {
              throw ("Expected 'var' or 'number' on line " +
                  copy[current]['line'] +
                  ' but got ' +
                  token['value'] +
                  ' instead');
            }
          } else {
            throw ("Expected 'op' on line " +
                copy[current]['line'] +
                ' but got ' +
                token['value'] +
                ' instead');
          }
        } else {
          throw ("Expected 'var' or 'number' on line " +
              copy[current]['line'] +
              ' but got ' +
              token['value'] +
              ' instead');
        }
      }
      //verify if
      if (token['value'] == 'if') {
        token = copy[++current];
        if (token['type'] == 'var' ||
            token['type'] == 'number' ||
            token['type'] == 'string') {
          var varA = token['value'];
          token = copy[++current];
          if (token['type'] == 'op') {
            var operate = token['value'];
            token = copy[++current];
            if (token['type'] == 'var' ||
                token['type'] == 'number' ||
                token['type'] == 'string') {
              var binary = {
                'type': 'binary',
                'left': varA,
                'operator': operate,
                'right': token['value']
              };
              Map<String, dynamic> parent = {
                'type': 'conditional',
                'cond': binary,
                'body': [],
                'else': [],
              };
              token = tokens[++current];
              //recursive function to get all lower level body
              while (token['value'] != 'end' && token['value'] != 'else') {
                parent['body'].add(walk());
                token = copy[current];
              }
              token = copy[current];

              if (token['type'] == 'kw' && token['value'] == 'else') {
                //recursive function to get all lower level body
                token = copy[++current];
                while (token['value'] != 'end') {
                  parent['else'].add(walk());
                  token = copy[current];
                }
                current++;
              } else {
                if (token['value'] != 'end') {
                  throw ("Expected else on line " +
                      copy[current]['line'] +
                      ' but got ' +
                      token['value'] +
                      ' instead');
                }
                current++;
              }
              //current++;
              return parent;
            } else {
              throw ("Expected 'var' or 'number' on line " +
                  copy[current]['line'] +
                  ' but got ' +
                  token['value'] +
                  ' instead');
            }
          } else {
            throw ("Expected 'op' on line " +
                copy[current]['line'] +
                ' but got ' +
                token['value'] +
                ' instead');
          }
        } else {
          throw ("Expected 'var' or 'number' on line " +
              copy[current]['line'] +
              ' but got ' +
              token['value'] +
              ' instead');
        }
      }
      //verify end,else and to
      if(token['value'] == 'end' || token['value'] == 'else' || token['value'] == 'to'){
        throw('Unexpected' + token['value'] + 'on line ' + token['line']);
      }
    }
  }

  ast = {'type': 'program', 'body': []};
  while (current < copy.length) {
    ast['body'].add(walk());
  }
  print(ast);
  return ast;
}
