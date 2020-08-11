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
const whiteOpacity30 = Color(0x70ffffff);
const whiteOpacity20 = Color(0x80ffffff);
const uiTintColorFill = Color(0xFF00aeaa);
const cornflower = Color(0xFF725dff);
const pastelRed = Color(0xFFf44343);
const plusBorder = Color(0xFF352158);
const darkBlueGrey = Color(0xFF251f4d);
const lightishRed = Color(0xFFf2414e);
const pinkRed = Color(0xFFe02554);
const avatarRing = Color(0xFF0F0A36);
const paleGrey = Color(0xFFf2f3f4);
const dusk = Color(0xFF545471);
const blueBerry = Color(0xFF5c4eaa);
const blueyGrey = Color(0xFF95a2c0);
const switchThumb = Color(0xFF97A2BD);
const deepRed = Color(0xFFbb0000);
const blueberry2 = Color(0xFF473f81);

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

const searchAppBarTitle = TextStyle(
  fontFamily: _fontRubikBold,
  color: white,
  fontSize: 21.3,
);

const chatSettings = TextStyle(
  fontFamily: _fontRubikRegular,
  color: darkIndigo,
  fontSize: 16.7,
);

const appSettingsTile = TextStyle(
  fontFamily: _fontRubikRegular,
  color: darkIndigo2,
  fontSize: 16.7,
);

const addParticipent = TextStyle(
  fontFamily: _fontRubikRegular,
  color: darkIndigo2,
  fontSize: 16.7,
);

const disconnectButton = TextStyle(
  fontFamily: _fontRubikBold,
  color: white,
  fontSize: 16.3,
);

const phoneNumber = TextStyle(
    fontFamily: _fontRubikRegular,
    color: white,
    fontSize: 20.7,
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

const searchResultTile =
    TextStyle(fontFamily: _fontRubikMedium, color: darkBlueGrey, fontSize: 18);

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

const myStoryCreate = TextStyle(
  fontFamily: _fontRubikBold,
  color: whiteOpacity20,
  fontSize: 10.6,
);

const settingsAppbarTitle = TextStyle(
  fontFamily: _fontRubikBold,
  color: white,
  fontSize: 22.3,
);

const settingsButton = TextStyle(
  fontFamily: _fontRubikRegular,
  color: cornflower,
  fontSize: 10.8,
  letterSpacing: .08,
);

const chatCompose =
    TextStyle(fontFamily: _fontRubikRegular, color: dusk, fontSize: 15.9);

const chatMessageBody = TextStyle(
  fontFamily: _fontRubikRegular,
  color: white,
  fontSize: 14.7,
  height: 1.3,
);
const chatMessageName = TextStyle(
  fontFamily: _fontRubikBold,
  color: white,
  fontSize: 16.7,
  height: 1.3,
);

const hint = TextStyle(
    fontFamily: _fontRubikRegular,
    color: darkBlueGrey,
    fontSize: 20,
    height: 1.1);

const emptyState = TextStyle(
  fontFamily: _fontRubikRegular,
  color: darkIndigo2,
  fontSize: 20,
);

const createGroupTitle = TextStyle(
    fontFamily: _fontRubikBold, color: white, fontSize: 20, height: 1.1);

const categoryName = TextStyle(
    fontFamily: _fontRubikBold, color: darkBlueGrey, fontSize: 18.3, height: 1);

const createCategoryTitle = TextStyle(
  fontFamily: _fontRubikMedium,
  color: white,
  fontSize: 18,
);

const dialogTitle = TextStyle(
  fontFamily: _fontRubikBold,
  color: white,
  fontSize: 18,
);

const dialogContent = TextStyle(
  fontFamily: _fontRubikRegular,
  color: white,
  fontSize: 14.7,
);

const personalDetailsHint = TextStyle(
    fontFamily: _fontRubikMedium,
    color: blueBerry,
    fontSize: 17.3,
    height: 1.3);

const changeColorTitle = TextStyle(
    fontFamily: _fontRubikBold, color: avatarRing, fontSize: 17.3, height: 1.3);

const drawerName = TextStyle(
  fontFamily: _fontRubikRegular,
  color: white,
  fontSize: 17.7,
  height: 1.0,
);

// Gradients

// gradient colors

final purpleGradient = LinearGradient(colors: [
  grape,
  darkIndigo,
], begin: Alignment.bottomRight, end: Alignment.topLeft);

final redPinkGradient = LinearGradient(colors: [
  lightishRed,
  pinkRed,
], begin: Alignment.bottomRight, end: Alignment.topLeft);

final dialogGradient = LinearGradient(colors: [
  darkBlueGrey,
  darkIndigo,
], begin: Alignment.bottomRight, end: Alignment.topLeft);

// CHAT COLORS GRADIENTS

const pinkish = Color(0xFFe35c67);
const purpleBlue = Color(0xFF381ce2);
const cobaltBlue = Color(0xFF002092);
const topaz = Color(0xFF1ab9c8);
const pinkRedTwo = Color(0xFFff0467);
const dustyOrange = Color(0xFFfc7437);
const darkishBlue = Color(0xFF004b91);
const apple = Color(0xFF78cc37);
const softBlue = Color(0xFF5f86ec);
const purply = Color(0xFF7c4cb0);
const lightMustard = Color(0xFFfecf60);
const lighterPurple = Color(0xFF974ef6);

final grapeDarkIndigo = LinearGradient(colors: [
  grape,
  darkIndigo,
], begin: Alignment.bottomRight, end: Alignment.topLeft);

final coblatBlueTopaz = LinearGradient(colors: [
  cobaltBlue,
  topaz,
], begin: Alignment.bottomRight, end: Alignment.topLeft);

final pinkRedDustyOrange = LinearGradient(colors: [
  pinkRedTwo,
  dustyOrange,
], begin: Alignment.bottomRight, end: Alignment.topLeft);

final darkishBlueApple = LinearGradient(colors: [
  darkishBlue,
  apple,
], begin: Alignment.bottomRight, end: Alignment.topLeft);

final softBluePurply = LinearGradient(colors: [
  softBlue,
  purply,
], begin: Alignment.bottomRight, end: Alignment.topLeft);

final mustardPurple = LinearGradient(colors: [
  lightMustard,
  lighterPurple,
], begin: Alignment.bottomRight, end: Alignment.topLeft);

final storyGradient = LinearGradient(
    colors: [pinkish, pinkRedTwo],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft);

final whiteGradient = LinearGradient(colors: [
  white,
  white,
], begin: Alignment.bottomRight, end: Alignment.topLeft);
