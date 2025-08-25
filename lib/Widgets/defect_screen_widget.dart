import 'package:flutter/material.dart';

class DefectCheckCard extends StatefulWidget {
  final String title;
  final bool initialValue;
  final Function(bool)? onChanged;

  const DefectCheckCard({
    super.key,
    required this.title,
    this.initialValue = false,
    this.onChanged,
  });

  @override
  State<DefectCheckCard> createState() => _DefectCheckCardState();
}

class _DefectCheckCardState extends State<DefectCheckCard> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A3C5E), // FleetEdge dark blue
                    ),
                  ),
                ),
                // Instead of tick/cross → use switch
                Switch(
                  value: _value,
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.red.shade200,
                  onChanged: (val) {
                    setState(() => _value = val);
                    if (widget.onChanged != null) {
                      widget.onChanged!(val);
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Add image / notes row
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Add your logic
                  },
                  icon: const Icon(Icons.image, size: 18),
                  label: const Text("Add image"),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: () {
                    // Add your logic
                  },
                  icon: const Icon(Icons.note_add, size: 18),
                  label: const Text("Add notes"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
