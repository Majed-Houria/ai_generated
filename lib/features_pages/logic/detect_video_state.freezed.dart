// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detect_video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetectVideoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectVideoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetectVideoState()';
}


}

/// @nodoc
class $DetectVideoStateCopyWith<$Res>  {
$DetectVideoStateCopyWith(DetectVideoState _, $Res Function(DetectVideoState) __);
}


/// Adds pattern-matching-related methods to [DetectVideoState].
extension DetectVideoStatePatterns on DetectVideoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DetectVideoInitial value)?  initial,TResult Function( DetectVideoLoading value)?  loading,TResult Function( DetectVideoSuccessState value)?  success,TResult Function( DetectVideoError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DetectVideoInitial() when initial != null:
return initial(_that);case DetectVideoLoading() when loading != null:
return loading(_that);case DetectVideoSuccessState() when success != null:
return success(_that);case DetectVideoError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DetectVideoInitial value)  initial,required TResult Function( DetectVideoLoading value)  loading,required TResult Function( DetectVideoSuccessState value)  success,required TResult Function( DetectVideoError value)  error,}){
final _that = this;
switch (_that) {
case DetectVideoInitial():
return initial(_that);case DetectVideoLoading():
return loading(_that);case DetectVideoSuccessState():
return success(_that);case DetectVideoError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DetectVideoInitial value)?  initial,TResult? Function( DetectVideoLoading value)?  loading,TResult? Function( DetectVideoSuccessState value)?  success,TResult? Function( DetectVideoError value)?  error,}){
final _that = this;
switch (_that) {
case DetectVideoInitial() when initial != null:
return initial(_that);case DetectVideoLoading() when loading != null:
return loading(_that);case DetectVideoSuccessState() when success != null:
return success(_that);case DetectVideoError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DetectVideo detectVideo)?  success,TResult Function( ErrorHandler error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DetectVideoInitial() when initial != null:
return initial();case DetectVideoLoading() when loading != null:
return loading();case DetectVideoSuccessState() when success != null:
return success(_that.detectVideo);case DetectVideoError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DetectVideo detectVideo)  success,required TResult Function( ErrorHandler error)  error,}) {final _that = this;
switch (_that) {
case DetectVideoInitial():
return initial();case DetectVideoLoading():
return loading();case DetectVideoSuccessState():
return success(_that.detectVideo);case DetectVideoError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DetectVideo detectVideo)?  success,TResult? Function( ErrorHandler error)?  error,}) {final _that = this;
switch (_that) {
case DetectVideoInitial() when initial != null:
return initial();case DetectVideoLoading() when loading != null:
return loading();case DetectVideoSuccessState() when success != null:
return success(_that.detectVideo);case DetectVideoError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class DetectVideoInitial implements DetectVideoState {
  const DetectVideoInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectVideoInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetectVideoState.initial()';
}


}




/// @nodoc


class DetectVideoLoading implements DetectVideoState {
  const DetectVideoLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectVideoLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetectVideoState.loading()';
}


}




/// @nodoc


class DetectVideoSuccessState implements DetectVideoState {
  const DetectVideoSuccessState(this.detectVideo);
  

 final  DetectVideo detectVideo;

/// Create a copy of DetectVideoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetectVideoSuccessStateCopyWith<DetectVideoSuccessState> get copyWith => _$DetectVideoSuccessStateCopyWithImpl<DetectVideoSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectVideoSuccessState&&(identical(other.detectVideo, detectVideo) || other.detectVideo == detectVideo));
}


@override
int get hashCode => Object.hash(runtimeType,detectVideo);

@override
String toString() {
  return 'DetectVideoState.success(detectVideo: $detectVideo)';
}


}

/// @nodoc
abstract mixin class $DetectVideoSuccessStateCopyWith<$Res> implements $DetectVideoStateCopyWith<$Res> {
  factory $DetectVideoSuccessStateCopyWith(DetectVideoSuccessState value, $Res Function(DetectVideoSuccessState) _then) = _$DetectVideoSuccessStateCopyWithImpl;
@useResult
$Res call({
 DetectVideo detectVideo
});




}
/// @nodoc
class _$DetectVideoSuccessStateCopyWithImpl<$Res>
    implements $DetectVideoSuccessStateCopyWith<$Res> {
  _$DetectVideoSuccessStateCopyWithImpl(this._self, this._then);

  final DetectVideoSuccessState _self;
  final $Res Function(DetectVideoSuccessState) _then;

/// Create a copy of DetectVideoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detectVideo = null,}) {
  return _then(DetectVideoSuccessState(
null == detectVideo ? _self.detectVideo : detectVideo // ignore: cast_nullable_to_non_nullable
as DetectVideo,
  ));
}


}

/// @nodoc


class DetectVideoError implements DetectVideoState {
  const DetectVideoError({required this.error});
  

 final  ErrorHandler error;

/// Create a copy of DetectVideoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetectVideoErrorCopyWith<DetectVideoError> get copyWith => _$DetectVideoErrorCopyWithImpl<DetectVideoError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectVideoError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'DetectVideoState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $DetectVideoErrorCopyWith<$Res> implements $DetectVideoStateCopyWith<$Res> {
  factory $DetectVideoErrorCopyWith(DetectVideoError value, $Res Function(DetectVideoError) _then) = _$DetectVideoErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler error
});




}
/// @nodoc
class _$DetectVideoErrorCopyWithImpl<$Res>
    implements $DetectVideoErrorCopyWith<$Res> {
  _$DetectVideoErrorCopyWithImpl(this._self, this._then);

  final DetectVideoError _self;
  final $Res Function(DetectVideoError) _then;

/// Create a copy of DetectVideoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DetectVideoError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on
