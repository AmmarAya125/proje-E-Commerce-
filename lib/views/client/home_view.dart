import 'package:flutter/material.dart';
import '../../providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../client/product_details_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProductProvider>(context, listen: false)
          .fetchAndSetProducts()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;

    return Scaffold(
      appBar: AppBar(title: Text('Produits')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(product.imageUrl, width: 50),
                  title: Text(product.name),
                  subtitle: Text('${product.price} DT'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsView(product: product),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
