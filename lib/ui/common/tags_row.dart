import 'package:flutter/material.dart';
import 'package:gameslist/ui/common/tag.dart';

class TagsRow extends StatelessWidget {
  const TagsRow({super.key, required this.tags, this.textStyle});

  final List<String> tags;
  final TextStyle? textStyle;
  final double spacing = 8;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final tagTextStyle = textStyle ?? Theme.of(context).textTheme.labelMedium;
      var totalWidth = 0.0;
      return Row(
        children: tags.map((tag) {
          final tagWidth = _calculateTabWidth(tag, tagTextStyle!);
          final isOverflow = totalWidth + tagWidth > constraints.maxWidth;
          final showTag = !isOverflow;
          if (showTag) {
            totalWidth += tagWidth;
          }
          return showTag
              ? Padding(
                  padding: EdgeInsets.only(right: spacing),
                  child: Tag(
                    text: tag,
                    textStyle: tagTextStyle,
                  ),
                )
              : const SizedBox();
        }).toList(),
      );
    });
  }

  double _calculateTabWidth(String tag, TextStyle textStyle) {
    final textPainter = TextPainter(
      text: TextSpan(text: tag, style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.width + 16 + spacing * 2;
  }
}
