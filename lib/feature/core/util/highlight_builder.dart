import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/theme_map.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown/markdown.dart' as md;

import '../../../export.dart';

final textStyle = GoogleFonts.ubuntuMono(
  backgroundColor: Colors.transparent,
  fontWeight: FontWeight.w400,
);

class HighlightBuilder extends MarkdownElementBuilder {
  HighlightBuilder();

  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    var language = 'python';
    final pattern = RegExp(r'^language-(.+)$');
    if (element.attributes['class'] != null &&
        pattern.hasMatch(element.attributes['class']!)) {
      language = pattern.firstMatch(element.attributes['class']!)?.group(1) ??
          'python';
    }

    return ClipRRect(
      borderRadius: 12.radius,
      child: HighlightView(
        element.textContent.trim(),
        language: language,
        theme: themeMap['dracula']!,
        padding: const EdgeInsets.all(8),
        textStyle: textStyle,
      ),
    );
  }
}
