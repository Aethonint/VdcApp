import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;

    
    final buttonWidth = screenWidth * 0.4; 
    final minButtonHeight = buttonWidth * 0.75; 

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: buttonWidth,
        constraints: BoxConstraints(
          minHeight: minButtonHeight, 
        ),
        padding: EdgeInsets.all(buttonWidth * 0.12), 
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 1, 59, 107),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFDFDFDF)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 35,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: buttonWidth * 0.18, 
            ),
            SizedBox(height: buttonWidth * 0.07),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: buttonWidth * 0.08, 
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.visible, 
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
