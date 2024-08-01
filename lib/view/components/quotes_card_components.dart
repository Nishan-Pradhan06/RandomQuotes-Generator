import 'package:flutter/material.dart';
import 'package:learngin/core/theme/colors.dart';

class QuotesCardComponents extends StatelessWidget {
  const QuotesCardComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.only(top: 10.0),
        margin: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "😃Click 'Generate' for quotes😃",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: .4,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, right: 30, bottom: 5),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "- fgh",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 6,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Chip(
                      label: Text(
                        'Comedy',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      backgroundColor: BrandColors.primary,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                      labelPadding: EdgeInsets.symmetric(horizontal: 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
