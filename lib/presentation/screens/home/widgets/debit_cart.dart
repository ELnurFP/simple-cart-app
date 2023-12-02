import 'package:azercell_task_application/foundation/helpers/functions/locator.dart';
import 'package:azercell_task_application/foundation/models/data_containers/debit_cart.dart';
import 'package:azercell_task_application/foundation/state_logic/cubits/home/home_cubit.dart';
import 'package:azercell_task_application/foundation/state_logic/vanilla_blocs/app_bloc.dart';
import 'package:azercell_task_application/utilities/extensions/string_extentions.dart';
import 'package:azercell_task_application/utilities/extensions/widget_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedDebitCard extends StatelessWidget {
  const AnimatedDebitCard({
    super.key,
  });
  AppBloc get _appBloc => getIt<AppBloc>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DebitCard?>(
        stream: context.read<HomeCubit>().debitCardStream,
        builder: (context, snapshot) {
          bool showCard = snapshot.data != null;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 200,
            decoration: BoxDecoration(
              color: showCard ? Colors.pink : Colors.blue,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Center(
              child: showCard
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: context
                              .read<HomeCubit>()
                              .generateRandomCardNumber()
                              .buildRotatedTextWidgets(showCard),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  _appBloc.userInfo?.name ?? '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  _appBloc.userInfo?.surname ?? '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              'Balance:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              '${context.read<HomeCubit>().debitCard?.balance ?? 0.0} AZN',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).padAll(16.0)
                  : ElevatedButton(
                      onPressed: () {
                        context.read<HomeCubit>().updateDebitCard(
                              DebitCard(
                                cardNumber: context
                                    .read<HomeCubit>()
                                    .generateRandomCardNumber(),
                              ),
                            );
                      },
                      child: const Text('Create New Debit Card')),
            ),
          );
        });
  }
}
