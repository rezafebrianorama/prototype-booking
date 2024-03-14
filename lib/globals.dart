library apps_booking.globals;

import 'package:flutter/material.dart';

const username = 'admin';
const password = '123456';
const primaryColor = Color.fromARGB(255, 36, 120, 189);

dynamic listSearch = {
  'last_seen': [
    {'id': 1, 'nama': 'Bali'},
    {'id': 2, 'nama': 'Lombok'}
  ],
  'populer': [
    {
      'id': 1,
      'nama': 'bali',
      'keterangan': 'jl. bali indah 1',
      'image': 'assets/images/bali.jpeg'
    },
    {
      'id': 2,
      'nama': 'lombok',
      'keterangan': 'jl. lombok indah 1',
      'image': 'assets/images/lombok.jpeg'
    },
    {
      'id': 1,
      'nama': 'jogja',
      'keterangan': 'jl. jogja indah 1',
      'image': 'assets/images/jogja.jpeg'
    }
  ]
};

List homeList = [
  {
    'id': 1,
    'image': 'assets/images/bali.jpeg',
    'nama': 'Bali Indah Kota Bali',
    'lokasi': 'Bali',
    'rating': '4.9',
    'price': '500.000'
  },
  {
    'id': 2,
    'image': 'assets/images/lombok.jpeg',
    'nama': 'Lombok Indah Penginapan',
    'lokasi': 'Lombok',
    'rating': '4.8',
    'price': '800.000'
  },
  {
    'id': 3,
    'image': 'assets/images/jogja.jpeg',
    'nama': 'Jogja Indah Penginapan',
    'lokasi': 'Jogja',
    'rating': '4.7',
    'price': '450.000'
  },
];

List promo = [
  {
    'id': 1,
    'image': 'assets/images/banner.jpeg',
  },
  {
    'id': 2,
    'image': 'assets/images/banner.jpeg',
  },
  {
    'id': 3,
    'image': 'assets/images/banner.jpeg',
  },
];
