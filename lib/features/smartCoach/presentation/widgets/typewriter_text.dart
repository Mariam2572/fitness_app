import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration characterDelay;

  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.characterDelay = const Duration(milliseconds: 20),
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayedText = '';
  bool _isAnimating = true;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void didUpdateWidget(TypewriterText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _displayedText = '';
      _currentIndex = 0;
      _isAnimating = true;
      _startAnimation();
    }
  }

  void _startAnimation() async {
    if (!mounted) return;

    final characters = widget.text.characters.toList();

    for (int i = 0; i < characters.length; i++) {
      if (!mounted || !_isAnimating) break;

      await Future.delayed(widget.characterDelay);

      if (!mounted || !_isAnimating) break;

      setState(() {
        _currentIndex = i + 1;
        _displayedText = characters.take(_currentIndex).join();
      });
    }

    if (mounted) {
      setState(() {
        _isAnimating = false;
      });
    }
  }

  void _skipAnimation() {
    if (_isAnimating) {
      setState(() {
        _isAnimating = false;
        _displayedText = widget.text;
        _currentIndex = widget.text.characters.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _skipAnimation,
      child: SelectableText.rich(
        _parseBoldAndBulletText(_displayedText, widget.style),
      ),
    );
  }

  TextSpan _parseBoldAndBulletText(String input, TextStyle? baseStyle) {
    final List<TextSpan> spans = [];

    // Handle bold formatting (**text**)
    final RegExp exp = RegExp(r'\*\*(.*?)\*\*');
    final matches = exp.allMatches(input);
    int lastMatchEnd = 0;

    for (final match in matches) {
      // Add text before the bold part
      if (match.start > lastMatchEnd) {
        spans.addAll(
          _processBulletPoints(
            input.substring(lastMatchEnd, match.start),
            baseStyle,
          ),
        );
      }

      // Add the bold text
      spans.add(
        TextSpan(
          text: match.group(1),
          style: (baseStyle ?? const TextStyle()).copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      );

      lastMatchEnd = match.end;
    }

    // Add remaining text after the last match
    if (lastMatchEnd < input.length) {
      spans.addAll(
        _processBulletPoints(input.substring(lastMatchEnd), baseStyle),
      );
    }

    return TextSpan(children: spans, style: baseStyle);
  }

  List<TextSpan> _processBulletPoints(String input, TextStyle? style) {
    final List<TextSpan> spans = [];

    input.split(' ').forEach((word) {
      if (word.startsWith('*') && !word.startsWith('**')) {
        // Replace single * with a bullet point
        spans.add(const TextSpan(text: '• '));
        spans.add(TextSpan(text: '${word.substring(1)} '));
      } else {
        spans.add(TextSpan(text: '$word '));
      }
    });

    return spans;
  }

  @override
  void dispose() {
    _isAnimating = false;
    super.dispose();
  }
}
