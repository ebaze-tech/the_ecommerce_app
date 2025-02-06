import 'package:flutter/material.dart';
import 'package:e_commerce_app/pages/cart_page.dart';
import 'package:e_commerce_app/pages/shop_page.dart';
import 'package:e_commerce_app/components/bottom_nav_bar.dart';

class HomePage extends StatefulWidget
{
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
    // this selected index is to control the bottom nav bar
    int _selectedIndex = 0;

    // this method will update our selected index when the user taps on the bottom bar
    void navigateBottomBar(int index)
    {
        setState(()
            {
                _selectedIndex = index;
            }
        );
    }

    // pages to display
    final List<Widget> _pages = [
        // shop page
        const ShopPage(),
        // cart page
        const CartPage()
    ];
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            bottomNavigationBar: BottomNavBar(
                onTabChange: (index) => navigateBottomBar(index)
            ),
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Builder(builder: (context)
                    {
                        return IconButton(
                            icon: const Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Icon(
                                    Icons.menu,
                                    color: Colors.black
                                )
                            ),
                            onPressed: ()
                            {
                                Scaffold.of(context).openDrawer();
                            }
                        );
                    }
                )
            ),
            drawer: Drawer(
                backgroundColor: Colors.grey[900],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Column(
                            children: [
                                // logo
                                DrawerHeader(
                                    child: Image.asset(
                                        'lib/images/NikeLogo.jpg'
                                    // color: Colors.white
                                    )
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                    child: Divider(
                                        color: Colors.grey[800]
                                    )
                                ),

                                const Padding(
                                    padding: EdgeInsets.only(left: 25.0),
                                    child: ListTile(
                                        leading: Icon(
                                            Icons.home,
                                            color: Colors.white
                                        ),
                                        title: Text(
                                            "Home",
                                            style: TextStyle(color: Colors.white)
                                        )
                                    )
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 25.0),
                                    child: ListTile(
                                        leading: Icon(
                                            Icons.info_rounded,
                                            color: Colors.white
                                        ),
                                        title: Text(
                                            "About",
                                            style: TextStyle(color: Colors.white)
                                        )
                                    )
                                )
                            ]
                        ),
                        const Padding(
                            padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
                            child: ListTile(
                                leading: Icon(
                                    Icons.logout,
                                    color: Colors.white
                                ),
                                title: Text(
                                    "Logout",
                                    style: TextStyle(color: Colors.white)
                                )
                            )
                        )
                    // other pages
                    ]
                )
            ),
            body: _pages[_selectedIndex]
        );
    }
}
