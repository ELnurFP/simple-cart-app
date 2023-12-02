import 'package:azercell_task_application/foundation/models/data_containers/debit_cart.dart';
import 'package:azercell_task_application/foundation/state_logic/cubits/home/home_cubit.dart';
import 'package:azercell_task_application/foundation/state_logic/vanilla_blocs/app_bloc.dart';
import 'package:azercell_task_application/presentation/screens/home/widgets/debit_cart.dart';
import 'package:azercell_task_application/presentation/screens/home/widgets/money_transfer_fields.dart';
import 'package:azercell_task_application/utilities/exports/functions.dart';
import 'package:azercell_task_application/utilities/exports/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  HomeCubit get _cubit => HomeCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _cubit,
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomePaymentSucces) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Payment Succesful',
                ),
              ),
            );
          } else if (state is HomePaymentUnSucces) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'Payment Unsuccesful: Insufficient Balance',
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: state is HomeLoading
                ? const LoadingIndicator()
                : _buildBody(context),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    AppBloc appBloc = getIt<AppBloc>();

    return AppBar(
      title: Text(
        'Hi, ${appBloc.userInfo?.name ?? ''}!',
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const AnimatedDebitCard(),
          const SizedBox(height: 24.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<HomeCubit>().updateDebitCard(
                          DebitCard(
                            cardNumber: context
                                .read<HomeCubit>()
                                .generateRandomCardNumber(),
                          ),
                        );
                  },
                  child: const Text('Generate Card'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<HomeCubit>().updateDebitCard(null);
                  },
                  child: const Text('Remove Card'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          MoneyTransferFields(),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
