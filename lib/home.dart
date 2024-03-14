import 'package:apps_booking/globals.dart';
import 'package:apps_booking/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
  }

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  _pagesScreen(int idxTab) {
    if (idxTab == 0) {
      return viewBeranda();
    } else if (idxTab == 1) {
      return viewPesanan();
    } else if (idxTab == 2) {
      return viewAkunSaya();
    }
  }

  viewBeranda() {
    return ListView(
      children: [
        // SALDO DAN POINT
        Card(
          elevation: 10,
          margin:
              const EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.confirmation_num,
                              color: primaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Point Saya')
                          ],
                        ),
                        const Text(
                          '2.000',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.attach_money,
                              color: primaryColor,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text('Saldo Saya')
                          ],
                        ),
                        const Text(
                          'Rp 500.000',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // TERAKHIR DILIHAT
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Terakhir Dilihat'),
        ),
        SizedBox(
          height: 215,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 10, right: 10),
            children: [
              for (int q = 0; q < homeList.length; q++)
                Card(
                  margin: const EdgeInsets.only(bottom: 10, left: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/detail-checkout', arguments: homeList[q]);
                    },
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              homeList[q]['image'],
                              height: 120,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, top: 8),
                            child: Text(
                              homeList[q]['nama'],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, top: 3),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[700],
                                  size: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(
                                    '${homeList[q]['rating']}/5',
                                    style: const TextStyle(
                                        color: primaryColor, fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, top: 3),
                            child: Text(
                              'Rp ${homeList[q]['price']}',
                              style: TextStyle(
                                  color: Colors.red[300], fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        // PROMO BULAN INI
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 6),
          padding: const EdgeInsets.only(bottom: 15),
          color: const Color.fromARGB(255, 226, 235, 244),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Promo Bulan ini'),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  children: [
                    for (int z = 0; z < promo.length; z++)
                      Card(
                          margin: const EdgeInsets.only(bottom: 10, left: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 4,
                          child: SizedBox(
                            width: 300,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                promo[z]['image'],
                                height: 100,
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                  ],
                ),
              ),
            ],
          ),
        ),
        // REKOMENDASI
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Rekomendasi untuk anda'),
        ),
        SizedBox(
          height: 215,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 10, right: 10),
            children: [
              for (int q = 0; q < homeList.length; q++)
                Card(
                  margin: const EdgeInsets.only(bottom: 10, left: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/detail-checkout', arguments: homeList[q]);
                    },
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              homeList[q]['image'],
                              height: 120,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, top: 8),
                            child: Text(
                              homeList[q]['nama'],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, top: 3),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[700],
                                  size: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(
                                    '${homeList[q]['rating']}/5',
                                    style: const TextStyle(
                                        color: primaryColor, fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, top: 3),
                            child: Text(
                              'Rp ${homeList[q]['price']}',
                              style: TextStyle(
                                  color: Colors.red[300], fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }

  viewPesanan() {
    return ListView(
      children: [
        for (int f = 0; f < homeList.length; f++)
          Card(
            elevation: 6,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xfff5f5f5)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Get.toNamed('/detail-pesanan', arguments: homeList[f]);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        homeList[f]['image'],
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: primaryColor),
                              borderRadius: BorderRadius.circular(90)),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(bottom: 8),
                          child: const Text(
                            'Penginapan',
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                        Row(
                          children: const [
                            SizedBox(
                                width: 40,
                                child: Icon(
                                  Icons.access_time_filled_sharp,
                                  color: primaryColor,
                                )),
                            Text('14/03/2024 - 15/03/2024')
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const SizedBox(
                                width: 40,
                                child: Icon(
                                  Icons.attach_money,
                                  color: primaryColor,
                                )),
                            Text('Rp ${homeList[f]['price']}')
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }

  viewAkunSaya() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset('assets/images/animate_one.json', height: 150),
        ),
        const Text(
          'Sayangnya anda belum login...',
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: () {
              Get.toNamed('/login');
            },
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                    letterSpacing: 1.5, fontWeight: FontWeight.w600)),
            child: const Text('Masuk'))
      ],
    );
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // });
  }

  Future<T> showFloatingModalBottomSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    Color? backgroundColor,
  }) async {
    final result = await showCustomModalBottomSheet(
        context: context,
        builder: builder,
        containerWidget: (_, animation, child) => FloatingModal(
              child: child,
            ),
        expand: false);

    return result;
  }

  Future<void> searchModal(BuildContext context) async {
    dynamic result = {};
    result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchScreen(listSearch: listSearch),
      ),
    );
    if (result != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          title: Row(children: [
            Expanded(
              child: TextField(
                readOnly: true,
                onTap: () {
                  searchModal(context);
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'search',
                    hintStyle: const TextStyle(
                        color: Colors.black45, letterSpacing: 1.2),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.white, width: 0.8),
                    ),
                    prefixIcon: IconButton(
                        color: Colors.black45,
                        iconSize: 30,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                        ))),
              ),
            ),
            const SizedBox(
              width: 40,
              child: Icon(
                Icons.notifications,
                size: 30,
              ),
            )
          ]),
        ),
      ),
      body: Center(child: _pagesScreen(_selectedTab)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Pesanan"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun Saya"),
        ],
      ),
    );
  }
}

class FloatingModal extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const FloatingModal({Key? key, required this.child, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Material(
          color: backgroundColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    );
  }
}
