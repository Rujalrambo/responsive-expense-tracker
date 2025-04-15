import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  General,
  Food,
  Transportation,
  Entertainment,
  Shopping,
  Rent,
  Utilities,
  Medical,
  Insurance,
  Savings,
  Debt,
  Income,
}

const categoryIcons = {
  Category.General: Icons.category,
  Category.Food: Icons.fastfood,
  Category.Transportation: Icons.directions_car,
  Category.Entertainment: Icons.movie,
  Category.Shopping: Icons.shopping_cart,
  Category.Rent: Icons.home,
  Category.Utilities: Icons.electric_bolt,
  Category.Medical: Icons.medical_services,
  Category.Insurance: Icons.health_and_safety,
  Category.Savings: Icons.savings,
  Category.Debt: Icons.money_off,
  Category.Income: Icons.attach_money,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final DateTime date;
  final String title;
  final double amount;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses =
          allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
