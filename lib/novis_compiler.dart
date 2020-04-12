import 'package:novis_compiler/tokenizer.dart' as novis_tk;

void read(List<String> program) {
  for (var i = 0; i < program.length; i++) {
    print('Linea $i => ' + program[i]);
    novis_tk.tokenizer((program[i]).toString(), i);
  }
}
