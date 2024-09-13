import 'package:collection/collection.dart';

enum ActivityType {
  Sports,
  Relax,
  Watch,
  Dine,
  Drink,
  Other,
}

enum Exclusivity {
  Exclusive,
  Public,
  Sponsorship,
  Ticket,
}

enum DressCode {
  WhiteTie,
  BlackTie,
  Semiformal,
  BusinessCasual,
  Casual,
  Beach,
}

enum RelationPreference {
  LongTerm,
  ShortTerm,
  Friendship,
  NonMonogamous,
  Other,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ActivityType):
      return ActivityType.values.deserialize(value) as T?;
    case (Exclusivity):
      return Exclusivity.values.deserialize(value) as T?;
    case (DressCode):
      return DressCode.values.deserialize(value) as T?;
    case (RelationPreference):
      return RelationPreference.values.deserialize(value) as T?;
    default:
      return null;
  }
}
