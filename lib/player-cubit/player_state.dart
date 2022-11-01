import 'package:sportive/model/register_model.dart';

abstract class PlayerState {}

class HomeInitialState extends PlayerState {}

class ChangeCurrentIndex extends PlayerState {}

class GetDeviceId extends PlayerState {}

class GetSocialId extends PlayerState {}

class ChangeVerify extends PlayerState {}

class ChangeNationality extends PlayerState {}

class ChangeCity extends PlayerState {}

class ChangeType extends PlayerState {}

class ChangeSelectedIndex extends PlayerState {}

class Changed extends PlayerState {}

class ChangeCountry extends PlayerState {}

class ChangeIsSocial extends PlayerState {}

class ChangeTabBar extends PlayerState {}

class ChangeIndexPage extends PlayerState {}

class Changetype extends PlayerState {}

class GetSportsId extends PlayerState {}

class GetSporttId extends PlayerState {}

class GetPositionId extends PlayerState {}

class RemoveImageProfile extends PlayerState {}

class ChangeGander extends PlayerState {}

class ChangeSocial extends PlayerState {}

class ChangeProfile extends PlayerState {}

class ChangeQrCode extends PlayerState {}

class ChangeIsVideo extends PlayerState {}

class ChangeIsFreeStyling extends PlayerState {}

class GetSportModel extends PlayerState {}

class GetSportId extends PlayerState {}

class GetSubSportModel extends PlayerState {}

class GetSportsLoading extends PlayerState {}

class GetSportsSuccess extends PlayerState {}

class GetSportsError extends PlayerState {}

class VerifyPhoneLoading extends PlayerState {}

class VerifyPhoneSuccess extends PlayerState {
  String? uid;
  VerifyPhoneSuccess(this.uid);
}

class VerifyPhoneError extends PlayerState {}

class GetSubSportsLoading extends PlayerState {}

class GetSubSportsSuccess extends PlayerState {}

class GetSubSportsError extends PlayerState {
  String? err;
  GetSubSportsError(this.err);
}

class GetAcountTypeLoading extends PlayerState {}

class GetAcountTypeSuccess extends PlayerState {}

class GetAcountTypeError extends PlayerState {
  String? err;
  GetAcountTypeError(this.err);
}

class GetPositionsLoading extends PlayerState {}

class GetPositionsSuccess extends PlayerState {}

class GetPositionsError extends PlayerState {}

class GenrateQrLoading extends PlayerState {}

class GenrateQrSuccess extends PlayerState {
  bool isQrCode = false;
  GenrateQrSuccess(this.isQrCode);
}

class GenrateQrError extends PlayerState {}

class GetSubSportsCategoryLoading extends PlayerState {}

class GetSubSportsCategorySuccess extends PlayerState {}

class GetSubSportsCategoryError extends PlayerState {}

class RegisterLoading extends PlayerState {}

class RegisterSuccess extends PlayerState {
  // String? uid;
  // RegisterSuccess(this.uid);
}

class RegisterError extends PlayerState {
  String? message;
  RegisterError({this.message});
}

class FetchData extends PlayerState {}

class IncreasePage extends PlayerState {}

class GetAllSportsLoading extends PlayerState {}

class GetAllSportsSuccess extends PlayerState {}

class GetAllSportsError extends PlayerState {}

class GetSportsDataLoading extends PlayerState {}

class GetSportsDataSuccess extends PlayerState {}

class GetSportsDataError extends PlayerState {}

class GetCategoryLoading extends PlayerState {}

class GetCategorySuccess extends PlayerState {}

class GetCategoryError extends PlayerState {}

class GetSearchLoading extends PlayerState {}

class GetSearchSuccess extends PlayerState {}

class GetSearchError extends PlayerState {}

class UploadImagePlayerLoading extends PlayerState {}

class UploadImagePlayerSuccess extends PlayerState {}

class UploadImagePlayerError extends PlayerState {}

class UploadLogoLoading extends PlayerState {}

class UploadLogoSuccess extends PlayerState {}

class UploadLogoError extends PlayerState {}

class UploadTitlesLoading extends PlayerState {}

class UploadTitlesSuccess extends PlayerState {}

class UploadTitlesError extends PlayerState {}

class UploadVideoPlayerLoading extends PlayerState {}

class UploadVideoPlayerSuccess extends PlayerState {}

class UploadVideoPlayerError extends PlayerState {}

class DeleteSkillsLoading extends PlayerState {}

class DeleteSkillsSuccess extends PlayerState {}

class DeleteSkillsError extends PlayerState {}

class EditSkillsLoading extends PlayerState {}

class EditSkillsSuccess extends PlayerState {}

class EditSkillsError extends PlayerState {}

class AddExprienceLoading extends PlayerState {}

class AddExprienceSuccess extends PlayerState {}

class AddExprienceError extends PlayerState {}

class AddContactLoading extends PlayerState {}

class AddContactSuccess extends PlayerState {}

class AddContactError extends PlayerState {}

class StorageImagePlayerLoading extends PlayerState {}

class StorageImagePlayerSuccess extends PlayerState {}

class StorageImagePlayerError extends PlayerState {}

class StorageVideoSkillsPlayerLoading extends PlayerState {}

class StorageVideoSkillsPlayerSuccess extends PlayerState {}

class StorageVideoSkillsPlayerError extends PlayerState {}

class GetCountryLoading extends PlayerState {}

class GetCountrySuccess extends PlayerState {}

class GetCountryError extends PlayerState {}

class GetCityLoading extends PlayerState {}

class GetCitySuccess extends PlayerState {}

class GetCityError extends PlayerState {}

class EditDataLoading extends PlayerState {}

class EditDataSuccess extends PlayerState {}

class EditDataError extends PlayerState {}

class GenralDataLoading extends PlayerState {}

class GenralDataSuccess extends PlayerState {}

class GenralDataError extends PlayerState {}

class ContactsLoading extends PlayerState {}

class ContactsSuccess extends PlayerState {}

class ContactsError extends PlayerState {}

class PerformanceDataLoading extends PlayerState {}

class PerformanceDataSuccess extends PlayerState {}

class PerformanceDataError extends PlayerState {}

class ExpericeDataLoading extends PlayerState {}

class ExpericeDataSuccess extends PlayerState {}

class ExpericeDataError extends PlayerState {}

class UploadCertificateLoading extends PlayerState {}

class UploadCertificateSuccess extends PlayerState {}

class UploadCertificateError extends PlayerState {}

class UpdateProductsLoading extends PlayerState {}

class UpdateProductsSuccess extends PlayerState {}

class UpdateProductsError extends PlayerState {}

class UpdateCategoryLoading extends PlayerState {}

class UpdateCategorySuccess extends PlayerState {}

class UpdateCategoryError extends PlayerState {}

class GetProductsLoading extends PlayerState {}

class GetProductsSuccess extends PlayerState {}

class GetProductsError extends PlayerState {}

class GetCategoryModelLoading extends PlayerState {}

class GetCategoryModelSuccess extends PlayerState {}

class GetCategoryModelError extends PlayerState {}

class GetCouponModelLoading extends PlayerState {}

class GetCouponModelSuccess extends PlayerState {}

class GetCouponModelError extends PlayerState {}

class AddProductsLoading extends PlayerState {}

class AddProductsSuccess extends PlayerState {}

class AddProductsError extends PlayerState {}

class AddCouponLoading extends PlayerState {}

class AddCouponSuccess extends PlayerState {}

class AddCouponError extends PlayerState {}
