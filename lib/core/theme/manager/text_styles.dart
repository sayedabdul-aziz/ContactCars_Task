import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle displayLarge(BuildContext context,
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? Theme.of(context).textTheme.displayLarge!.fontSize,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  static TextStyle displayMedium(BuildContext context,
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? Theme.of(context).textTheme.displayMedium!.fontSize,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  static TextStyle displaySmall(BuildContext context,
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? Theme.of(context).textTheme.displaySmall!.fontSize,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  static TextStyle titleLarge(BuildContext context,
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? Theme.of(context).textTheme.titleLarge!.fontSize,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  static TextStyle titleMedium(BuildContext context,
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? Theme.of(context).textTheme.titleMedium!.fontSize,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  static TextStyle titleSmall(BuildContext context,
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? Theme.of(context).textTheme.titleSmall!.fontSize,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  static TextStyle bodyLarge(BuildContext context,
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? Theme.of(context).textTheme.bodyLarge!.fontSize,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle bodyMedium(BuildContext context,
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? Theme.of(context).textTheme.bodyMedium!.fontSize,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }

  static TextStyle bodySmall(BuildContext context,
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? Theme.of(context).textTheme.bodySmall!.fontSize,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }

  static TextStyle headLineSmall(BuildContext context,
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? Theme.of(context).textTheme.headlineSmall!.fontSize,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }
}
