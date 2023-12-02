part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {}

final class HomePaymentSucces extends HomeState {}

final class HomePaymentUnSucces extends HomeState {}

final class HomeFailed extends HomeState {}

final class HomeNoInternetConnection extends HomeState {}
