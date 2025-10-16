import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        MainAxisAlignment,
        MainAxisSize,
        Padding,
        RoundSliderThumbShape,
        RoundedRectSliderTrackShape,
        Row,
        SizedBox,
        Slider,
        SliderTheme,
        SliderThemeData,
        State,
        StatefulWidget,
        Widget,
        Colors;

import 'text.dart' show CreateText;

class CreateSlider extends StatefulWidget {
  final String label;
  final double initialValue;
  final double minValue;
  final double maxValue;

  const CreateSlider({
    super.key,
    required this.label,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
  });

  @override
  State<CreateSlider> createState() => CreateSliderState();
}

class CreateSliderState extends State<CreateSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  String _formatValue(double value) {
    return value.toInt().toString();
  }

  int getValue() {
    return _currentValue.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CreateText(text: widget.label, fontSize: 14),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: CreateText(
                  text: _formatValue(_currentValue),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Slider
          SliderTheme(
            data: SliderThemeData(
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              trackHeight: 6,
              trackShape: const RoundedRectSliderTrackShape(),
            ),
            child: Slider(
              value: _currentValue,
              min: widget.minValue,
              max: widget.maxValue,
              onChanged: (value) {
                setState(() {
                  _currentValue = value;
                });
              },
            ),
          ),

          // Labels min and max
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CreateText(text: _formatValue(widget.minValue), fontSize: 12),
                CreateText(text: _formatValue(widget.maxValue), fontSize: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
