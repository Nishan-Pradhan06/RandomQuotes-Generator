import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learngin/core/theme/colors.dart';
import 'package:learngin/providers/quotes_providers.dart';
import 'package:provider/provider.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<QuotesProviders>(
        builder: (context, quoteProvider, child) {
          return ElevatedButton(
            style: ButtonStyle(
              animationDuration: const Duration(milliseconds: 200),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              backgroundColor: WidgetStateProperty.all(
                BrandColors.primary,
              ),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            onPressed: () {
              quoteProvider.getDataFromAPI();
            },
            child: Text(
              "Generate",
              style: GoogleFonts.poppins(),
            ),
          );
        },
      ),
    );
  }
}
