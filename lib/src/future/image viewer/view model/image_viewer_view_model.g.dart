// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_viewer_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageViewerViewModel on _ImageViewerViewModelBase, Store {
  late final _$isLoadingAtom = Atom(
    name: '_ImageViewerViewModelBase.isLoading',
    context: context,
  );

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

  late final _$listAllImagesAsyncAction = AsyncAction(
    '_ImageViewerViewModelBase.listAllImages',
    context: context,
  );

  @override
  Future<ImageViewerResponse?> listAllImages() {
    return _$listAllImagesAsyncAction.run(() => super.listAllImages());
  }

  late final _$_ImageViewerViewModelBaseActionController = ActionController(
    name: '_ImageViewerViewModelBase',
    context: context,
  );

  @override
  void changeLoading() {
    final _$actionInfo = _$_ImageViewerViewModelBaseActionController
        .startAction(name: '_ImageViewerViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ImageViewerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
