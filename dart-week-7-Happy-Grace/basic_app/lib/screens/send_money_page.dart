import 'package:flutter/material.dart';
import 'package:basic_app/widgets/custom_button.dart';
import 'package:basic_app/data/transaction_data.dart';

// Transaction model
class Transaction {
  final String recipient;
  final double amount;
  final String method;
  final bool favorite;
  final DateTime date;

  Transaction({
    required this.recipient,
    required this.amount,
    required this.method,
    this.favorite = false,
    required this.date,
  });
}

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _recipientController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  String _selectedMethod = "Credit Card";
  bool _isFavorite = false;
  bool _showSuccess = false;

  final List<String> _methods = ["Credit Card", "Bank Transfer", "PayPal"];

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _recipientController.dispose();
    _amountController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _sendMoney() {
    if (_formKey.currentState!.validate()) {
      final amount = double.parse(_amountController.text);

      // SAVE TO GLOBAL LIST
      globalTransactions.add(
        Transaction(
          recipient: _recipientController.text.trim(),
          amount: amount,
          method: _selectedMethod,
          favorite: _isFavorite,
          date: DateTime.now(),
        ),
      );

      // Show success animation
      setState(() {
        _showSuccess = true;
      });

      _animationController.forward(from: 0);

      // Reset after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _recipientController.clear();
          _amountController.clear();
          _isFavorite = false;
          _showSuccess = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 400) width = 400;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Send Money",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w900,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[800],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Recipient
                    TextFormField(
                      controller: _recipientController,
                      decoration: InputDecoration(
                        hintText: "Recipient Name",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Recipient name is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Amount
                    TextFormField(
                      controller: _amountController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: "Amount",
                        prefixIcon: const Icon(Icons.attach_money),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Amount is required";
                        }
                        double? amount = double.tryParse(value);
                        if (amount == null || amount <= 0) {
                          return "Enter a valid positive number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Method Dropdown
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _selectedMethod,
                        items: _methods
                            .map((method) => DropdownMenuItem(
                                  value: method,
                                  child: Text(method),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedMethod = value!;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Favorite Switch
                    SwitchListTile(
                      title: const Text("Mark as Favorite"),
                      value: _isFavorite,
                      onChanged: (value) {
                        setState(() {
                          _isFavorite = value;
                        });
                      },
                    ),

                    const SizedBox(height: 30),

                    // Send Money Button
                    CustomButton(
                      text: "Send Money",
                      onPressed: _sendMoney,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Animated Success
              if (_showSuccess)
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "Transaction Successful!",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


