// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Downloads {

@JsonKey(name: 'poster_path') String? get posterPath;
/// Create a copy of Downloads
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadsCopyWith<Downloads> get copyWith => _$DownloadsCopyWithImpl<Downloads>(this as Downloads, _$identity);

  /// Serializes this Downloads to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Downloads&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,posterPath);

@override
String toString() {
  return 'Downloads(posterPath: $posterPath)';
}


}

/// @nodoc
abstract mixin class $DownloadsCopyWith<$Res>  {
  factory $DownloadsCopyWith(Downloads value, $Res Function(Downloads) _then) = _$DownloadsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'poster_path') String? posterPath
});




}
/// @nodoc
class _$DownloadsCopyWithImpl<$Res>
    implements $DownloadsCopyWith<$Res> {
  _$DownloadsCopyWithImpl(this._self, this._then);

  final Downloads _self;
  final $Res Function(Downloads) _then;

/// Create a copy of Downloads
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posterPath = freezed,}) {
  return _then(_self.copyWith(
posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Downloads].
extension DownloadsPatterns on Downloads {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Downloads value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Downloads() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Downloads value)  $default,){
final _that = this;
switch (_that) {
case _Downloads():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Downloads value)?  $default,){
final _that = this;
switch (_that) {
case _Downloads() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'poster_path')  String? posterPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Downloads() when $default != null:
return $default(_that.posterPath);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'poster_path')  String? posterPath)  $default,) {final _that = this;
switch (_that) {
case _Downloads():
return $default(_that.posterPath);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'poster_path')  String? posterPath)?  $default,) {final _that = this;
switch (_that) {
case _Downloads() when $default != null:
return $default(_that.posterPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Downloads implements Downloads {
  const _Downloads({@JsonKey(name: 'poster_path') required this.posterPath});
  factory _Downloads.fromJson(Map<String, dynamic> json) => _$DownloadsFromJson(json);

@override@JsonKey(name: 'poster_path') final  String? posterPath;

/// Create a copy of Downloads
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadsCopyWith<_Downloads> get copyWith => __$DownloadsCopyWithImpl<_Downloads>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownloadsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Downloads&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,posterPath);

@override
String toString() {
  return 'Downloads(posterPath: $posterPath)';
}


}

/// @nodoc
abstract mixin class _$DownloadsCopyWith<$Res> implements $DownloadsCopyWith<$Res> {
  factory _$DownloadsCopyWith(_Downloads value, $Res Function(_Downloads) _then) = __$DownloadsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'poster_path') String? posterPath
});




}
/// @nodoc
class __$DownloadsCopyWithImpl<$Res>
    implements _$DownloadsCopyWith<$Res> {
  __$DownloadsCopyWithImpl(this._self, this._then);

  final _Downloads _self;
  final $Res Function(_Downloads) _then;

/// Create a copy of Downloads
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posterPath = freezed,}) {
  return _then(_Downloads(
posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
