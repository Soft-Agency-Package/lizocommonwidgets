/// A class representing a toggleable option with a widget and a value.
///
/// [T] is the type of the value associated with the option.
/// 
/// Each [ToggleOption] contains a [widget] to display and a [value] to be used
/// when the option is selected.

/// A custom multi-toggle widget that allows selecting from a list of options.
///
/// This widget supports both horizontal and vertical layouts and allows
/// customization of axis direction, alignment, and option selection.
///
/// [T] is the type of the values associated with the toggle options.
///
/// Parameters:
/// - [selectedValue]: The currently selected value
/// - [options]: A list of [ToggleOption] to display
/// - [direction]: The axis (horizontal or vertical) in which options are laid out
/// - [onOptionChanged]: A callback function triggered when an option is selected
/// - [mainAxisAlignment]: Optional alignment along the main axis
/// - [crossAxisAlignment]: Optional alignment along the cross axis

import 'package:flutter/widgets.dart';

class ToggleOption<T> {
  final Widget widget;
  final T value;

  ToggleOption({required this.widget, required this.value});
}

class CustomMultiToggleOptions<T> extends StatelessWidget {
  final T selectedValue;
  final Axis direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final List<ToggleOption<T>> options;
  final Function(T value) onOptionChanged;

  const CustomMultiToggleOptions({
    super.key,
    required this.selectedValue,
    required this.options,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    required this.direction,
    required this.onOptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return direction == Axis.horizontal
        ? Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: List.generate(
            options.length,
            (index) => GestureDetector(
              onTap: () => onOptionChanged(options[index].value),
              child: options[index].widget,
            ),
          ),
        )
        : Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: List.generate(
            options.length,
            (index) => GestureDetector(
              onTap: () => onOptionChanged(options[index].value),
              child: options[index].widget,
            ),
          ),
        );
  }
}
