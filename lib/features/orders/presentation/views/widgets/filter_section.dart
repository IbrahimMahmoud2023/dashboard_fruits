import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Row(
        children: [
          Icon(Icons.filter_1_outlined),
          SizedBox(width: 16),
          Text('filter',style: TextStyle(fontSize: 24),),

        ],
      ),
    );
  }
}