import 'package:apps_booking/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DetailCheckout extends StatefulWidget {
  const DetailCheckout({super.key});

  @override
  State<DetailCheckout> createState() => _DetailCheckoutState();
}

class _DetailCheckoutState extends State<DetailCheckout> {
  var _ctrlInputDate = TextEditingController(
      text:
          '${DateFormat('dd/MM/yyyy').format(DateTime.now())} - ${DateFormat('dd/MM/yyyy').format(DateTime.now())}');
  DateTime tempSelectedDateFrom = DateTime.now();
  DateTime tempSelectedDateTo = DateTime.now();
  String selectedDateFrom = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String selectedDateTo = DateFormat('dd/MM/yyyy').format(DateTime.now());
  var arg = Get.arguments;
  var rating = double.parse(Get.arguments['rating']).round();

  void viewCalenderDate() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SfDateRangePicker(
                          minDate: DateTime.now(),
                          onSelectionChanged: _onSelectionChanged,
                          selectionMode: DateRangePickerSelectionMode.range,
                          initialSelectedRange: PickerDateRange(
                              DateFormat('dd/MM/yyyy').parse(selectedDateFrom),
                              DateFormat('dd/MM/yyyy').parse(selectedDateTo)),
                          headerHeight: 60,
                          headerStyle: const DateRangePickerHeaderStyle(
                              backgroundColor: primaryColor,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5)),
                        ),
                        TextButton(
                            onPressed: () {
                              selectedDateFrom = DateFormat('dd/MM/yyyy')
                                  .format(tempSelectedDateFrom)
                                  .toString();
                              selectedDateTo = DateFormat('dd/MM/yyyy')
                                  .format(tempSelectedDateTo)
                                  .toString();
                              _ctrlInputDate.text =
                                  '${DateFormat('dd/MM/yyyy').format(tempSelectedDateFrom).toString()} - ${DateFormat('dd/MM/yyyy').format(tempSelectedDateTo).toString()}';
                              Get.back();
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: primaryColor),
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5),
                            ))
                      ],
                    )),
              ],
            );
          });
        }).then((value) {
      setState(() {});
    });
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        tempSelectedDateFrom = args.value.startDate;
        tempSelectedDateTo = args.value.endDate ?? args.value.startDate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(arg);
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: ListView(
        children: [
          Image.asset(
            arg['image'],
            fit: BoxFit.cover,
            height: Get.height / 4,
            width: Get.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              arg['nama'],
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: primaryColor),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.only(right: 10),
                  child: const Text(
                    'Penginapan',
                    style: TextStyle(fontSize: 12, color: primaryColor),
                  ),
                ),
                for (int d = 0; d < rating; d++)
                  Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                    size: 13,
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  size: 13,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    arg['lokasi'],
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              thickness: 1,
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Icon(
                        Icons.local_parking,
                        color: primaryColor,
                      ),
                      Text(
                        'Parking',
                        style: TextStyle(fontSize: 13, color: primaryColor),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.ac_unit,
                        color: primaryColor,
                      ),
                      Text(
                        'AC',
                        style: TextStyle(fontSize: 13, color: primaryColor),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.no_meals,
                        color: primaryColor,
                      ),
                      Text(
                        'Sarapan',
                        style: TextStyle(fontSize: 13, color: primaryColor),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.water,
                        color: primaryColor,
                      ),
                      Text(
                        'Kolam',
                        style: TextStyle(fontSize: 13, color: primaryColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
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
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Text('Pilih Tanggal'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: primaryColor),
                borderRadius: BorderRadius.circular(6)),
            height: 45,
            child: Row(
              children: [
                Container(
                  color: primaryColor,
                  width: 45,
                  child: const Center(
                    child: Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    viewCalenderDate();
                  },
                  child: Text(
                    _ctrlInputDate.text,
                    style: const TextStyle(color: Colors.black54),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      persistentFooterAlignment: AlignmentDirectional.centerStart,
      persistentFooterButtons: [
        SizedBox(
          height: 60,
          width: (Get.width / 2) - 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Harga/malam mulai dari',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                'Rp ${arg['price']}',
                style: TextStyle(color: Colors.red[200]),
              ),
              const Text(
                'Termasuk pajak',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              )
            ],
          ),
        ),
        SizedBox(
          height: 60,
          width: (Get.width / 2) - 12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: Container()),
              TextButton(
                onPressed: () {
                  Get.toNamed('/detail-pesanan', arguments: arg);
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange[700],
                    foregroundColor: Colors.white,
                    minimumSize: const Size(120, 40)),
                child: const Text('Pesan'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
