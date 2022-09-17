abstract class CompanyState {}

class HomeInitialState extends CompanyState {}

class ChangeCurrentIndex extends CompanyState {}

class ChangeVerify extends CompanyState {}

class ChangeCountry extends CompanyState {}

class ChangeTabBar extends CompanyState {}

class ChangeIndexPage extends CompanyState {}

class Changetype extends CompanyState {}

class ChangeGander extends CompanyState {}

class ChangeSocial extends CompanyState {}

class ChangeProfile extends CompanyState {}

class GetSportModel extends CompanyState {}

class GetSportId extends CompanyState {}

class GetSubSportModel extends CompanyState {}

class GetSportsLoading extends CompanyState {}

class GetSportsSuccess extends CompanyState {}

class GetSportsError extends CompanyState {}

class GetSubSportsLoading extends CompanyState {}

class GetSubSportsSuccess extends CompanyState {}

class GetSubSportsError extends CompanyState {
  String? err;
  GetSubSportsError(this.err);
}

class GetSubSportsCategoryLoading extends CompanyState {}

class GetSubSportsCategorySuccess extends CompanyState {}

class GetSubSportsCategoryError extends CompanyState {}

class RegisterLoading extends CompanyState {}

class RegisterSuccess extends CompanyState {}

class RegisterError extends CompanyState {}

class GetCategoryLoading extends CompanyState {}

class GetCategorySuccess extends CompanyState {}

class GetCategoryError extends CompanyState {}

class GetPositionsLoading extends CompanyState {}

class GetPositionsSuccess extends CompanyState {}

class GetPositionsError extends CompanyState {}
