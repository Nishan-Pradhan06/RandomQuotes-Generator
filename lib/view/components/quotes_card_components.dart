import 'package:flutter/material.dart';
import 'package:learngin/core/theme/colors.dart';
import 'package:learngin/providers/quotes_providers.dart';
import 'package:learngin/view/components/error.dart';
import 'package:learngin/view/components/skelentonizer.dart';
import 'package:provider/provider.dart';

class QuotesCardComponents extends StatelessWidget {
  const QuotesCardComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final quotesProvider = Provider.of<QuotesProviders>(context);
    return quotesProvider.isLoading
        ? const SkelentonizerLoading()
        : quotesProvider.error.isNotEmpty
            ? ErrorCard(errorMessage: quotesProvider.error)
            : IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  margin:
                      const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Text(
                          quotesProvider.quotes.content,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .4,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, right: 30, bottom: 5),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "- ${quotesProvider.quotes.author}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 6,
                          children: quotesProvider.quotes.tags.map((tag) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Chip(
                                label: Text(
                                  tag,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                backgroundColor: BrandColors.primary,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 6),
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}
