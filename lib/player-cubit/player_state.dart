abstract class PlayerState {}

class HomeInitialState extends PlayerState {}

class ChangeCurrentIndex extends PlayerState {}

class ChangeVerify extends PlayerState {}

class ChangeCountry extends PlayerState {}

class ChangeTabBar extends PlayerState {}

class ChangeIndexPage extends PlayerState {}

class Changetype extends PlayerState {}

class ChangeGander extends PlayerState {}

class ChangeSocial extends PlayerState {}

class ChangeProfile extends PlayerState {}

class GetSportModel extends PlayerState {}
class GetSportId extends PlayerState {}

class GetSubSportModel extends PlayerState {}

class GetSportsLoading extends PlayerState {}

class GetSportsSuccess extends PlayerState {}

class GetSportsError extends PlayerState {}

class GetSubSportsLoading extends PlayerState {}

class GetSubSportsSuccess extends PlayerState {}

class GetSubSportsError extends PlayerState {
  String? err;
  GetSubSportsError(this.err);
}

class GetSubSportsCategoryLoading extends PlayerState {}

class GetSubSportsCategorySuccess extends PlayerState {}

class GetSubSportsCategoryError extends PlayerState {}

class RegisterLoading extends PlayerState {}

class RegisterSuccess extends PlayerState {}

class RegisterError extends PlayerState {}

class GetCategoryLoading extends PlayerState {}

class GetCategorySuccess extends PlayerState {}

class GetCategoryError extends PlayerState {}
