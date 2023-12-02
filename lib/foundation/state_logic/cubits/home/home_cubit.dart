import 'dart:math';

import 'package:azercell_task_application/foundation/models/data_containers/debit_cart.dart';
import 'package:azercell_task_application/foundation/models/data_containers/in_memory_store.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final _debitCard = InMemoryStore<DebitCard?>(null);
  final readyTransfer = InMemoryStore<bool>(false);

  Stream<DebitCard?> get debitCardStream => _debitCard.stream;
  Stream<bool> get readyTransferStream => readyTransfer.stream;

  DebitCard? get debitCard => _debitCard.value;

  updateDebitCard(DebitCard? debitCard) {
    _debitCard.value = debitCard;
  }

  updateReadyTransfer() {
    readyTransfer.value = !readyTransfer.value;
  }

  bool lowerBalance(double money) {
    double currentBalance = debitCard!.balance - money;
    if (currentBalance < 0) {
      return false;
    }
    updateDebitCard(debitCard!.copyWith(balance: currentBalance));
    return true;
  }

  makeMoneyTransfer(double money) {
    emit(HomeLoading());
    Future.delayed(const Duration(seconds: 2), () {
      final result = lowerBalance(money);
      if (!result) {
        emit(HomePaymentUnSucces());
        return;
      }
      emit(HomePaymentSucces());
    });
  }

  String generateRandomCardNumber() {
    String cardNumber = '';
    for (int i = 0; i < 16; i++) {
      cardNumber += Random().nextInt(9).toString();
    }
    return cardNumber;
  }
}
