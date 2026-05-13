// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'histories_video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoriesVideoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesVideoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoriesVideoState()';
}


}

/// @nodoc
class $HistoriesVideoStateCopyWith<$Res>  {
$HistoriesVideoStateCopyWith(HistoriesVideoState _, $Res Function(HistoriesVideoState) __);
}


/// Adds pattern-matching-related methods to [HistoriesVideoState].
extension HistoriesVideoStatePatterns on HistoriesVideoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HistoriesVideoInitial value)?  initial,TResult Function( HistoriesVideoLoading value)?  loading,TResult Function( HistoriesVideoSuccessState value)?  success,TResult Function( HistoriesVideoError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HistoriesVideoInitial() when initial != null:
return initial(_that);case HistoriesVideoLoading() when loading != null:
return loading(_that);case HistoriesVideoSuccessState() when success != null:
return success(_that);case HistoriesVideoError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HistoriesVideoInitial value)  initial,required TResult Function( HistoriesVideoLoading value)  loading,required TResult Function( HistoriesVideoSuccessState value)  success,required TResult Function( HistoriesVideoError value)  error,}){
final _that = this;
switch (_that) {
case HistoriesVideoInitial():
return initial(_that);case HistoriesVideoLoading():
return loading(_that);case HistoriesVideoSuccessState():
return success(_that);case HistoriesVideoError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HistoriesVideoInitial value)?  initial,TResult? Function( HistoriesVideoLoading value)?  loading,TResult? Function( HistoriesVideoSuccessState value)?  success,TResult? Function( HistoriesVideoError value)?  error,}){
final _that = this;
switch (_that) {
case HistoriesVideoInitial() when initial != null:
return initial(_that);case HistoriesVideoLoading() when loading != null:
return loading(_that);case HistoriesVideoSuccessState() when success != null:
return success(_that);case HistoriesVideoError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<HistoriesVideo> historiesVideo)?  success,TResult Function( ErrorHandler error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HistoriesVideoInitial() when initial != null:
return initial();case HistoriesVideoLoading() when loading != null:
return loading();case HistoriesVideoSuccessState() when success != null:
return success(_that.historiesVideo);case HistoriesVideoError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<HistoriesVideo> historiesVideo)  success,required TResult Function( ErrorHandler error)  error,}) {final _that = this;
switch (_that) {
case HistoriesVideoInitial():
return initial();case HistoriesVideoLoading():
return loading();case HistoriesVideoSuccessState():
return success(_that.historiesVideo);case HistoriesVideoError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<HistoriesVideo> historiesVideo)?  success,TResult? Function( ErrorHandler error)?  error,}) {final _that = this;
switch (_that) {
case HistoriesVideoInitial() when initial != null:
return initial();case HistoriesVideoLoading() when loading != null:
return loading();case HistoriesVideoSuccessState() when success != null:
return success(_that.historiesVideo);case HistoriesVideoError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class HistoriesVideoInitial implements HistoriesVideoState {
  const HistoriesVideoInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesVideoInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoriesVideoState.initial()';
}


}




/// @nodoc


class HistoriesVideoLoading implements HistoriesVideoState {
  const HistoriesVideoLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesVideoLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoriesVideoState.loading()';
}


}




/// @nodoc


class HistoriesVideoSuccessState implements HistoriesVideoState {
  const HistoriesVideoSuccessState(final  List<HistoriesVideo> historiesVideo): _historiesVideo = historiesVideo;
  

 final  List<HistoriesVideo> _historiesVideo;
 List<HistoriesVideo> get historiesVideo {
  if (_historiesVideo is EqualUnmodifiableListView) return _historiesVideo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_historiesVideo);
}


/// Create a copy of HistoriesVideoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoriesVideoSuccessStateCopyWith<HistoriesVideoSuccessState> get copyWith => _$HistoriesVideoSuccessStateCopyWithImpl<HistoriesVideoSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesVideoSuccessState&&const DeepCollectionEquality().equals(other._historiesVideo, _historiesVideo));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_historiesVideo));

@override
String toString() {
  return 'HistoriesVideoState.success(historiesVideo: $historiesVideo)';
}


}

/// @nodoc
abstract mixin class $HistoriesVideoSuccessStateCopyWith<$Res> implements $HistoriesVideoStateCopyWith<$Res> {
  factory $HistoriesVideoSuccessStateCopyWith(HistoriesVideoSuccessState value, $Res Function(HistoriesVideoSuccessState) _then) = _$HistoriesVideoSuccessStateCopyWithImpl;
@useResult
$Res call({
 List<HistoriesVideo> historiesVideo
});




}
/// @nodoc
class _$HistoriesVideoSuccessStateCopyWithImpl<$Res>
    implements $HistoriesVideoSuccessStateCopyWith<$Res> {
  _$HistoriesVideoSuccessStateCopyWithImpl(this._self, this._then);

  final HistoriesVideoSuccessState _self;
  final $Res Function(HistoriesVideoSuccessState) _then;

/// Create a copy of HistoriesVideoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? historiesVideo = null,}) {
  return _then(HistoriesVideoSuccessState(
null == historiesVideo ? _self._historiesVideo : historiesVideo // ignore: cast_nullable_to_non_nullable
as List<HistoriesVideo>,
  ));
}


}

/// @nodoc


class HistoriesVideoError implements HistoriesVideoState {
  const HistoriesVideoError({required this.error});
  

 final  ErrorHandler error;

/// Create a copy of HistoriesVideoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoriesVideoErrorCopyWith<HistoriesVideoError> get copyWith => _$HistoriesVideoErrorCopyWithImpl<HistoriesVideoError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoriesVideoError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'HistoriesVideoState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $HistoriesVideoErrorCopyWith<$Res> implements $HistoriesVideoStateCopyWith<$Res> {
  factory $HistoriesVideoErrorCopyWith(HistoriesVideoError value, $Res Function(HistoriesVideoError) _then) = _$HistoriesVideoErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler error
});




}
/// @nodoc
class _$HistoriesVideoErrorCopyWithImpl<$Res>
    implements $HistoriesVideoErrorCopyWith<$Res> {
  _$HistoriesVideoErrorCopyWithImpl(this._self, this._then);

  final HistoriesVideoError _self;
  final $Res Function(HistoriesVideoError) _then;

/// Create a copy of HistoriesVideoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(HistoriesVideoError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on
