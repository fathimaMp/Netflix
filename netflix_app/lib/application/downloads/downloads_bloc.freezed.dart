// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloads_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DownloadsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadsEvent()';
}


}

/// @nodoc
class $DownloadsEventCopyWith<$Res>  {
$DownloadsEventCopyWith(DownloadsEvent _, $Res Function(DownloadsEvent) __);
}


/// Adds pattern-matching-related methods to [DownloadsEvent].
extension DownloadsEventPatterns on DownloadsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetDownloadsImage value)?  getDownloadsImage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetDownloadsImage() when getDownloadsImage != null:
return getDownloadsImage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetDownloadsImage value)  getDownloadsImage,}){
final _that = this;
switch (_that) {
case _GetDownloadsImage():
return getDownloadsImage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetDownloadsImage value)?  getDownloadsImage,}){
final _that = this;
switch (_that) {
case _GetDownloadsImage() when getDownloadsImage != null:
return getDownloadsImage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getDownloadsImage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetDownloadsImage() when getDownloadsImage != null:
return getDownloadsImage();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getDownloadsImage,}) {final _that = this;
switch (_that) {
case _GetDownloadsImage():
return getDownloadsImage();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getDownloadsImage,}) {final _that = this;
switch (_that) {
case _GetDownloadsImage() when getDownloadsImage != null:
return getDownloadsImage();case _:
  return null;

}
}

}

/// @nodoc


class _GetDownloadsImage implements DownloadsEvent {
  const _GetDownloadsImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetDownloadsImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadsEvent.getDownloadsImage()';
}


}




/// @nodoc
mixin _$DownloadsState {

 bool get isLoading; List<Downloads> get downloads; Option<Either<MainFailure, List<Downloads>>> get downloadsFailureOrSuccessOption;
/// Create a copy of DownloadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadsStateCopyWith<DownloadsState> get copyWith => _$DownloadsStateCopyWithImpl<DownloadsState>(this as DownloadsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.downloads, downloads)&&(identical(other.downloadsFailureOrSuccessOption, downloadsFailureOrSuccessOption) || other.downloadsFailureOrSuccessOption == downloadsFailureOrSuccessOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(downloads),downloadsFailureOrSuccessOption);

@override
String toString() {
  return 'DownloadsState(isLoading: $isLoading, downloads: $downloads, downloadsFailureOrSuccessOption: $downloadsFailureOrSuccessOption)';
}


}

/// @nodoc
abstract mixin class $DownloadsStateCopyWith<$Res>  {
  factory $DownloadsStateCopyWith(DownloadsState value, $Res Function(DownloadsState) _then) = _$DownloadsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<Downloads> downloads, Option<Either<MainFailure, List<Downloads>>> downloadsFailureOrSuccessOption
});




}
/// @nodoc
class _$DownloadsStateCopyWithImpl<$Res>
    implements $DownloadsStateCopyWith<$Res> {
  _$DownloadsStateCopyWithImpl(this._self, this._then);

  final DownloadsState _self;
  final $Res Function(DownloadsState) _then;

/// Create a copy of DownloadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? downloads = null,Object? downloadsFailureOrSuccessOption = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,downloads: null == downloads ? _self.downloads : downloads // ignore: cast_nullable_to_non_nullable
as List<Downloads>,downloadsFailureOrSuccessOption: null == downloadsFailureOrSuccessOption ? _self.downloadsFailureOrSuccessOption : downloadsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, List<Downloads>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [DownloadsState].
extension DownloadsStatePatterns on DownloadsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadsState value)  $default,){
final _that = this;
switch (_that) {
case _DownloadsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadsState value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<Downloads> downloads,  Option<Either<MainFailure, List<Downloads>>> downloadsFailureOrSuccessOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadsState() when $default != null:
return $default(_that.isLoading,_that.downloads,_that.downloadsFailureOrSuccessOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<Downloads> downloads,  Option<Either<MainFailure, List<Downloads>>> downloadsFailureOrSuccessOption)  $default,) {final _that = this;
switch (_that) {
case _DownloadsState():
return $default(_that.isLoading,_that.downloads,_that.downloadsFailureOrSuccessOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<Downloads> downloads,  Option<Either<MainFailure, List<Downloads>>> downloadsFailureOrSuccessOption)?  $default,) {final _that = this;
switch (_that) {
case _DownloadsState() when $default != null:
return $default(_that.isLoading,_that.downloads,_that.downloadsFailureOrSuccessOption);case _:
  return null;

}
}

}

/// @nodoc


class _DownloadsState implements DownloadsState {
  const _DownloadsState({this.isLoading = false, final  List<Downloads> downloads = const [], this.downloadsFailureOrSuccessOption = const None()}): _downloads = downloads;
  

@override@JsonKey() final  bool isLoading;
 final  List<Downloads> _downloads;
@override@JsonKey() List<Downloads> get downloads {
  if (_downloads is EqualUnmodifiableListView) return _downloads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_downloads);
}

@override@JsonKey() final  Option<Either<MainFailure, List<Downloads>>> downloadsFailureOrSuccessOption;

/// Create a copy of DownloadsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadsStateCopyWith<_DownloadsState> get copyWith => __$DownloadsStateCopyWithImpl<_DownloadsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._downloads, _downloads)&&(identical(other.downloadsFailureOrSuccessOption, downloadsFailureOrSuccessOption) || other.downloadsFailureOrSuccessOption == downloadsFailureOrSuccessOption));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_downloads),downloadsFailureOrSuccessOption);

@override
String toString() {
  return 'DownloadsState(isLoading: $isLoading, downloads: $downloads, downloadsFailureOrSuccessOption: $downloadsFailureOrSuccessOption)';
}


}

/// @nodoc
abstract mixin class _$DownloadsStateCopyWith<$Res> implements $DownloadsStateCopyWith<$Res> {
  factory _$DownloadsStateCopyWith(_DownloadsState value, $Res Function(_DownloadsState) _then) = __$DownloadsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<Downloads> downloads, Option<Either<MainFailure, List<Downloads>>> downloadsFailureOrSuccessOption
});




}
/// @nodoc
class __$DownloadsStateCopyWithImpl<$Res>
    implements _$DownloadsStateCopyWith<$Res> {
  __$DownloadsStateCopyWithImpl(this._self, this._then);

  final _DownloadsState _self;
  final $Res Function(_DownloadsState) _then;

/// Create a copy of DownloadsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? downloads = null,Object? downloadsFailureOrSuccessOption = null,}) {
  return _then(_DownloadsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,downloads: null == downloads ? _self._downloads : downloads // ignore: cast_nullable_to_non_nullable
as List<Downloads>,downloadsFailureOrSuccessOption: null == downloadsFailureOrSuccessOption ? _self.downloadsFailureOrSuccessOption : downloadsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, List<Downloads>>>,
  ));
}


}

// dart format on
