import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class InsightsCard extends StatelessWidget {
  final String titlePrimary;
  final String titleSecondry;
  final String subtitle;
  final String? value;
  final Color? valueColor;
  final double? progress;
  final String? progressLabel;
  final String? progressEndLabel;

  const InsightsCard({
    super.key,
    required this.titlePrimary,
    required this.titleSecondry,
    required this.subtitle,
    this.value,
    this.valueColor,
    this.progress,
    this.progressLabel,
    this.progressEndLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppTheme.borderColor,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text(
                  titlePrimary,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'mulish',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    titleSecondry,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 16,
                      fontFamily: 'mulish',
  
                    ),
                  ),
                ),
              ],),
             
              if (value != null) ...[
              
                Row(
                  children: [
                      if (valueColor == AppTheme.weightPositiveColor) ...[
                      const SizedBox(width: 4),
                      Image.asset(
                        'assets/icons/arrow.png',   
                        width: 16,
                        height: 16,
                      ),
                  
                    ],
                    Text(
                      value!,
                      style: TextStyle(
                        color: valueColor ?? AppTheme.textSecondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  
                  ],
                ),
                const SizedBox(height: 2),
              ],
                
                 if (subtitle == "") ...[
              const  Padding(
                  padding:  EdgeInsets.only(top: 6),
                  child:  Text(
                        'Weight',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'mulish',
                        ),
                      
                    ),
                ),
                ],
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
         
          if (progress != null) ...[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (progressLabel != null)
                      Text(
                        progressLabel!,
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    if (progressEndLabel != null)
                      Text(
                        progressEndLabel!,
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                     
                  ],
                  
                ),
            const   Padding(
                 padding:  EdgeInsets.only(bottom: 12),
                 child:  GradientProgressBar(value: 0.33, height: 4.0),
               ), 

              ],
            ),
          ],

       
        ],
      ),
    );
  }
}


class GradientProgressBar extends StatelessWidget {
  final double value; // 0.0 - 1.0
  final double height;
  final BorderRadius borderRadius;

  const GradientProgressBar({
    Key? key,
    required this.value,
    this.height = 4,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double clamped = value.clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
         
          // Background (unfilled) - white
          Container(
            height: height,
            color:const Color(0xFF464646),
          ),

          // Filled portion with gradient, width based on value
          Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: clamped,
              child: Container(
                height: height,
                // Use a ShaderMask to paint a gradient on the filled container
                decoration: const BoxDecoration(
                  // keep container transparent — gradient is applied via BoxDecoration gradient
                ),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF7BBDE2),
                        Color(0xFF69C0B1),
                        Color(0xFF60C198),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}