import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/theme_map.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown/markdown.dart' as md;

import '../../../export.dart';

class HighlightBuilder extends MarkdownElementBuilder {
  HighlightBuilder();

  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final textStyle = GoogleFonts.ubuntuMono(
      backgroundColor: Colors.transparent,
      fontWeight: FontWeight.w400,
    );

    var language = 'java';
    final pattern = RegExp(r'^language-(.+)$');
    if (element.attributes['class'] != null &&
        pattern.hasMatch(element.attributes['class']!)) {
      language =
          pattern.firstMatch(element.attributes['class']!)!.group(1) ?? 'java';
    }

    bool isInline = element.attributes['class'] == null;

    if (isInline) {
      return Text(element.textContent);
    }

    return HighlightView(
      element.textContent.trim(),
      language: language,
      theme: themeMap['dracula']!,
      padding: isInline
          ? const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 6,
            )
          : const EdgeInsets.all(12),
      textStyle: textStyle,
    );
  }
}
