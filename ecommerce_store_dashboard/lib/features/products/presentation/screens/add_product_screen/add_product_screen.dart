import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:ecommerce_store_dashboard/core/helper/app_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/add_product_cubit.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductPage();
}

class _AddProductPage extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AddProductCubit, AddProductState>(
        listener: (context, state) {
          if (state is AddProductSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.addProductEntity.message,
                  // style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 3),
              ),
            );
          } else if (state is AddProductError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(24),
          child: const ProductForm(),
        ),
      ),
    );
  }
}

class ProductForm extends StatelessWidget {
  const ProductForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = context.read<AddProductCubit>().formKey;
    return Form(
      key: formKey,
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderTitle(),
            SizedBox(height: 32),
            FormBody(),
            SizedBox(height: 32),
            AddButton(),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = context.read<AddProductCubit>().formKey;
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 48,
            vertical: 16,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            context.read<AddProductCubit>().addProductTrigger(11);
          }
        },
        child: const Text(
          'Save Product',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class FormBody extends StatelessWidget {
  const FormBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GeneralProductInfo(),
        ),
        SizedBox(width: 32),
        Expanded(
          child: DetailsAndPhotos(),
        ),
      ],
    );
  }
}

class DetailsAndPhotos extends StatelessWidget {
  const DetailsAndPhotos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProductsdetailsSection(),
        const SizedBox(height: 32),
        BlocBuilder<AddProductCubit, AddProductState>(
          builder: (context, state) {
            log("should rebuild here");
            return const ProductImagesSection();
          },
        ),
      ],
    );
  }
}

class ProductImagesSection extends StatelessWidget {
  const ProductImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return buildSection(
      title: 'Images',
      children: [
        BlocBuilder<AddProductCubit, AddProductState>(
          builder: (context, state) {
            final mainImage = context.read<AddProductCubit>().mainImage;
            final subImages = context.read<AddProductCubit>().subImages;
            final imageUrls = context.read<AddProductCubit>().imageUrls;
            return buildImageUpload(
              label: 'Main Image',
              isMain: true,
              context: context,
              mainImage: mainImage,
              imageUrls: imageUrls,
              subImages: subImages,
            );
          },
        ),
        const SizedBox(height: 16),
        BlocBuilder<AddProductCubit, AddProductState>(
          builder: (context, state) {
            final mainImage = context.read<AddProductCubit>().mainImage;
            final subImages = context.read<AddProductCubit>().subImages;
            final imageUrls = context.read<AddProductCubit>().imageUrls;
            return buildImageUpload(
              label: 'Sub Images (up to 7)',
              isMain: false,
              context: context,
              mainImage: mainImage,
              imageUrls: imageUrls,
              subImages: subImages,
            );
          },
        ),
      ],
    );
  }
}

class ProductsdetailsSection extends StatelessWidget {
  const ProductsdetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return buildSection(
      title: 'Product Details',
      children: [
        buildTextField(
          controller: context.read<AddProductCubit>().priceController,
          label: 'Price',
          keyboardType: TextInputType.number,
          validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
        ),
        const SizedBox(height: 16),
        buildTextField(
          controller: context.read<AddProductCubit>().quantityController,
          label: 'Quantity',
          keyboardType: TextInputType.number,
          validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
        ),
      ],
    );
  }
}

class GeneralProductInfo extends StatelessWidget {
  const GeneralProductInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EnglishInformationSection(),
        SizedBox(height: 32),
        ArabicInformationSection(),
      ],
    );
  }
}

class ArabicInformationSection extends StatelessWidget {
  const ArabicInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final arCategories = context.read<AddProductCubit>().arCategories;
    final selectedArCategory = context.read<AddProductCubit>().selectedArCategory;
    return buildSection(
      title: 'Arabic Information',
      children: [
        buildTextField(
          controller: context.read<AddProductCubit>().nameArController,
          label: 'Product Name (Arabic)',
          textDirection: TextDirection.rtl,
          validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
        ),
        const SizedBox(height: 16),
        buildDropdown(
          label: 'Category (Arabic)',
          value: selectedArCategory,
          items: arCategories,
          onChanged: (value) {
            context.read<AddProductCubit>().updateArabicDropDownBox(value);
          },
        ),
        const SizedBox(height: 16),
        buildTextField(
          controller: context.read<AddProductCubit>().descArController,
          label: 'Description (Arabic)',
          maxLines: 4,
          textDirection: TextDirection.rtl,
          validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
        ),
      ],
    );
  }
}

class EnglishInformationSection extends StatelessWidget {
  const EnglishInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.read<AddProductCubit>().enCategories;
    final selectedEnCategory = context.read<AddProductCubit>().selectedEnCategory;
    return buildSection(
      title: 'English Information',
      children: [
        buildTextField(
          controller: context.read<AddProductCubit>().nameEnController,
          label: 'Product Name (English)',
          validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
        ),
        const SizedBox(height: 16),
        buildDropdown(
          label: 'Category (English)',
          value: selectedEnCategory,
          items: categories,
          onChanged: (value) {
            context.read<AddProductCubit>().updateEnglishDropDownBox(value);
          },
        ),
        const SizedBox(height: 16),
        buildTextField(
          controller: context.read<AddProductCubit>().descEnController,
          label: 'Description (English)',
          maxLines: 4,
          validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
        ),
      ],
    );
  }
}

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Add New Product',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
