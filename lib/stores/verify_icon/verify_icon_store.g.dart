// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_icon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VerifyIconStore on _VerifyIconStoreBase, Store {
  Computed<bool> _$canNavigateToSendCodeComputed;

  @override
  bool get canNavigateToSendCode => (_$canNavigateToSendCodeComputed ??=
          Computed<bool>(() => super.canNavigateToSendCode,
              name: '_VerifyIconStoreBase.canNavigateToSendCode'))
      .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_VerifyIconStoreBase.loading'))
      .value;

  final _$_loadingAtom = Atom(name: '_VerifyIconStoreBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$agreedRulesAtom = Atom(name: '_VerifyIconStoreBase.agreedRules');

  @override
  bool get agreedRules {
    _$agreedRulesAtom.reportRead();
    return super.agreedRules;
  }

  @override
  set agreedRules(bool value) {
    _$agreedRulesAtom.reportWrite(value, super.agreedRules, () {
      super.agreedRules = value;
    });
  }

  final _$agreedTermsAtom = Atom(name: '_VerifyIconStoreBase.agreedTerms');

  @override
  bool get agreedTerms {
    _$agreedTermsAtom.reportRead();
    return super.agreedTerms;
  }

  @override
  set agreedTerms(bool value) {
    _$agreedTermsAtom.reportWrite(value, super.agreedTerms, () {
      super.agreedTerms = value;
    });
  }

  final _$emailAtom = Atom(name: '_VerifyIconStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$requestVerificationCodeAsyncAction =
      AsyncAction('_VerifyIconStoreBase.requestVerificationCode');

  @override
  Future<bool> requestVerificationCode() {
    return _$requestVerificationCodeAsyncAction
        .run(() => super.requestVerificationCode());
  }

  @override
  String toString() {
    return '''
agreedRules: ${agreedRules},
agreedTerms: ${agreedTerms},
email: ${email},
canNavigateToSendCode: ${canNavigateToSendCode},
loading: ${loading}
    ''';
  }
}
