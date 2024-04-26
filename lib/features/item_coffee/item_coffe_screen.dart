import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/images.dart';
import 'package:coffee_shop/features/item_coffee/state/bloc/item_coffee_bloc.dart';
import 'package:coffee_shop/features/item_coffee/widget/counter_coffee_widget.dart';
import 'package:coffee_shop/features/item_coffee/widget/size_coffee_widget.dart';
import 'package:coffee_shop/features/item_coffee/widget/sugar_coffee_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCoffeeScreen extends StatelessWidget {
  const ItemCoffeeScreen({super.key, required this.nameCoffee});
  final String nameCoffee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // TODO Нужно передавать название кофе
        title: Text(nameCoffee),
      ),
      body: Stack(
        children: [
          Image.asset('images/background.png'),
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                    maxWidth: 200,
                  ),
                  child: latte,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Macchiato',
                            style: Theme.of(context).textTheme.headlineSmall!,
                          ),
                          const Spacer(),
                          Text(
                            '100 ₽',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: primary),
                          ),
                          const SizedBox(width: 10),
                          const CounterCoffeeWidget(),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Размер',
                            style: Theme.of(context).textTheme.headlineSmall!,
                          ),
                          const Spacer(),
                          const SizeCoffeeWidget()
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Сахар',
                            style: Theme.of(context).textTheme.headlineSmall!,
                          ),
                          const Spacer(),
                          const SugarCoffeeWidget(),
                        ],
                      ),
                      const Spacer(),
                      BlocBuilder<ItemCoffeeBloc, ItemCoffeeState>(
                        builder: (context, state) {
                          return Text(
                            'Итог:  ${state.totalPrice} ₽',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: primary,
                                ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('AddToCart'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}