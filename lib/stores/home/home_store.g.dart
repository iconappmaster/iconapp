// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<bool> _$showWelcomeDialogComputed;

  @override
  bool get showWelcomeDialog => (_$showWelcomeDialogComputed ??= Computed<bool>(
          () => super.showWelcomeDialog,
          name: '_HomeStoreBase.showWelcomeDialog'))
      .value;

  final _$_showWelcomeDialogAtom =
      Atom(name: '_HomeStoreBase._showWelcomeDialog');

  @override
  bool get _showWelcomeDialog {
    _$_showWelcomeDialogAtom.reportRead();
    return super._showWelcomeDialog;
  }

  @override
  set _showWelcomeDialog(bool value) {
    _$_showWelcomeDialogAtom.reportWrite(value, super._showWelcomeDialog, () {
      super._showWelcomeDialog = value;
    });
  }

  final _$hideWelcomeDialogAsyncAction =
      AsyncAction('_HomeStoreBase.hideWelcomeDialog');

  @override
  Future<dynamic> hideWelcomeDialog() {
    return _$hideWelcomeDialogAsyncAction.run(() => super.hideWelcomeDialog());
  }

  @override
  String toString() {
    return '''
showWelcomeDialog: ${showWelcomeDialog}
    ''';
  }
}
