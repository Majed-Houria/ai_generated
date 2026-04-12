// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detect_image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetectImageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectImageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetectImageState()';
}


}

/// @nodoc
class $DetectImageStateCopyWith<$Res>  {
$DetectImageStateCopyWith(DetectImageState _, $Res Function(DetectImageState) __);
}


/// Adds pattern-matching-related methods to [DetectImageState].
extension DetectImageStatePatterns on DetectImageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DetectImageInitial value)?  initial,TResult Function( DetectImageLoading value)?  loading,TResult Function( DetectImageSuccessState value)?  success,TResult Function( DetectImageError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DetectImageInitial() when initial != null:
return initial(_that);case DetectImageLoading() when loading != null:
return loading(_that);case DetectImageSuccessState() when success != null:
return success(_that);case DetectImageError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DetectImageInitial value)  initial,required TResult Function( DetectImageLoading value)  loading,required TResult Function( DetectImageSuccessState value)  success,required TResult Function( DetectImageError value)  error,}){
final _that = this;
switch (_that) {
case DetectImageInitial():
return initial(_that);case DetectImageLoading():
return loading(_that);case DetectImageSuccessState():
return success(_that);case DetectImageError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DetectImageInitial value)?  initial,TResult? Function( DetectImageLoading value)?  loading,TResult? Function( DetectImageSuccessState value)?  success,TResult? Function( DetectImageError value)?  error,}){
final _that = this;
switch (_that) {
case DetectImageInitial() when initial != null:
return initial(_that);case DetectImageLoading() when loading != null:
return loading(_that);case DetectImageSuccessState() when success != null:
return success(_that);case DetectImageError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DetectImage detectImage)?  success,TResult Function( ErrorHandler error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DetectImageInitial() when initial != null:
return initial();case DetectImageLoading() when loading != null:
return loading();case DetectImageSuccessState() when success != null:
return success(_that.detectImage);case DetectImageError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DetectImage detectImage)  success,required TResult Function( ErrorHandler error)  error,}) {final _that = this;
switch (_that) {
case DetectImageInitial():
return initial();case DetectImageLoading():
return loading();case DetectImageSuccessState():
return success(_that.detectImage);case DetectImageError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DetectImage detectImage)?  success,TResult? Function( ErrorHandler error)?  error,}) {final _that = this;
switch (_that) {
case DetectImageInitial() when initial != null:
return initial();case DetectImageLoading() when loading != null:
return loading();case DetectImageSuccessState() when success != null:
return success(_that.detectImage);case DetectImageError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class DetectImageInitial implements DetectImageState {
  const DetectImageInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectImageInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetectImageState.initial()';
}


}




/// @nodoc


class DetectImageLoading implements DetectImageState {
  const DetectImageLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectImageLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetectImageState.loading()';
}


}




/// @nodoc


class DetectImageSuccessState implements DetectImageState {
  const DetectImageSuccessState(this.detectImage);
  

 final  DetectImage detectImage;

/// Create a copy of DetectImageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetectImageSuccessStateCopyWith<DetectImageSuccessState> get copyWith => _$DetectImageSuccessStateCopyWithImpl<DetectImageSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectImageSuccessState&&(identical(other.detectImage, detectImage) || other.detectImage == detectImage));
}


@override
int get hashCode => Object.hash(runtimeType,detectImage);

@override
String toString() {
  return 'DetectImageState.success(detectImage: $detectImage)';
}


}

/// @nodoc
abstract mixin class $DetectImageSuccessStateCopyWith<$Res> implements $DetectImageStateCopyWith<$Res> {
  factory $DetectImageSuccessStateCopyWith(DetectImageSuccessState value, $Res Function(DetectImageSuccessState) _then) = _$DetectImageSuccessStateCopyWithImpl;
@useResult
$Res call({
 DetectImage detectImage
});




}
/// @nodoc
class _$DetectImageSuccessStateCopyWithImpl<$Res>
    implements $DetectImageSuccessStateCopyWith<$Res> {
  _$DetectImageSuccessStateCopyWithImpl(this._self, this._then);

  final DetectImageSuccessState _self;
  final $Res Function(DetectImageSuccessState) _then;

/// Create a copy of DetectImageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detectImage = null,}) {
  return _then(DetectImageSuccessState(
null == detectImage ? _self.detectImage : detectImage // ignore: cast_nullable_to_non_nullable
as DetectImage,
  ));
}


}

/// @nodoc


class DetectImageError implements DetectImageState {
  const DetectImageError({required this.error});
  

 final  ErrorHandler error;

/// Create a copy of DetectImageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetectImageErrorCopyWith<DetectImageError> get copyWith => _$DetectImageErrorCopyWithImpl<DetectImageError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectImageError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'DetectImageState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $DetectImageErrorCopyWith<$Res> implements $DetectImageStateCopyWith<$Res> {
  factory $DetectImageErrorCopyWith(DetectImageError value, $Res Function(DetectImageError) _then) = _$DetectImageErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler error
});




}
/// @nodoc
class _$DetectImageErrorCopyWithImpl<$Res>
    implements $DetectImageErrorCopyWith<$Res> {
  _$DetectImageErrorCopyWithImpl(this._self, this._then);

  final DetectImageError _self;
  final $Res Function(DetectImageError) _then;

/// Create a copy of DetectImageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DetectImageError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on
