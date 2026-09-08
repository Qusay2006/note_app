// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppUserState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUserState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUserState()';
}


}

/// @nodoc
class $AppUserStateCopyWith<$Res>  {
$AppUserStateCopyWith(AppUserState _, $Res Function(AppUserState) __);
}


/// Adds pattern-matching-related methods to [AppUserState].
extension AppUserStatePatterns on AppUserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _loggedIN value)?  loggedIn,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _loggedIN() when loggedIn != null:
return loggedIn(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _loggedIN value)  loggedIn,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _loggedIN():
return loggedIn(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _loggedIN value)?  loggedIn,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _loggedIN() when loggedIn != null:
return loggedIn(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( UserEntity user)?  loggedIn,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _loggedIN() when loggedIn != null:
return loggedIn(_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( UserEntity user)  loggedIn,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _loggedIN():
return loggedIn(_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( UserEntity user)?  loggedIn,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _loggedIN() when loggedIn != null:
return loggedIn(_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AppUserState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppUserState.initial()';
}


}




/// @nodoc


class _loggedIN implements AppUserState {
  const _loggedIN(this.user);
  

 final  UserEntity user;

/// Create a copy of AppUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$loggedINCopyWith<_loggedIN> get copyWith => __$loggedINCopyWithImpl<_loggedIN>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _loggedIN&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AppUserState.loggedIn(user: $user)';
}


}

/// @nodoc
abstract mixin class _$loggedINCopyWith<$Res> implements $AppUserStateCopyWith<$Res> {
  factory _$loggedINCopyWith(_loggedIN value, $Res Function(_loggedIN) _then) = __$loggedINCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});




}
/// @nodoc
class __$loggedINCopyWithImpl<$Res>
    implements _$loggedINCopyWith<$Res> {
  __$loggedINCopyWithImpl(this._self, this._then);

  final _loggedIN _self;
  final $Res Function(_loggedIN) _then;

/// Create a copy of AppUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_loggedIN(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

// dart format on
