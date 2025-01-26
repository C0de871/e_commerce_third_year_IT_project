import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/entities/show_store_entities/products_entity.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/entities/show_store_entities/show_store_entity.dart';
import 'package:ecommerce_store_dashboard/features/products/presentation/show_store_cubit/show_store_cubit.dart';
import 'package:ecommerce_store_dashboard/storing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailsView extends StatefulWidget {
  const StoreDetailsView({
    super.key,
  });

  @override
  State<StoreDetailsView> createState() => _StoreDetailsViewState();
}

class _StoreDetailsViewState extends State<StoreDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ShowStoreCubit>(context).showStoreTrigger(11);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShowStoreCubit, ShowStoreState>(
        builder: (context, state) {
          if (state is ShowStoreSuccess) {
            final store = state.showStoreEntity;
            final products = store.products;
            return LayoutBuilder(
              builder: (context, constraints) {
                return CustomScrollView(
                  slivers: [
                    // Responsive App Bar
                    SliverAppBar(
                      expandedHeight: ResponsiveLayout.isMobile(context) ? 200.0 : 250.0,
                      pinned: true,
                      flexibleSpace: _buildFlexibleSpaceBar(context, store),
                    ),

                    // Store Information Section
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(
                          ResponsiveLayout.isMobile(context) ? 8.0 : 16.0,
                        ),
                        child: _buildStoreDetailsCard(context, store),
                      ),
                    ),

                    // Products Section Title
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Our Products',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),

                    // Responsive Products Grid
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: ResponsiveLayout.getGridColumnCount(context),
                          childAspectRatio: ResponsiveLayout.getCardAspectRatio(context),
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return ProductDetailCard(product: products[index]);
                          },
                          childCount: products.length,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (state is ShowStoreFailed) {
            return Center(
              child: Text(state.msg),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildFlexibleSpaceBar(BuildContext context, ShowStoreEntity store) {
    return FlexibleSpaceBar(
      title: Text(
        store.name,
        style: TextStyle(
          fontSize: ResponsiveLayout.isMobile(context) ? 16 : 20,
          shadows: const [
            Shadow(
              blurRadius: 10.0,
              color: Colors.black45,
              offset: Offset(2.0, 2.0),
            )
          ],
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      background: _buildStoreHeaderBackground(store),
    );
  }

  Widget _buildStoreHeaderBackground(ShowStoreEntity store) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: store.imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.grey[300],
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey[200],
            child: const Icon(Icons.storefront, size: 100, color: Colors.grey),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStoreDetailsCard(BuildContext context, ShowStoreEntity store) {
    return Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Store Information',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 16),
            _buildDetailRow(
              context,
              icon: Icons.location_on,
              label: 'Address',
              value: store.location,
            ),
            _buildDetailRow(
              context,
              icon: Icons.email,
              label: 'Contact Email',
              value: store.email,
            ),
            _buildDetailRow(
              context,
              icon: Icons.phone,
              label: 'Phone',
              value: store.phoneNumber,
            ),
            const SizedBox(height: 16),
            Text(
              store.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailCard extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = ResponsiveLayout.isMobile(context);
        final bool isTablet = ResponsiveLayout.isTablet(context);
        final bool isDesktop = ResponsiveLayout.isDesktop(context);
        return Card(
          elevation: 3,
          color: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Responsive Image
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  child: CachedNetworkImage(
                    httpHeaders: const {
                      'Access-Control-Allow-Origin': '*',
                    },
                    imageUrl: product.mainImage,
                    height: _getImageHeight(context),
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: _getImageHeight(context),
                      color: Colors.grey[300],
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ),
                    // errorWidget: (context, url, error) => Container(
                    //   height: _getImageHeight(context),
                    //   color: Colors.grey[200],
                    //   child: const Icon(Icons.image_not_supported, size: 30),
                    // ),
                  ),
                ),
              ),

              // Responsive Product Details
              Padding(
                padding: EdgeInsets.all(isMobile ? 6.0 : 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Product Name and Description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productName,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 12 : 14,
                              ),
                          maxLines: isDesktop ? 2 : 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.description,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                                fontSize: isMobile ? 10 : 12,
                              ),
                          maxLines: isDesktop ? 2 : 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                    // Price and Inventory
                    Column(
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${product.price}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 12 : 14,
                                  ),
                            ),
                            _buildInventoryChip(),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.categoryName,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: isMobile ? 9 : 10,
                                  ),
                            ),
                            Text(
                              'SKU: ${product.productId}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey[500],
                                    fontSize: isMobile ? 9 : 10,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  double _getImageHeight(BuildContext context) {
    if (ResponsiveLayout.isMobile(context)) return 100;
    if (ResponsiveLayout.isTablet(context)) return 110;
    return 120;
  }

  Widget _buildInventoryChip() {
    Color chipColor;
    String chipText;

    if (product.quantity > 20) {
      chipColor = Colors.green;
      chipText = 'In Stock';
    } else if (product.quantity > 0) {
      chipColor = Colors.orange;
      chipText = 'Low Stock';
    } else {
      chipColor = Colors.red;
      chipText = 'Out of Stock';
    }

    return Chip(
      label: Text(
        chipText,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
      backgroundColor: chipColor,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}
