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

  NavigationRouteCategoryNews navigateToCategoryNews(
      List<INews> news, String title) {
    return NavigationRouteCategoryNews(
      news,
      title,
    );
  }

  NavigationRouteCurrencyItemDetail navigateToCurrencyItemDetail(
      CurrencyInfo info, Currency currency) {
    return NavigationRouteCurrencyItemDetail(
      info,
      currency,
    );
  }

  NavigationRouteParityItemDetail navigateToParityItemDetail(
      ParityInfo info, Parity parity) {
    return NavigationRouteParityItemDetail(
      info,
      parity,
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
    required TResult Function(List<INews> news, String title)
        navigateToCategoryNews,
    required TResult Function(CurrencyInfo info, Currency currency)
        navigateToCurrencyItemDetail,
    required TResult Function(ParityInfo info, Parity parity)
        navigateToParityItemDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    TResult Function(List<INews> news, String title)? navigateToCategoryNews,
    TResult Function(CurrencyInfo info, Currency currency)?
        navigateToCurrencyItemDetail,
    TResult Function(ParityInfo info, Parity parity)?
        navigateToParityItemDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    TResult Function(List<INews> news, String title)? navigateToCategoryNews,
    TResult Function(CurrencyInfo info, Currency currency)?
        navigateToCurrencyItemDetail,
    TResult Function(ParityInfo info, Parity parity)?
        navigateToParityItemDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationRouteHome value) navigateToHome,
    required TResult Function(NavigationRouteNewsDetail value)
        navigateToNewsDetail,
    required TResult Function(NavigationRouteCategoryNews value)
        navigateToCategoryNews,
    required TResult Function(NavigationRouteCurrencyItemDetail value)
        navigateToCurrencyItemDetail,
    required TResult Function(NavigationRouteParityItemDetail value)
        navigateToParityItemDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    TResult Function(NavigationRouteCategoryNews value)? navigateToCategoryNews,
    TResult Function(NavigationRouteCurrencyItemDetail value)?
        navigateToCurrencyItemDetail,
    TResult Function(NavigationRouteParityItemDetail value)?
        navigateToParityItemDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    TResult Function(NavigationRouteCategoryNews value)? navigateToCategoryNews,
    TResult Function(NavigationRouteCurrencyItemDetail value)?
        navigateToCurrencyItemDetail,
    TResult Function(NavigationRouteParityItemDetail value)?
        navigateToParityItemDetail,
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
    required TResult Function(List<INews> news, String title)
        navigateToCategoryNews,
    required TResult Function(CurrencyInfo info, Currency currency)
        navigateToCurrencyItemDetail,
    required TResult Function(ParityInfo info, Parity parity)
        navigateToParityItemDetail,
  }) {
    return navigateToHome();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    TResult Function(List<INews> news, String title)? navigateToCategoryNews,
    TResult Function(CurrencyInfo info, Currency currency)?
        navigateToCurrencyItemDetail,
    TResult Function(ParityInfo info, Parity parity)?
        navigateToParityItemDetail,
  }) {
    return navigateToHome?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    TResult Function(List<INews> news, String title)? navigateToCategoryNews,
    TResult Function(CurrencyInfo info, Currency currency)?
        navigateToCurrencyItemDetail,
    TResult Function(ParityInfo info, Parity parity)?
        navigateToParityItemDetail,
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
    required TResult Function(NavigationRouteCategoryNews value)
        navigateToCategoryNews,
    required TResult Function(NavigationRouteCurrencyItemDetail value)
        navigateToCurrencyItemDetail,
    required TResult Function(NavigationRouteParityItemDetail value)
        navigateToParityItemDetail,
  }) {
    return navigateToHome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    TResult Function(NavigationRouteCategoryNews value)? navigateToCategoryNews,
    TResult Function(NavigationRouteCurrencyItemDetail value)?
        navigateToCurrencyItemDetail,
    TResult Function(NavigationRouteParityItemDetail value)?
        navigateToParityItemDetail,
  }) {
    return navigateToHome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    TResult Function(NavigationRouteCategoryNews value)? navigateToCategoryNews,
    TResult Function(NavigationRouteCurrencyItemDetail value)?
        navigateToCurrencyItemDetail,
    TResult Function(NavigationRouteParityItemDetail value)?
        navigateToParityItemDetail,
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
    required TResult Function(List<INews> news, String title)
        navigateToCategoryNews,
    required TResult Function(CurrencyInfo info, Currency currency)
        navigateToCurrencyItemDetail,
    required TResult Function(ParityInfo info, Parity parity)
        navigateToParityItemDetail,
  }) {
    return navigateToNewsDetail(news);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    TResult Function(List<INews> news, String title)? navigateToCategoryNews,
    TResult Function(CurrencyInfo info, Currency currency)?
        navigateToCurrencyItemDetail,
    TResult Function(ParityInfo info, Parity parity)?
        navigateToParityItemDetail,
  }) {
    return navigateToNewsDetail?.call(news);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    TResult Function(List<INews> news, String title)? navigateToCategoryNews,
    TResult Function(CurrencyInfo info, Currency currency)?
        navigateToCurrencyItemDetail,
    TResult Function(ParityInfo info, Parity parity)?
        navigateToParityItemDetail,
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
    required TResult Function(NavigationRouteCategoryNews value)
        navigateToCategoryNews,
    required TResult Function(NavigationRouteCurrencyItemDetail value)
        navigateToCurrencyItemDetail,
    required TResult Function(NavigationRouteParityItemDetail value)
        navigateToParityItemDetail,
  }) {
    return navigateToNewsDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    TResult Function(NavigationRouteCategoryNews value)? navigateToCategoryNews,
    TResult Function(NavigationRouteCurrencyItemDetail value)?
        navigateToCurrencyItemDetail,
    TResult Function(NavigationRouteParityItemDetail value)?
        navigateToParityItemDetail,
  }) {
    return navigateToNewsDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    TResult Function(NavigationRouteCategoryNews value)? navigateToCategoryNews,
    TResult Function(NavigationRouteCurrencyItemDetail value)?
        navigateToCurrencyItemDetail,
    TResult Function(NavigationRouteParityItemDetail value)?
        navigateToParityItemDetail,
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

/// @nodoc
abstract class $NavigationRouteCategoryNewsCopyWith<$Res> {
  factory $NavigationRouteCategoryNewsCopyWith(
          NavigationRouteCategoryNews value,
          $Res Function(NavigationRouteCategoryNews) then) =
      _$NavigationRouteCategoryNewsCopyWithImpl<$Res>;
  $Res call({List<INews> news, String title});
}

/// @nodoc
class _$NavigationRouteCategoryNewsCopyWithImpl<$Res>
    extends _$NavigationRouteCopyWithImpl<$Res>
    implements $NavigationRouteCategoryNewsCopyWith<$Res> {
  _$NavigationRouteCategoryNewsCopyWithImpl(NavigationRouteCategoryNews _value,
      $Res Function(NavigationRouteCategoryNews) _then)
      : super(_value, (v) => _then(v as NavigationRouteCategoryNews));

  @override
  NavigationRouteCategoryNews get _value =>
      super._value as NavigationRouteCategoryNews;

  @override
  $Res call({
    Object? news = freezed,
    Object? title = freezed,
  }) {
    return _then(NavigationRouteCategoryNews(
      news == freezed
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<INews>,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NavigationRouteCategoryNews implements NavigationRouteCategoryNews {
  const _$NavigationRouteCategoryNews(this.news, this.title);

  @override
  final List<INews> news;
  @override
  final String title;

  @override
  String toString() {
    return 'NavigationRoute.navigateToCategoryNews(news: $news, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationRouteCategoryNews &&
            const DeepCollectionEquality().equals(other.news, news) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(news),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  $NavigationRouteCategoryNewsCopyWith<NavigationRouteCategoryNews>
      get copyWith => _$NavigationRouteCategoryNewsCopyWithImpl<
          NavigationRouteCategoryNews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigateToHome,
    required TResult Function(INews news) navigateToNewsDetail,
    required TResult Function(List<INews> news, String title)
        navigateToCategoryNews,
    required TResult Function(CurrencyInfo info, Currency currency)
        navigateToCurrencyItemDetail,
    required TResult Function(ParityInfo info, Parity parity)
        navigateToParityItemDetail,
  }) {
    return navigateToCategoryNews(news, title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    TResult Function(List<INews> news, String title)? navigateToCategoryNews,
    TResult Function(CurrencyInfo info, Currency currency)?
        navigateToCurrencyItemDetail,
    TResult Function(ParityInfo info, Parity parity)?
        navigateToParityItemDetail,
  }) {
    return navigateToCategoryNews?.call(news, title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    TResult Function(List<INews> news, String title)? navigateToCategoryNews,
    TResult Function(CurrencyInfo info, Currency currency)?
        navigateToCurrencyItemDetail,
    TResult Function(ParityInfo info, Parity parity)?
        navigateToParityItemDetail,
    required TResult orElse(),
  }) {
    if (navigateToCategoryNews != null) {
      return navigateToCategoryNews(news, title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationRouteHome value) navigateToHome,
    required TResult Function(NavigationRouteNewsDetail value)
        navigateToNewsDetail,
    required TResult Function(NavigationRouteCategoryNews value)
        navigateToCategoryNews,
    required TResult Function(NavigationRouteCurrencyItemDetail value)
        navigateToCurrencyItemDetail,
    required TResult Function(NavigationRouteParityItemDetail value)
        navigateToParityItemDetail,
  }) {
    return navigateToCategoryNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    TResult Function(NavigationRouteCategoryNews value)? navigateToCategoryNews,
    TResult Function(NavigationRouteCurrencyItemDetail value)?
        navigateToCurrencyItemDetail,
    TResult Function(NavigationRouteParityItemDetail value)?
        navigateToParityItemDetail,
  }) {
    return navigateToCategoryNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    TResult Function(NavigationRouteCategoryNews value)? navigateToCategoryNews,
    TResult Function(NavigationRouteCurrencyItemDetail value)?
        navigateToCurrencyItemDetail,
    TResult Function(NavigationRouteParityItemDetail value)?
        navigateToParityItemDetail,
    required TResult orElse(),
  }) {
    if (navigateToCategoryNews != null) {
      return navigateToCategoryNews(this);
    }
    return orElse();
  }
}

abstract class NavigationRouteCategoryNews implements NavigationRoute {
  const factory NavigationRouteCategoryNews(List<INews> news, String title) =
      _$NavigationRouteCategoryNews;

  List<INews> get news;
  String get title;
  @JsonKey(ignore: true)
  $NavigationRouteCategoryNewsCopyWith<NavigationRouteCategoryNews>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationRouteCurrencyItemDetailCopyWith<$Res> {
  factory $NavigationRouteCurrencyItemDetailCopyWith(
          NavigationRouteCurrencyItemDetail value,
          $Res Function(NavigationRouteCurrencyItemDetail) then) =
      _$NavigationRouteCurrencyItemDetailCopyWithImpl<$Res>;
  $Res call({CurrencyInfo info, Currency currency});
}

/// @nodoc
class _$NavigationRouteCurrencyItemDetailCopyWithImpl<$Res>
    extends _$NavigationRouteCopyWithImpl<$Res>
    implements $NavigationRouteCurrencyItemDetailCopyWith<$Res> {
  _$NavigationRouteCurrencyItemDetailCopyWithImpl(
      NavigationRouteCurrencyItemDetail _value,
      $Res Function(NavigationRouteCurrencyItemDetail) _then)
      : super(_value, (v) => _then(v as NavigationRouteCurrencyItemDetail));

  @override
  NavigationRouteCurrencyItemDetail get _value =>
      super._value as NavigationRouteCurrencyItemDetail;

  @override
  $Res call({
    Object? info = freezed,
    Object? currency = freezed,
  }) {
    return _then(NavigationRouteCurrencyItemDetail(
      info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as CurrencyInfo,
      currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ));
  }
}

/// @nodoc

class _$NavigationRouteCurrencyItemDetail
    implements NavigationRouteCurrencyItemDetail {
  const _$NavigationRouteCurrencyItemDetail(this.info, this.currency);

  @override
  final CurrencyInfo info;
  @override
  final Currency currency;

  @override
  String toString() {
    return 'NavigationRoute.navigateToCurrencyItemDetail(info: $info, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationRouteCurrencyItemDetail &&
            const DeepCollectionEquality().equals(other.info, info) &&
            const DeepCollectionEquality().equals(other.currency, currency));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(info),
      const DeepCollectionEquality().hash(currency));

  @JsonKey(ignore: true)
  @override
  $NavigationRouteCurrencyItemDetailCopyWith<NavigationRouteCurrencyItemDetail>
      get copyWith => _$NavigationRouteCurrencyItemDetailCopyWithImpl<
          NavigationRouteCurrencyItemDetail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigateToHome,
    required TResult Function(INews news) navigateToNewsDetail,
    required TResult Function(List<INews> news, String title)
        navigateToCategoryNews,
    required TResult Function(CurrencyInfo info, Currency currency)
        navigateToCurrencyItemDetail,
    required TResult Function(ParityInfo info, Parity parity)
        navigateToParityItemDetail,
  }) {
    return navigateToCurrencyItemDetail(info, currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    TResult Function(List<INews> news, String title)? navigateToCategoryNews,
    TResult Function(CurrencyInfo info, Currency currency)?
        navigateToCurrencyItemDetail,
    TResult Function(ParityInfo info, Parity parity)?
        navigateToParityItemDetail,
  }) {
    return navigateToCurrencyItemDetail?.call(info, currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    TResult Function(List<INews> news, String title)? navigateToCategoryNews,
    TResult Function(CurrencyInfo info, Currency currency)?
        navigateToCurrencyItemDetail,
    TResult Function(ParityInfo info, Parity parity)?
        navigateToParityItemDetail,
    required TResult orElse(),
  }) {
    if (navigateToCurrencyItemDetail != null) {
      return navigateToCurrencyItemDetail(info, currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationRouteHome value) navigateToHome,
    required TResult Function(NavigationRouteNewsDetail value)
        navigateToNewsDetail,
    required TResult Function(NavigationRouteCategoryNews value)
        navigateToCategoryNews,
    required TResult Function(NavigationRouteCurrencyItemDetail value)
        navigateToCurrencyItemDetail,
    required TResult Function(NavigationRouteParityItemDetail value)
        navigateToParityItemDetail,
  }) {
    return navigateToCurrencyItemDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    TResult Function(NavigationRouteCategoryNews value)? navigateToCategoryNews,
    TResult Function(NavigationRouteCurrencyItemDetail value)?
        navigateToCurrencyItemDetail,
    TResult Function(NavigationRouteParityItemDetail value)?
        navigateToParityItemDetail,
  }) {
    return navigateToCurrencyItemDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    TResult Function(NavigationRouteCategoryNews value)? navigateToCategoryNews,
    TResult Function(NavigationRouteCurrencyItemDetail value)?
        navigateToCurrencyItemDetail,
    TResult Function(NavigationRouteParityItemDetail value)?
        navigateToParityItemDetail,
    required TResult orElse(),
  }) {
    if (navigateToCurrencyItemDetail != null) {
      return navigateToCurrencyItemDetail(this);
    }
    return orElse();
  }
}

