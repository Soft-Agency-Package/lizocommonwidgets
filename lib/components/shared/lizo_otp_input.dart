import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lizocommonwidgets/config/themes/colors.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';

class LizoOtpInput extends StatefulWidget {
  final int fieldCount;
  final void Function(String code) onCompleted;

  const LizoOtpInput({super.key, this.fieldCount = 4, required this.onCompleted});

  @override
  State<LizoOtpInput> createState() => _LizoOtpInputState();
}

class _LizoOtpInputState extends State<LizoOtpInput> {
  late final List<FocusNode> _focusNodes;
  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.fieldCount, (index) => FocusNode());
    _controllers = List.generate(
      widget.fieldCount,
      (index) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleInput(String value, int index) {
    if (value.isNotEmpty) {
      if (index < widget.fieldCount - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        if (_controllers.every((c) => c.text.isNotEmpty)) {
          final code = _controllers.map((c) => c.text).join();
          widget.onCompleted(code);
        }
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }
  }

  void _handleKey(KeyEvent event, int index) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
      _controllers[index - 1].clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20.0,
      children: List.generate(widget.fieldCount, (index) {
        return KeyboardListener(
          focusNode: FocusNode(),
          onKeyEvent: (event) => _handleKey(event, index),
          child: ValueListenableBuilder(
            valueListenable: _controllers[index],
            builder: (builder, value, _) {
              final isFilled = value.text.isNotEmpty;
              return Container(
                width: 60.0,
                height: 57.0,
                margin: EdgeInsets.symmetric(vertical: 25.0),
                decoration: BoxDecoration(
                  color: LizoColor.inputBgColor,
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(
                    color:
                        isFilled
                            ? LizoColor.sucess
                            : LizoColor.inputBorderColor,
                    width: 2.0,
                  ),
                ),
                child: TextFormField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  maxLength: 1,
                  cursorColor: LizoColor.sucess,
                  style: StyleOfApp.custom(
                    size: 14,
                    color: LizoColor.sucess, //Color(0xFF525252),
                    weight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: '',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: (value) => _handleInput(value, index),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
