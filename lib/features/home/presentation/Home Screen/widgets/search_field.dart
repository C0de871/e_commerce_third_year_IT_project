import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import the generated localization class

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Accessing the localized string for "Search Product"
    String searchProductText = AppLocalizations.of(context)!.searchProduct;

    return Flexible(
      child: Container(
        height: 38,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.75,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          cursorHeight: 20,
          onChanged: (value) {},
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: searchProductText, // Use the localized text here
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.outlineVariant,
              letterSpacing: -1,
            ),
            prefixIcon: const Icon(
              Icons.search,
              size: 24,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 9,
            ),
          ),
        ),
      ),
    );
  }
}
