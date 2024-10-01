import 'package:flutter/material.dart';
import '/router_flutter/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var namauser;
  final List<Map<String, String>> products = [
    {"title": "Laptop ASUS", "image": "laptop.jpg", "price": "Rp 12.000.000"},
    {"title": "Iphone 16", "image": "iphone.jpg", "price": "Rp 15.000.000"},
    {"title": "Smart TV LG", "image": "smarttv.jpg", "price": "Rp 8.000.000"},
    {"title": "Kamera Canon", "image": "kameracanon.jpg", "price": "Rp 7.500.000"},
    {"title": "Keyboard Gaming", "image": "keyboard.jpg", "price": "Rp 1.500.000"},
  ];

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namauser = prefs.getString('username');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat datang, ${namauser ?? "Pengguna"}'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // TODO: Implement cart functionality
            },
          ),
        ],
      ),
      drawer: const Sidemenu(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari produk...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Kategori Populer',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryItem(Icons.laptop, 'Laptop'),
                  _buildCategoryItem(Icons.phone_android, 'Smartphone'),
                  _buildCategoryItem(Icons.tv, 'TV'),
                  _buildCategoryItem(Icons.camera_alt, 'Kamera'),
                  _buildCategoryItem(Icons.keyboard, 'Aksesoris'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Produk Terlaris',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildProductItem(products[index]),
              childCount: products.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.deepPurple.shade100,
            child: Icon(icon, color: Colors.deepPurple),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildProductItem(Map<String, String> product) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            product["image"]!,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(product["title"]!),
        subtitle: Text(product["price"]!),
        trailing: IconButton(
          icon: const Icon(Icons.add_shopping_cart),
          onPressed: () {
            // TODO: Implement add to cart functionality
          },
        ),
      ),
    );
  }
}
