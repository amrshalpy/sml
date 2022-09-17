abstract class DoctorState {}

class HomeInitialState extends DoctorState {}

class ChangeCurrentIndex extends DoctorState {}

class ChangeVerify extends DoctorState {}

class ChangeCountry extends DoctorState {}

class ChangeTabBar extends DoctorState {}

class ChangeIndexPage extends DoctorState {}

class Changetype extends DoctorState {}

class ChangeGander extends DoctorState {}

class ChangeSocial extends DoctorState {}

class ChangeProfile extends DoctorState {}

class GetSportModel extends DoctorState {}

class GetSportId extends DoctorState {}

class FetchData extends DoctorState {}

class IncreasePage extends DoctorState {}

class GetSubSportModel extends DoctorState {}

class GetSportsLoading extends DoctorState {}

class GetSportsSuccess extends DoctorState {}

class GetSportsError extends DoctorState {}

class GetPositionsLoading extends DoctorState {}

class GetPositionsSuccess extends DoctorState {}

class GetPositionsError extends DoctorState {}

class GetAllSportsLoading extends DoctorState {}

class GetAllSportsSuccess extends DoctorState {}

class GetAllSportsError extends DoctorState {}

class GetSubSportsLoading extends DoctorState {}

class GetSubSportsSuccess extends DoctorState {}

class GetSubSportsError extends DoctorState {
  String? err;
  GetSubSportsError(this.err);
}

class GetSubSportsCategoryLoading extends DoctorState {}

class GetSubSportsCategorySuccess extends DoctorState {}

class GetSubSportsCategoryError extends DoctorState {}

class RegisterLoading extends DoctorState {}

class RegisterSuccess extends DoctorState {}

class RegisterError extends DoctorState {}

class GetCategoryLoading extends DoctorState {}

class GetCategorySuccess extends DoctorState {}

class GetCategoryError extends DoctorState {}
