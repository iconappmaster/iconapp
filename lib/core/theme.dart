import 'dart:ui';
import 'package:flutter/material.dart';

// Colors Palette
const grape = Color(0xFF52296e);
const darkIndigo = Color(0xFF0a0d37);
const darkIndigo2 = Color(0xFF100a39);
const hotMagenta = Color(0xFFe901c7);
const richPurple = Color(0xFF540048);
const warmPurple = Color(0xFF8a347d);
const strongPink = Color(0xFFff0072);
const white = Color(0xFFffffff);
const whiteOpacity30 = Color(0x30ffffff);
const uiTintColorFill = Color(0xFF00aeaa);
const cornflower = Color(0xFF725dff);
const pastelRed = Color(0xFFf44343);
const plusBorder = Color(0xFF352158);
const darkBlueGrey = Color(0xFF251f4d);
const lightishRed = Color(0xFFf2414e);
const pinkRed = Color(0xFFe02554);
const avatarRing = Color(0xFF0F0A36);

// Font Sizes
const _fontRubikBold = "RubikBold";
const _fontRubikRegular = "RubikRagular";
const _fontRubikMedium = "RubikMedium";

// Font Colors
const purpleFont = Color(0xFF251f4d);

const flushbar = TextStyle(
    fontFamily: _fontRubikRegular,
    color: white,
    fontSize: 16.7,
    letterSpacing: 1.1);

const phoneNumber = TextStyle(
    fontFamily: _fontRubikRegular,
    color: white,
    fontSize: 26.7,
    letterSpacing: 1.33);

const button = TextStyle(
    fontFamily: _fontRubikBold,
    color: white,
    fontSize: 24.3,
    letterSpacing: 0.18);

const pinCode =
    TextStyle(fontFamily: _fontRubikRegular, color: white, fontSize: 26.7);

const nameWhite =
    TextStyle(fontFamily: _fontRubikBold, color: white, fontSize: 18);

const nameDark =
    TextStyle(fontFamily: _fontRubikMedium, color: purpleFont, fontSize: 18);

const loginBigText = TextStyle(
    fontFamily: _fontRubikBold, color: white, fontSize: 17.3, height: 1.3);

const fieldInput =
    TextStyle(fontFamily: _fontRubikRegular, color: white, fontSize: 17.3);

const status =
    TextStyle(fontFamily: _fontRubikRegular, color: purpleFont, fontSize: 15.3);

const lastWritten =
    TextStyle(fontFamily: _fontRubikRegular, color: white, fontSize: 15.3);

const genderIconText =
    TextStyle(fontFamily: _fontRubikRegular, color: white, fontSize: 14.0);

const smallLine =
    TextStyle(fontFamily: _fontRubikBold, color: white, fontSize: 13.3);

const fieldLabel =
    TextStyle(fontFamily: _fontRubikRegular, color: white, fontSize: 13.3);

const loginSmallText =
    TextStyle(fontFamily: _fontRubikRegular, color: white, fontSize: 12.7);

const newMessageNumber =
    TextStyle(fontFamily: _fontRubikRegular, color: white, fontSize: 11.2);

const timeOfMessage =
    TextStyle(fontFamily: _fontRubikRegular, color: white, fontSize: 11);

const myStory = TextStyle(
  fontFamily: _fontRubikRegular,
  color: whiteOpacity30,
  fontSize: 10.6,
);

const hint = TextStyle(
    fontFamily: _fontRubikRegular,
    color: darkBlueGrey,
    fontSize: 20,
    height: 1.1);

const createGroupTitle = TextStyle(
    fontFamily: _fontRubikBold, color: white, fontSize: 20, height: 1.1);

const categoryName = TextStyle(
    fontFamily: _fontRubikRegular,
    color: darkBlueGrey,
    fontSize: 18.3,
    height: 1);

const createCategoryTitle = TextStyle(
    fontFamily: _fontRubikMedium,
    color: white,
    fontSize: 18,
    );

// Gradients
final purpleGradient = LinearGradient(colors: [
  grape,
  darkIndigo,
], begin: Alignment.bottomRight, end: Alignment.topLeft);

final redPinkGradient = LinearGradient(colors: [
  lightishRed,
  pinkRed,
], begin: Alignment.bottomRight, end: Alignment.topLeft);
