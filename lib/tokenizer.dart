import 'package:petitparser/petitparser.dart';

var tokens = [];
var kw = [
  'int',
  'float',
  'string',
  'if',
  'else',
  'end',
  'while',
  'for',
  'to'
];
List<Map<String,dynamic>> tokenizer(List<String> program){
  var lines = program;
  for(var line in program){
    var whiteSpace = char(' ');
    print(whiteSpace.parse("float a")); 
  }
  return tokens;
}
bool isKeyword(String s){
  for(var key in kw){
    if(key == s){
      return true;
    }
  }
  return false;
}
