// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavigationRouteTearOff {
  const _$NavigationRouteTearOff();

  NavigationRouteHome navigateToHome() {
    return const NavigationRouteHome();
  }

  NavigationRouteNewsDetail navigateToNewsDetail(INews news) {
    return NavigationRouteNewsDetail(
      news,
    );
  }
}

/// @nodoc
const $NavigationRoute = _$NavigationRouteTearOff();

/// @nodoc
mixin _$NavigationRoute {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigateToHome,
    required TResult Function(INews news) navigateToNewsDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationRouteHome value) navigateToHome,
    required TResult Function(NavigationRouteNewsDetail value)
        navigateToNewsDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationRouteCopyWith<$Res> {
  factory $NavigationRouteCopyWith(
          NavigationRoute value, $Res Function(NavigationRoute) then) =
      _$NavigationRouteCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationRouteCopyWithImpl<$Res>
    implements $NavigationRouteCopyWith<$Res> {
  _$NavigationRouteCopyWithImpl(this._value, this._then);

  final NavigationRoute _value;
  // ignore: unused_field
  final $Res Function(NavigationRoute) _then;
}

/// @nodoc
abstract class $NavigationRouteHomeCopyWith<$Res> {
  factory $NavigationRouteHomeCopyWith(
          NavigationRouteHome value, $Res Function(NavigationRouteHome) then) =
      _$NavigationRouteHomeCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationRouteHomeCopyWithImpl<$Res>
    extends _$NavigationRouteCopyWithImpl<$Res>
    implements $NavigationRouteHomeCopyWith<$Res> {
  _$NavigationRouteHomeCopyWithImpl(
      NavigationRouteHome _value, $Res Function(NavigationRouteHome) _then)
      : super(_value, (v) => _then(v as NavigationRouteHome));

  @override
  NavigationRouteHome get _value => super._value as NavigationRouteHome;
}

/// @nodoc

class _$NavigationRouteHome implements NavigationRouteHome {
  const _$NavigationRouteHome();

  @override
  String toString() {
    return 'NavigationRoute.navigateToHome()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NavigationRouteHome);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigateToHome,
    required TResult Function(INews news) navigateToNewsDetail,
  }) {
    return navigateToHome();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
  }) {
    return navigateToHome?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    required TResult orElse(),
  }) {
    if (navigateToHome != null) {
      return navigateToHome();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationRouteHome value) navigateToHome,
    required TResult Function(NavigationRouteNewsDetail value)
        navigateToNewsDetail,
  }) {
    return navigateToHome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
  }) {
    return navigateToHome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    required TResult orElse(),
  }) {
    if (navigateToHome != null) {
      return navigateToHome(this);
    }
    return orElse();
  }
}

abstract class NavigationRouteHome implements NavigationRoute {
  const factory NavigationRouteHome() = _$NavigationRouteHome;
}

/// @nodoc
abstract class $NavigationRouteNewsDetailCopyWith<$Res> {
  factory $NavigationRouteNewsDetailCopyWith(NavigationRouteNewsDetail value,
          $Res Function(NavigationRouteNewsDetail) then) =
      _$NavigationRouteNewsDetailCopyWithImpl<$Res>;
  $Res call({INews news});
}

/// @nodoc
class _$NavigationRouteNewsDetailCopyWithImpl<$Res>
    extends _$NavigationRouteCopyWithImpl<$Res>
    implements $NavigationRouteNewsDetailCopyWith<$Res> {
  _$NavigationRouteNewsDetailCopyWithImpl(NavigationRouteNewsDetail _value,
      $Res Function(NavigationRouteNewsDetail) _then)
      : super(_value, (v) => _then(v as NavigationRouteNewsDetail));

  @override
  NavigationRouteNewsDetail get _value =>
      super._value as NavigationRouteNewsDetail;

  @override
  $Res call({
    Object? news = freezed,
  }) {
    return _then(NavigationRouteNewsDetail(
      news == freezed
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as INews,
    ));
  }
}

/// @nodoc

class _$NavigationRouteNewsDetail implements NavigationRouteNewsDetail {
  const _$NavigationRouteNewsDetail(this.news);

  @override
  final INews news;

  @override
  String toString() {
    return 'NavigationRoute.navigateToNewsDetail(news: $news)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationRouteNewsDetail &&
            const DeepCollectionEquality().equals(other.news, news));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(news));

  @JsonKey(ignore: true)
  @override
  $NavigationRouteNewsDetailCopyWith<NavigationRouteNewsDetail> get copyWith =>
      _$NavigationRouteNewsDetailCopyWithImpl<NavigationRouteNewsDetail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigateToHome,
    required TResult Function(INews news) navigateToNewsDetail,
  }) {
    return navigateToNewsDetail(news);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
  }) {
    return navigateToNewsDetail?.call(news);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    required TResult orElse(),
  }) {
    if (navigateToNewsDetail != null) {
      return navigateToNewsDetail(news);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationRouteHome value) navigateToHome,
    required TResult Function(NavigationRouteNewsDetail value)
        navigateToNewsDetail,
  }) {
    return navigateToNewsDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
  }) {
    return navigateToNewsDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    required TResult orElse(),
  }) {
    if (navigateToNewsDetail != null) {
      return navigateToNewsDetail(this);
    }
    return orElse();
  }
}

abstract class NavigationRouteNewsDetail implements NavigationRoute {
  const factory NavigationRouteNewsDetail(INews news) =
      _$NavigationRouteNewsDetail;

  INews get news;
  @JsonKey(ignore: true)
  $NavigationRouteNewsDetailCopyWith<NavigationRouteNewsDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
