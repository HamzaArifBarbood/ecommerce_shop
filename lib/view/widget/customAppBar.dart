import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String textsearchfild;
  final bool isHidden;
  final void Function()? onPressedSearch;
  
  const CustomAppBar({super.key, this.onPressedSearch, required this.textsearchfild, required this.isHidden});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed:onPressedSearch,
                    icon: const Icon(Icons.search),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  hintText: textsearchfild,
                  hintStyle: const TextStyle(fontSize: 18),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () {
                  
                },
                icon: Icon(
                  color: Colors.grey[600],
                  Icons.notifications_active_outlined,
                  size: 30,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
        
        ],
      ),
    );
  }
}
