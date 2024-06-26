part of 'basket_coffee_bloc.dart';

@immutable
sealed class BasketCoffeeEvent {}

final class BasketCoffeeAddEvent extends BasketCoffeeEvent {
  final ItemCoffeeEntity item;

  BasketCoffeeAddEvent({required this.item});
}

final class BasketCoffeeDeleteEvent extends BasketCoffeeEvent {
  final ItemCoffeeEntity item;

  BasketCoffeeDeleteEvent({required this.item});
}

final class BasketCoffeeUpdateEvent extends BasketCoffeeEvent {
  final ItemCoffeeEntity itemOld;
  final ItemCoffeeEntity itemNew;

  BasketCoffeeUpdateEvent({
    required this.itemNew,
    required this.itemOld,
  });
}
