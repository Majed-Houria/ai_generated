// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'histories_text_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoriesTextState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesTextState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoriesTextState()';
}


}

/// @nodoc
class $HistoriesTextStateCopyWith<$Res>  {
$HistoriesTextStateCopyWith(HistoriesTextState _, $Res Function(HistoriesTextState) __);
}


/// Adds pattern-matching-related methods to [HistoriesTextState].
extension HistoriesTextStatePatterns on HistoriesTextState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HistoriesTextInitial value)?  initial,TResult Function( HistoriesTextLoading value)?  loading,TResult Function( HistoriesTextSuccessState value)?  success,TResult Function( HistoriesTextError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HistoriesTextInitial() when initial != null:
return initial(_that);case HistoriesTextLoading() when loading != null:
return loading(_that);case HistoriesTextSuccessState() when success != null:
return success(_that);case HistoriesTextError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HistoriesTextInitial value)  initial,required TResult Function( HistoriesTextLoading value)  loading,required TResult Function( HistoriesTextSuccessState value)  success,required TResult Function( HistoriesTextError value)  error,}){
final _that = this;
switch (_that) {
case HistoriesTextInitial():
return initial(_that);case HistoriesTextLoading():
return loading(_that);case HistoriesTextSuccessState():
return success(_that);case HistoriesTextError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HistoriesTextInitial value)?  initial,TResult? Function( HistoriesTextLoading value)?  loading,TResult? Function( HistoriesTextSuccessState value)?  success,TResult? Function( HistoriesTextError value)?  error,}){
final _that = this;
switch (_that) {
case HistoriesTextInitial() when initial != null:
return initial(_that);case HistoriesTextLoading() when loading != null:
return loading(_that);case HistoriesTextSuccessState() when success != null:
return success(_that);case HistoriesTextError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<HistoriesText> historiesText)?  success,TResult Function( ErrorHandler error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HistoriesTextInitial() when initial != null:
return initial();case HistoriesTextLoading() when loading != null:
return loading();case HistoriesTextSuccessState() when success != null:
return success(_that.historiesText);case HistoriesTextError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<HistoriesText> historiesText)  success,required TResult Function( ErrorHandler error)  error,}) {final _that = this;
switch (_that) {
case HistoriesTextInitial():
return initial();case HistoriesTextLoading():
return loading();case HistoriesTextSuccessState():
return success(_that.historiesText);case HistoriesTextError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<HistoriesText> historiesText)?  success,TResult? Function( ErrorHandler error)?  error,}) {final _that = this;
switch (_that) {
case HistoriesTextInitial() when initial != null:
return initial();case HistoriesTextLoading() when loading != null:
return loading();case HistoriesTextSuccessState() when success != null:
return success(_that.historiesText);case HistoriesTextError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class HistoriesTextInitial implements HistoriesTextState {
  const HistoriesTextInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesTextInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoriesTextState.initial()';
}


}




/// @nodoc


class HistoriesTextLoading implements HistoriesTextState {
  const HistoriesTextLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesTextLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoriesTextState.loading()';
}


}




/// @nodoc


class HistoriesTextSuccessState implements HistoriesTextState {
  const HistoriesTextSuccessState(final  List<HistoriesText> historiesText): _historiesText = historiesText;
  

 final  List<HistoriesText> _historiesText;
 List<HistoriesText> get historiesText {
  if (_historiesText is EqualUnmodifiableListView) return _historiesText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_historiesText);
}


/// Create a copy of HistoriesTextState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoriesTextSuccessStateCopyWith<HistoriesTextSuccessState> get copyWith => _$HistoriesTextSuccessStateCopyWithImpl<HistoriesTextSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesTextSuccessState&&const DeepCollectionEquality().equals(other._historiesText, _historiesText));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_historiesText));

@override
String toString() {
  return 'HistoriesTextState.success(historiesText: $historiesText)';
}


}

/// @nodoc
abstract mixin class $HistoriesTextSuccessStateCopyWith<$Res> implements $HistoriesTextStateCopyWith<$Res> {
  factory $HistoriesTextSuccessStateCopyWith(HistoriesTextSuccessState value, $Res Function(HistoriesTextSuccessState) _then) = _$HistoriesTextSuccessStateCopyWithImpl;
@useResult
$Res call({
 List<HistoriesText> historiesText
});




}
/// @nodoc
class _$HistoriesTextSuccessStateCopyWithImpl<$Res>
    implements $HistoriesTextSuccessStateCopyWith<$Res> {
  _$HistoriesTextSuccessStateCopyWithImpl(this._self, this._then);

  final HistoriesTextSuccessState _self;
  final $Res Function(HistoriesTextSuccessState) _then;

/// Create a copy of HistoriesTextState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? historiesText = null,}) {
  return _then(HistoriesTextSuccessState(
null == historiesText ? _self._historiesText : historiesText // ignore: cast_nullable_to_non_nullable
as List<HistoriesText>,
  ));
}


}

/// @nodoc


class HistoriesTextError implements HistoriesTextState {
  const HistoriesTextError({required this.error});
  

 final  ErrorHandler error;

/// Create a copy of HistoriesTextState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoriesTextErrorCopyWith<HistoriesTextError> get copyWith => _$HistoriesTextErrorCopyWithImpl<HistoriesTextError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesTextError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'HistoriesTextState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $HistoriesTextErrorCopyWith<$Res> implements $HistoriesTextStateCopyWith<$Res> {
  factory $HistoriesTextErrorCopyWith(HistoriesTextError value, $Res Function(HistoriesTextError) _then) = _$HistoriesTextErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler error
});




}
/// @nodoc
class _$HistoriesTextErrorCopyWithImpl<$Res>
    implements $HistoriesTextErrorCopyWith<$Res> {
  _$HistoriesTextErrorCopyWithImpl(this._self, this._then);

  final HistoriesTextError _self;
  final $Res Function(HistoriesTextError) _then;

/// Create a copy of HistoriesTextState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(HistoriesTextError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on
