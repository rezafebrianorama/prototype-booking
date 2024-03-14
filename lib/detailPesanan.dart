import 'package:apps_booking/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class DetailPesanan extends StatefulWidget {
  const DetailPesanan({super.key});

  @override
  State<DetailPesanan> createState() => _DetailPesananState();
}

class _DetailPesananState extends State<DetailPesanan> {
  var arg = Get.arguments;
  var rating = double.parse(Get.arguments['rating']).round();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(arg['nama']),
            Text(
              '${arg['lokasi']} - Booking Id : Book123',
              style: const TextStyle(fontSize: 12, color: Colors.white),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      arg['image'],
                      fit: BoxFit.cover,
                      height: 90,
                      width: 90,
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
                          Text('Rp ${arg['price']}')
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(thickness: 1),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 20, bottom: 10),
            child: Text('Deskripsi'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.justify,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextButton(
                    onPressed: () {
                      Get.offAllNamed('/home');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrange[700],
                        foregroundColor: Colors.white,
                        minimumSize: const Size(100, 35)),
                    child: Text('Tutup')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
