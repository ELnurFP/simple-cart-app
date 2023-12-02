import 'package:azercell_task_application/foundation/state_logic/cubits/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoneyTransferFields extends StatelessWidget {
  MoneyTransferFields({
    super.key,
  });
  final cardNumber = TextEditingController();
  final moneyAmount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.read<HomeCubit>().readyTransferStream,
        builder: (context, snapshot) {
          return snapshot.data == true
              ? Column(
                  children: [
                    TextFormField(
                      controller: cardNumber,
                      decoration: const InputDecoration(
                        labelText: 'Enter Card Number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                      controller: moneyAmount,
                      decoration: const InputDecoration(
                        labelText: 'Enter Money Amount',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () {
                        double.tryParse(moneyAmount.text) != null
                            ? context.read<HomeCubit>().makeMoneyTransfer(
                                  double.tryParse(moneyAmount.text)!,
                                )
                            : ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please enter a valid number',
                                  ),
                                ),
                              );
                      },
                      child: const Text('Make Money Transfer'),
                    ),
                    const SizedBox(height: 12.0),
                    TextButton(
                        onPressed: () {
                          context.read<HomeCubit>().updateReadyTransfer();
                        },
                        child: const Text('Back'))
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    context.read<HomeCubit>().updateReadyTransfer();
                  },
                  child: const Text('Make Money Transfer'),
                );
        });
  }
}
