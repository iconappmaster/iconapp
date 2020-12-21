// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateDetailsStore on _CreateDetailsStoreBase, Store {
  Computed<int> _$currentGroupTypeIndexComputed;

  @override
  int get currentGroupTypeIndex => (_$currentGroupTypeIndexComputed ??=
          Computed<int>(() => super.currentGroupTypeIndex,
              name: '_CreateDetailsStoreBase.currentGroupTypeIndex'))
      .value;
  Computed<String> _$getSelectedPhotoComputed;

  @override
  String get getSelectedPhoto => (_$getSelectedPhotoComputed ??=
          Computed<String>(() => super.getSelectedPhoto,
              name: '_CreateDetailsStoreBase.getSelectedPhoto'))
      .value;
  Computed<String> _$groupNameComputed;

  @override
  String get groupName =>
      (_$groupNameComputed ??= Computed<String>(() => super.groupName,
              name: '_CreateDetailsStoreBase.groupName'))
          .value;

  final _$_groupNameAtom = Atom(name: '_CreateDetailsStoreBase._groupName');

  @override
  String get _groupName {
    _$_groupNameAtom.reportRead();
    return super._groupName;
  }

  @override
  set _groupName(String value) {
    _$_groupNameAtom.reportWrite(value, super._groupName, () {
      super._groupName = value;
    });
  }

  final _$_selectedPhotoAtom =
      Atom(name: '_CreateDetailsStoreBase._selectedPhoto');

  @override
  String get _selectedPhoto {
    _$_selectedPhotoAtom.reportRead();
    return super._selectedPhoto;
  }

  @override
  set _selectedPhoto(String value) {
    _$_selectedPhotoAtom.reportWrite(value, super._selectedPhoto, () {
      super._selectedPhoto = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CreateDetailsStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_currentGroupTypeIndexAtom =
      Atom(name: '_CreateDetailsStoreBase._currentGroupTypeIndex');

  @override
  int get _currentGroupTypeIndex {
    _$_currentGroupTypeIndexAtom.reportRead();
    return super._currentGroupTypeIndex;
  }

  @override
  set _currentGroupTypeIndex(int value) {
    _$_currentGroupTypeIndexAtom
        .reportWrite(value, super._currentGroupTypeIndex, () {
      super._currentGroupTypeIndex = value;
    });
  }

  final _$selectGroupPhotoAsyncAction =
      AsyncAction('_CreateDetailsStoreBase.selectGroupPhoto');

  @override
  Future<dynamic> selectGroupPhoto() {
    return _$selectGroupPhotoAsyncAction.run(() => super.selectGroupPhoto());
  }

  final _$createGroupAsyncAction =
      AsyncAction('_CreateDetailsStoreBase.createGroup');

  @override
  Future<Either<CreateFailure, Unit>> createGroup() {
    return _$createGroupAsyncAction.run(() => super.createGroup());
  }

  final _$_CreateDetailsStoreBaseActionController =
      ActionController(name: '_CreateDetailsStoreBase');

  @override
  void updateGroupName(String name) {
    final _$actionInfo = _$_CreateDetailsStoreBaseActionController.startAction(
        name: '_CreateDetailsStoreBase.updateGroupName');
    try {
      return super.updateGroupName(name);
    } finally {
      _$_CreateDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGroupType(int index) {
    final _$actionInfo = _$_CreateDetailsStoreBaseActionController.startAction(
        name: '_CreateDetailsStoreBase.setGroupType');
    try {
      return super.setGroupType(index);
    } finally {
      _$_CreateDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_CreateDetailsStoreBaseActionController.startAction(
        name: '_CreateDetailsStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_CreateDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
currentGroupTypeIndex: ${currentGroupTypeIndex},
getSelectedPhoto: ${getSelectedPhoto},
groupName: ${groupName}
    ''';
  }
}
