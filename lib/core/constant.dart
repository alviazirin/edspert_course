import 'dart:developer' as dev;

import 'package:edspert_course/core/appcolors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const colorPrimary = Color(0xFF357AD4);
const colorSecondary = Color(0xFF27B1E0);
const colorTitle = Color(0xFF14142B);
const colorBody = Color(0xFF4E4B66);
const colorLabel = Color(0xFF85868B);
const colorPlaceholder = Color(0xFFBFC0C2);
const colorLine = Color(0xFFE4E4E5);
const colorInputBackground = Color(0xFFF6F6F6);
const colorBackground = Color(0xFFF9F9F9);
const colorOffWhite = Color(0xFFFCFCFC);

Size sizeMedia(BuildContext context) => MediaQuery.sizeOf(context);

logThis(String message, {String? name, StackTrace? stackTrace}) {
  if (kDebugMode) {
    dev.log(message, name: name ?? "", stackTrace: stackTrace);
  }
}

customBoxDecoration({
  required BuildContext context,
  Color? color,
  double? borderCircularSize,
  BoxBorder? border,
  DecorationImage? backgroundImage,
}) {
  return BoxDecoration(
    color: color ?? AppColors.primary,
    borderRadius: BorderRadius.circular(borderCircularSize ?? 8),
    border: border,
    image: backgroundImage,
  );
}
