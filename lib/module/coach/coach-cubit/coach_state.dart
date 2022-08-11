abstract class CoachState {}

class HomeInitialState extends CoachState {}

class ChangeCurrentIndex extends CoachState {}

class ChangeVerify extends CoachState {}

class ChangeCountry extends CoachState {}

class ChangeTabBar extends CoachState {}

class ChangeIndexPage extends CoachState {}

class Changetype extends CoachState {}

class ChangeGander extends CoachState {}

class ChangeSocial extends CoachState {}

class ChangeProfile extends CoachState {}

class GetSportModel extends CoachState {}
class GetSportId extends CoachState {}

class GetSubSportModel extends CoachState {}

class GetSportsLoading extends CoachState {}

class GetSportsSuccess extends CoachState {}

class GetSportsError extends CoachState {}

class GetSubSportsLoading extends CoachState {}

class GetSubSportsSuccess extends CoachState {}

class GetSubSportsError extends CoachState {
  String? err;
  GetSubSportsError(this.err);
}

class GetSubSportsCategoryLoading extends CoachState {}

class GetSubSportsCategorySuccess extends CoachState {}

class GetSubSportsCategoryError extends CoachState {}

class RegisterLoading extends CoachState {}

class RegisterSuccess extends CoachState {}

class RegisterError extends CoachState {}

class GetCategoryLoading extends CoachState {}

class GetCategorySuccess extends CoachState {}

class GetCategoryError extends CoachState {}
class GetPositionsLoading extends CoachState {}

class GetPositionsSuccess extends CoachState {}

class GetPositionsError extends CoachState {}
