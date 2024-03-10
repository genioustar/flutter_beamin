import 'package:fastcam_flutter_beamin/home/widgets/home_widget.dart';
import 'package:fastcam_flutter_beamin/home/widgets/seller_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _munuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('패캠마트'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
          if (_munuIndex == 0)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
        ],
      ),
      // BottomNavbar에서 선택하면 화면이 바뀌는 기능
      body: IndexedStack(
        index: _munuIndex,
        children: const [
          HomeWidget(),
          SellerWidget(),
        ],
      ),
      floatingActionButton: switch (_munuIndex) {
        0 => FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.shopping_cart_outlined),
          ),
        1 => FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        // TODO: Handle this case.
        _ => Container(),
      },
      bottomNavigationBar: NavigationBar(
        // material3 NavigationBar 스타일로 적용함 bottomNavigationBar써도 됨
        selectedIndex: _munuIndex,
        onDestinationSelected: (value) => setState(
          () {
            _munuIndex = value;
          },
        ),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.store_outlined),
            label: '홈',
          ),
          NavigationDestination(
            icon: Icon(Icons.storefront),
            label: '사장님(판매자)',
          ),
        ],
      ),
    );
  }
}
