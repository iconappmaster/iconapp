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
  Computed<bool> _$showPriceButtonComputed;

  @override
  bool get showPriceButton =>
      (_$showPriceButtonComputed ??= Computed<bool>(() => super.showPriceButton,
              name: '_CreateDetailsStoreBase.showPriceButton'))
          .value;
  Computed<bool> _$showPriceComputed;

  @override
  bool get showPrice =>
      (_$showPriceComputed ??= Computed<bool>(() => super.showPrice,
              name: '_CreateDetailsStoreBase.showPrice'))
          .value;
  Computed<String> _$getSelectedPhotoComputed;

  @override
  String get getSelectedPhoto => (_$getSelectedPhotoComputed ??=
          Computed<String>(() => super.getSelectedPhoto,
              name: '_CreateDetailsStoreBase.getSelectedPhoto'))
      .value;
  Computed<String> _$getSwitchSelectionDescriptionComputed;

  @override
  String get getSwitchSelectionDescription =>
      (_$getSwitchSelectionDescriptionComputed ??= Computed<String>(
              () => super.getSwitchSelectionDescription,
              name: '_CreateDetailsStoreBase.getSwitchSelectionDescription'))
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

  final _$_showPriceAtom = Atom(name: '_CreateDetailsStoreBase._showPrice');

  @override
  bool get _showPrice {
    _$_showPriceAtom.reportRead();
    return super._showPrice;
  }

  @override
  set _showPrice(bool value) {
    _$_showPriceAtom.reportWrite(value, super._showPrice, () {
      super._showPrice = value;
    });
  }

  final _$conversationPriceAtom =
      Atom(name: '_CreateDetailsStoreBase.conversationPrice');

  @override
  int get conversationPrice {
    _$conversationPriceAtom.reportRead();
    return super.conversationPrice;
  }

  @override
  set conversationPrice(int value) {
    _$conversationPriceAtom.reportWrite(value, super.conversationPrice, () {
      super.conversationPrice = value;
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
  void setShowPrice(bool showPrice) {
    final _$actionInfo = _$_CreateDetailsStoreBaseActionController.startAction(
        name: '_CreateDetailsStoreBase.setShowPrice');
    try {
      return super.setShowPrice(showPrice);
    } finally {
      _$_CreateDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_CreateDetailsStoreBaseActionController.startAction(
        name: '_CreateDetailsStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_CreateDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
conversationPrice: ${conversationPrice},
isLoading: ${isLoading},
currentGroupTypeIndex: ${currentGroupTypeIndex},
showPriceButton: ${showPriceButton},
showPrice: ${showPrice},
getSelectedPhoto: ${getSelectedPhoto},
getSwitchSelectionDescription: ${getSwitchSelectionDescription},
groupName: ${groupName}
    ''';
  }
}
