// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'histories_image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoriesImageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesImageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoriesImageState()';
}


}

/// @nodoc
class $HistoriesImageStateCopyWith<$Res>  {
$HistoriesImageStateCopyWith(HistoriesImageState _, $Res Function(HistoriesImageState) __);
}


/// Adds pattern-matching-related methods to [HistoriesImageState].
extension HistoriesImageStatePatterns on HistoriesImageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HistoriesImageInitial value)?  initial,TResult Function( HistoriesImageLoading value)?  loading,TResult Function( HistoriesImageSuccessState value)?  success,TResult Function( HistoriesImageError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HistoriesImageInitial() when initial != null:
return initial(_that);case HistoriesImageLoading() when loading != null:
return loading(_that);case HistoriesImageSuccessState() when success != null:
return success(_that);case HistoriesImageError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HistoriesImageInitial value)  initial,required TResult Function( HistoriesImageLoading value)  loading,required TResult Function( HistoriesImageSuccessState value)  success,required TResult Function( HistoriesImageError value)  error,}){
final _that = this;
switch (_that) {
case HistoriesImageInitial():
return initial(_that);case HistoriesImageLoading():
return loading(_that);case HistoriesImageSuccessState():
return success(_that);case HistoriesImageError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HistoriesImageInitial value)?  initial,TResult? Function( HistoriesImageLoading value)?  loading,TResult? Function( HistoriesImageSuccessState value)?  success,TResult? Function( HistoriesImageError value)?  error,}){
final _that = this;
switch (_that) {
case HistoriesImageInitial() when initial != null:
return initial(_that);case HistoriesImageLoading() when loading != null:
return loading(_that);case HistoriesImageSuccessState() when success != null:
return success(_that);case HistoriesImageError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<HistoriesImage> historiesImage)?  success,TResult Function( ErrorHandler error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HistoriesImageInitial() when initial != null:
return initial();case HistoriesImageLoading() when loading != null:
return loading();case HistoriesImageSuccessState() when success != null:
return success(_that.historiesImage);case HistoriesImageError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<HistoriesImage> historiesImage)  success,required TResult Function( ErrorHandler error)  error,}) {final _that = this;
switch (_that) {
case HistoriesImageInitial():
return initial();case HistoriesImageLoading():
return loading();case HistoriesImageSuccessState():
return success(_that.historiesImage);case HistoriesImageError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<HistoriesImage> historiesImage)?  success,TResult? Function( ErrorHandler error)?  error,}) {final _that = this;
switch (_that) {
case HistoriesImageInitial() when initial != null:
return initial();case HistoriesImageLoading() when loading != null:
return loading();case HistoriesImageSuccessState() when success != null:
return success(_that.historiesImage);case HistoriesImageError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class HistoriesImageInitial implements HistoriesImageState {
  const HistoriesImageInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesImageInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoriesImageState.initial()';
}


}




/// @nodoc


class HistoriesImageLoading implements HistoriesImageState {
  const HistoriesImageLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesImageLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoriesImageState.loading()';
}


}




/// @nodoc


class HistoriesImageSuccessState implements HistoriesImageState {
  const HistoriesImageSuccessState(final  List<HistoriesImage> historiesImage): _historiesImage = historiesImage;
  

 final  List<HistoriesImage> _historiesImage;
 List<HistoriesImage> get historiesImage {
  if (_historiesImage is EqualUnmodifiableListView) return _historiesImage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_historiesImage);
}


/// Create a copy of HistoriesImageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoriesImageSuccessStateCopyWith<HistoriesImageSuccessState> get copyWith => _$HistoriesImageSuccessStateCopyWithImpl<HistoriesImageSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesImageSuccessState&&const DeepCollectionEquality().equals(other._historiesImage, _historiesImage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_historiesImage));

@override
String toString() {
  return 'HistoriesImageState.success(historiesImage: $historiesImage)';
}


}

/// @nodoc
abstract mixin class $HistoriesImageSuccessStateCopyWith<$Res> implements $HistoriesImageStateCopyWith<$Res> {
  factory $HistoriesImageSuccessStateCopyWith(HistoriesImageSuccessState value, $Res Function(HistoriesImageSuccessState) _then) = _$HistoriesImageSuccessStateCopyWithImpl;
@useResult
$Res call({
 List<HistoriesImage> historiesImage
});




}
/// @nodoc
class _$HistoriesImageSuccessStateCopyWithImpl<$Res>
    implements $HistoriesImageSuccessStateCopyWith<$Res> {
  _$HistoriesImageSuccessStateCopyWithImpl(this._self, this._then);

  final HistoriesImageSuccessState _self;
  final $Res Function(HistoriesImageSuccessState) _then;

/// Create a copy of HistoriesImageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? historiesImage = null,}) {
  return _then(HistoriesImageSuccessState(
null == historiesImage ? _self._historiesImage : historiesImage // ignore: cast_nullable_to_non_nullable
as List<HistoriesImage>,
  ));
}


}

/// @nodoc


class HistoriesImageError implements HistoriesImageState {
  const HistoriesImageError({required this.error});
  

 final  ErrorHandler error;

/// Create a copy of HistoriesImageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoriesImageErrorCopyWith<HistoriesImageError> get copyWith => _$HistoriesImageErrorCopyWithImpl<HistoriesImageError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesImageError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'HistoriesImageState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $HistoriesImageErrorCopyWith<$Res> implements $HistoriesImageStateCopyWith<$Res> {
  factory $HistoriesImageErrorCopyWith(HistoriesImageError value, $Res Function(HistoriesImageError) _then) = _$HistoriesImageErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler error
});




}
/// @nodoc
class _$HistoriesImageErrorCopyWithImpl<$Res>
    implements $HistoriesImageErrorCopyWith<$Res> {
  _$HistoriesImageErrorCopyWithImpl(this._self, this._then);

  final HistoriesImageError _self;
  final $Res Function(HistoriesImageError) _then;

/// Create a copy of HistoriesImageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(HistoriesImageError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on
