import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkelentonizerLoading extends StatelessWidget {
  const SkelentonizerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.only(top: 10.0),
          margin: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  height: 20,
                  width: double.infinity,
                  color: Colors.deepPurple.shade300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 30, bottom: 5),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 20,
                    width: 100,
                    color: Colors.deepPurple.shade300,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 6,
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        label: Container(
                          height: 20,
                          width: 50,
                          color: Colors.deepPurple.shade300,
                        ),
                        backgroundColor: Colors.transparent,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(
                            vertical: 1, horizontal: 6),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 1),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
