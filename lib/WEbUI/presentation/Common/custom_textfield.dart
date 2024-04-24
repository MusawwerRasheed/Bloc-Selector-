import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final TextStyle? labelStyle; 
  final Widget? suffixIcon;
  final bool? suffixVisible;
  final bool? obscure;
  final String? Function(String?)? validatorValue;

  const CustomTextField({
    Key? key,
    this.obscure,
    this.suffixVisible,
    this.suffixIcon,
    this.borderRadius,
    this.labelStyle, 
    this.validatorValue,
    required this.label, this.borderSide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: borderSide ?? BorderSide(color: Colors.grey[400]!),
          borderRadius: borderRadius ??BorderRadius.circular(15),
        ),
        labelText: label??'mail@example.com',
        labelStyle: labelStyle?? TextStyle(color: Colors.grey),
        suffixIcon:   CustomTextField( label: 'text label'),
      
      ),

    );
  }
}
