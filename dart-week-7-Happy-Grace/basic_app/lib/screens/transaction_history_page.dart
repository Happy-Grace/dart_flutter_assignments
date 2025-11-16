import 'package:flutter/material.dart';
import 'package:basic_app/data/transaction_data.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction History',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: TransactionList(),
    );
  }
}

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width > 600
            ? 600
            : double.infinity,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: globalTransactions.length,
          itemBuilder: (context, index) {
            final tx = globalTransactions[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Icon(
                  tx.favorite ? Icons.star : Icons.monetization_on_outlined,
                  color: tx.favorite ? Colors.amber : Colors.indigo,
                ),
                title: Text(
                  tx.recipient,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  '${tx.method} • ${tx.date.toLocal().toString().split(' ')[0]}',
                ),
                trailing: Text(
                  '\$${tx.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