abstract class NavigationRouteCurrencyItemDetail implements NavigationRoute {
  const factory NavigationRouteCurrencyItemDetail(
          CurrencyInfo info, Currency currency) =
      _$NavigationRouteCurrencyItemDetail;

  CurrencyInfo get info;
  Currency get currency;
  @JsonKey(ignore: true)
  $NavigationRouteCurrencyItemDetailCopyWith<NavigationRouteCurrencyItemDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationRouteParityItemDetailCopyWith<$Res> {
  factory $NavigationRouteParityItemDetailCopyWith(
          NavigationRouteParityItemDetail value,
          $Res Function(NavigationRouteParityItemDetail) then) =
      _$NavigationRouteParityItemDetailCopyWithImpl<$Res>;
  $Res call({ParityInfo info, Parity parity});
}

/// @nodoc
class _$NavigationRouteParityItemDetailCopyWithImpl<$Res>
    extends _$NavigationRouteCopyWithImpl<$Res>
    implements $NavigationRouteParityItemDetailCopyWith<$Res> {
  _$NavigationRouteParityItemDetailCopyWithImpl(
      NavigationRouteParityItemDetail _value,
      $Res Function(NavigationRouteParityItemDetail) _then)
      : super(_value, (v) => _then(v as NavigationRouteParityItemDetail));

  @override
  NavigationRouteParityItemDetail get _value =>
      super._value as NavigationRouteParityItemDetail;

  @override
  $Res call({
    Object? info = freezed,
    Object? parity = freezed,
  }) {
    return _then(NavigationRouteParityItemDetail(
      info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ParityInfo,
      parity == freezed
          ? _value.parity
          : parity // ignore: cast_nullable_to_non_nullable
              as Parity,
    ));
  }
}

/// @nodoc

class _$NavigationRouteParityItemDetail
    implements NavigationRouteParityItemDetail {
  const _$NavigationRouteParityItemDetail(this.info, this.parity);

  @override
  final ParityInfo info;
  @override
  final Parity parity;

  @override
  String toString() {
    return 'NavigationRoute.navigateToParityItemDetail(info: $info, parity: $parity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationRouteParityItemDetail &&
            const DeepCollectionEquality().equals(other.info, info) &&
            const DeepCollectionEquality().equals(other.parity, parity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(info),
      const DeepCollectionEquality().hash(parity));

  @JsonKey(ignore: true)
  @override
  $NavigationRouteParityItemDetailCopyWith<NavigationRouteParityItemDetail>
      get copyWith => _$NavigationRouteParityItemDetailCopyWithImpl<
          NavigationRouteParityItemDetail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navigateToHome,
    required TResult Function(INews news) navigateToNewsDetail,
    required TResult Function(List<INews> news, String title)
        navigateToCategoryNews,
    required TResult Function(CurrencyInfo info, Currency currency)
        navigateToCurrencyItemDetail,
    required TResult Function(ParityInfo info, Parity parity)
        navigateToParityItemDetail,
  }) {
    return navigateToParityItemDetail(info, parity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    TResult Function(List<INews> news, String title)? navigateToCategoryNews,
    TResult Function(CurrencyInfo info, Currency currency)?
        navigateToCurrencyItemDetail,
    TResult Function(ParityInfo info, Parity parity)?
        navigateToParityItemDetail,
  }) {
    return navigateToParityItemDetail?.call(info, parity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navigateToHome,
    TResult Function(INews news)? navigateToNewsDetail,
    TResult Function(List<INews> news, String title)? navigateToCategoryNews,
    TResult Function(CurrencyInfo info, Currency currency)?
        navigateToCurrencyItemDetail,
    TResult Function(ParityInfo info, Parity parity)?
        navigateToParityItemDetail,
    required TResult orElse(),
  }) {
    if (navigateToParityItemDetail != null) {
      return navigateToParityItemDetail(info, parity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationRouteHome value) navigateToHome,
    required TResult Function(NavigationRouteNewsDetail value)
        navigateToNewsDetail,
    required TResult Function(NavigationRouteCategoryNews value)
        navigateToCategoryNews,
    required TResult Function(NavigationRouteCurrencyItemDetail value)
        navigateToCurrencyItemDetail,
    required TResult Function(NavigationRouteParityItemDetail value)
        navigateToParityItemDetail,
  }) {
    return navigateToParityItemDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    TResult Function(NavigationRouteCategoryNews value)? navigateToCategoryNews,
    TResult Function(NavigationRouteCurrencyItemDetail value)?
        navigateToCurrencyItemDetail,
    TResult Function(NavigationRouteParityItemDetail value)?
        navigateToParityItemDetail,
  }) {
    return navigateToParityItemDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationRouteHome value)? navigateToHome,
    TResult Function(NavigationRouteNewsDetail value)? navigateToNewsDetail,
    TResult Function(NavigationRouteCategoryNews value)? navigateToCategoryNews,
    TResult Function(NavigationRouteCurrencyItemDetail value)?
        navigateToCurrencyItemDetail,
    TResult Function(NavigationRouteParityItemDetail value)?
        navigateToParityItemDetail,
    required TResult orElse(),
  }) {
    if (navigateToParityItemDetail != null) {
      return navigateToParityItemDetail(this);
    }
    return orElse();
  }
}

abstract class NavigationRouteParityItemDetail implements NavigationRoute {
  const factory NavigationRouteParityItemDetail(
      ParityInfo info, Parity parity) = _$NavigationRouteParityItemDetail;

  ParityInfo get info;
  Parity get parity;
  @JsonKey(ignore: true)
  $NavigationRouteParityItemDetailCopyWith<NavigationRouteParityItemDetail>
      get copyWith => throw _privateConstructorUsedError;
}
