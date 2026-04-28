// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detect_text_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetectTextState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectTextState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetectTextState()';
}


}

/// @nodoc
class $DetectTextStateCopyWith<$Res>  {
$DetectTextStateCopyWith(DetectTextState _, $Res Function(DetectTextState) __);
}


/// Adds pattern-matching-related methods to [DetectTextState].
extension DetectTextStatePatterns on DetectTextState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DetectTextInitial value)?  initial,TResult Function( DetectTextLoading value)?  loading,TResult Function( DetectTextSuccessState value)?  success,TResult Function( DetectTextError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DetectTextInitial() when initial != null:
return initial(_that);case DetectTextLoading() when loading != null:
return loading(_that);case DetectTextSuccessState() when success != null:
return success(_that);case DetectTextError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DetectTextInitial value)  initial,required TResult Function( DetectTextLoading value)  loading,required TResult Function( DetectTextSuccessState value)  success,required TResult Function( DetectTextError value)  error,}){
final _that = this;
switch (_that) {
case DetectTextInitial():
return initial(_that);case DetectTextLoading():
return loading(_that);case DetectTextSuccessState():
return success(_that);case DetectTextError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DetectTextInitial value)?  initial,TResult? Function( DetectTextLoading value)?  loading,TResult? Function( DetectTextSuccessState value)?  success,TResult? Function( DetectTextError value)?  error,}){
final _that = this;
switch (_that) {
case DetectTextInitial() when initial != null:
return initial(_that);case DetectTextLoading() when loading != null:
return loading(_that);case DetectTextSuccessState() when success != null:
return success(_that);case DetectTextError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DetectText detectText)?  success,TResult Function( ErrorHandler error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DetectTextInitial() when initial != null:
return initial();case DetectTextLoading() when loading != null:
return loading();case DetectTextSuccessState() when success != null:
return success(_that.detectText);case DetectTextError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DetectText detectText)  success,required TResult Function( ErrorHandler error)  error,}) {final _that = this;
switch (_that) {
case DetectTextInitial():
return initial();case DetectTextLoading():
return loading();case DetectTextSuccessState():
return success(_that.detectText);case DetectTextError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DetectText detectText)?  success,TResult? Function( ErrorHandler error)?  error,}) {final _that = this;
switch (_that) {
case DetectTextInitial() when initial != null:
return initial();case DetectTextLoading() when loading != null:
return loading();case DetectTextSuccessState() when success != null:
return success(_that.detectText);case DetectTextError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class DetectTextInitial implements DetectTextState {
  const DetectTextInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectTextInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetectTextState.initial()';
}


}




/// @nodoc


class DetectTextLoading implements DetectTextState {
  const DetectTextLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectTextLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetectTextState.loading()';
}


}




/// @nodoc


class DetectTextSuccessState implements DetectTextState {
  const DetectTextSuccessState(this.detectText);
  

 final  DetectText detectText;

/// Create a copy of DetectTextState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetectTextSuccessStateCopyWith<DetectTextSuccessState> get copyWith => _$DetectTextSuccessStateCopyWithImpl<DetectTextSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectTextSuccessState&&(identical(other.detectText, detectText) || other.detectText == detectText));
}


@override
int get hashCode => Object.hash(runtimeType,detectText);

@override
String toString() {
  return 'DetectTextState.success(detectText: $detectText)';
}


}

/// @nodoc
abstract mixin class $DetectTextSuccessStateCopyWith<$Res> implements $DetectTextStateCopyWith<$Res> {
  factory $DetectTextSuccessStateCopyWith(DetectTextSuccessState value, $Res Function(DetectTextSuccessState) _then) = _$DetectTextSuccessStateCopyWithImpl;
@useResult
$Res call({
 DetectText detectText
});




}
/// @nodoc
class _$DetectTextSuccessStateCopyWithImpl<$Res>
    implements $DetectTextSuccessStateCopyWith<$Res> {
  _$DetectTextSuccessStateCopyWithImpl(this._self, this._then);

  final DetectTextSuccessState _self;
  final $Res Function(DetectTextSuccessState) _then;

/// Create a copy of DetectTextState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detectText = null,}) {
  return _then(DetectTextSuccessState(
null == detectText ? _self.detectText : detectText // ignore: cast_nullable_to_non_nullable
as DetectText,
  ));
}


}

/// @nodoc


class DetectTextError implements DetectTextState {
  const DetectTextError({required this.error});
  

 final  ErrorHandler error;

/// Create a copy of DetectTextState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetectTextErrorCopyWith<DetectTextError> get copyWith => _$DetectTextErrorCopyWithImpl<DetectTextError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectTextError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'DetectTextState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $DetectTextErrorCopyWith<$Res> implements $DetectTextStateCopyWith<$Res> {
  factory $DetectTextErrorCopyWith(DetectTextError value, $Res Function(DetectTextError) _then) = _$DetectTextErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler error
});




}
/// @nodoc
class _$DetectTextErrorCopyWithImpl<$Res>
    implements $DetectTextErrorCopyWith<$Res> {
  _$DetectTextErrorCopyWithImpl(this._self, this._then);

  final DetectTextError _self;
  final $Res Function(DetectTextError) _then;

/// Create a copy of DetectTextState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DetectTextError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on
