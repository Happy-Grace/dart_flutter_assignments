import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;

  CustomPageRoute({required this.child})
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Slide from bottom + fade
            final offsetAnimation =
                Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
                    .animate(animation);
            final fadeAnimation = Tween<double>(begin: 0, end: 1).animate(animation);

            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(opacity: fadeAnimation, child: child),
            );
          },
        );
}


