import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../providers/network_provider.dart';

class NoInternetScreen extends ConsumerWidget {
  final VoidCallback onRetry;

  const NoInternetScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// 🌐 Icon
              Icon(
                Icons.wifi_off,
                size: 100,
                color: AppColors.primary,
              ),

              const SizedBox(height: 20),

              /// Title
              Text(
                AppStrings.noInternet,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 10),

              /// Subtitle
              const Text(
                "Please check your connection and try again.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 30),

              /// Retry Button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: AppStrings.retry,
                  onPressed: () async {
                    final isConnected =
                        await ref.read(networkStatusProvider.future);

                    if (isConnected) {
                      onRetry();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Still no internet"),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
