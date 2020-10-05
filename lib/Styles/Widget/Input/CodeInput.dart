import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Code Input"),
      ),
      body: Center(
        child: CodeInput(
          lenght: 4,
        ),
      ),
    );
  }
}

class CodeInput extends StatefulWidget {
  final int lenght;

  const CodeInput({Key key, this.lenght}) : super(key: key);
  @override
  _CodeInputState createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  var nodes = List<FocusNode>();
  var inputs = List<Code>();
  final List<TextEditingController> editingControllers =
      List<TextEditingController>();

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.lenght; i++) {
      nodes.add(FocusNode());
      editingControllers.add(TextEditingController(text: ""));
    }
    for (var i = 0; i < widget.lenght; i++) {
      inputs.add(Code(
        index: i,
        editingControllers: editingControllers,
        focusNode: nodes,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      child: Row(
        children: inputs,
      ),
    );
  }
}

class Code extends StatefulWidget {
  final int index;
  final List<FocusNode> focusNode;
  final List<TextEditingController> editingControllers;
  const Code({
    Key key,
    this.focusNode,
    this.index,
    this.editingControllers,
  }) : super(key: key);

  @override
  CodeState createState() {
    return new CodeState();
  }
}

class CodeState extends State<Code> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Theme(
          data: ThemeData(primaryColor: Colors.green),
          child: TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            keyboardType: TextInputType.number,
            controller: widget.editingControllers[widget.index],
            textAlign: TextAlign.center,
            focusNode: widget.focusNode[widget.index],
            onChanged: (value) {
              print(widget.index);
              print(widget.focusNode.length);
              if (widget.index < widget.focusNode.length - 1 &&
                  widget.editingControllers[widget.index].text.isNotEmpty) {
                FocusScope.of(context)
                    .requestFocus(widget.focusNode[widget.index + 1]);
                widget.editingControllers[widget.index + 1].selection =
                    TextSelection.collapsed(offset: 0);
              } else {
                FocusScope.of(context).requestFocus(widget.focusNode[0]);
                widget.editingControllers[0].selection =
                    TextSelection.collapsed(offset: 0);
              }
            },
            style: TextStyle(fontSize: 20.0, color: Colors.black),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                hintText: "0"),
          ),
        ),
      ),
    );
  }
}
