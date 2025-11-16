import 'package:flutter/material.dart';
import 'package:basic_app/screens/send_money_page.dart';
import 'package:basic_app/screens/transaction_history_page.dart';
import 'package:basic_app/widgets/custom_page_route.dart';
import 'package:basic_app/screens/homescreen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _pressedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isWeb = width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w900,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => _confirmLogout(),
            color: Colors.red,
          ),
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "What would you like to do today?",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 30),

              // ——————— Cards Section ———————————

              GridView.count(
                crossAxisCount: isWeb ? 3 : 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.15,

                children: [
                  _buildDashboardCard(
                    index: 0,
                    icon: Icons.send,
                    label: "Send Money",
                    color: Colors.blueAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        CustomPageRoute(child: const SendMoneyPage()),
                      );
                    },
                  ),

                  _buildDashboardCard(
                    index: 1,
                    icon: Icons.account_balance_wallet,
                    label: "Wallet",
                    color: Colors.green,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Wallet page coming soon")),
                      );
                    },
                  ),

                  _buildDashboardCard(
                    index: 2,
                    icon: Icons.history,
                    label: "Transaction History",
                    color: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        CustomPageRoute(child: const TransactionHistoryPage()),
                      );
                    },
                  ),

                  _buildDashboardCard(
                    index: 3,
                    icon: Icons.settings,
                    label: "Settings",
                    color: Colors.purple,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Settings page coming soon")),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ————————————————————————————————————————————————————————
  // 🔹 Dashboard Card Widget With Animation
  // ————————————————————————————————————————————————————————

  Widget _buildDashboardCard({
    required int index,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    final bool isPressed = _pressedIndex == index;

    return GestureDetector(
      onTapDown: (_) {
        setState(() => _pressedIndex = index);
      },
      onTapUp: (_) {
        setState(() => _pressedIndex = -1);
        onTap();
      },
      onTapCancel: () => setState(() => _pressedIndex = -1),

      child: AnimatedScale(
        scale: isPressed ? 0.93 : 1.0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,

        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ————————————————————————————————————————————————————————
  // 🔹 Logout Confirmation Dialog
  // ————————————————————————————————————————————————————————

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Cancel
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Navigate to HomeScreen and remove all previous routes
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false,
              );
            },
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
