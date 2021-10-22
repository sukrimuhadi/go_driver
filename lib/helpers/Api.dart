// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:kskt_m_petugas/helpers/baseurl.dart';
// import 'dart:convert';
// import 'dart:io';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// //const baseUrl = "http://192.168.100.2/testjson/";
// const baseUrl = "http://103.78.140.243/apdkalselteng/api/";

// class API {
//   Future<List<ListGDPadamtbl>> getListGardu(String jenis) async {
//     List<ListGDPadamtbl> gd = List<ListGDPadamtbl>();

//     String f = "mobile_petapadam_c/get_list_gdpadam?jenis=" + jenis;
//     try {
//       http.Response response = await http.get(baseUrl + f);
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         var res = json.decode(response.body);

//         if (res['statusCode'] == '200') {
//           for (var r in res['data']) {
//             gd.add(ListGDPadamtbl(
//               id: r['id'],
//               name: r['gardu'],
//               locationname: r['alamat'],
//               tglpadam: r['tglpadam'],
//               durasi: r['durasi'],
//               gi: r['gi'],
//               feeder: r['feeder'],
//               zona: r['zona'],
//               section: r['section'],
//               segment: r['segment'],
//             ));
//           }
//         }
//       }
//     } catch (e) {
//       print(e);
//     }
//     return gd;
//   }

//   Future<List<PosGarduPadam>> getPosGardu() async {
//     List<PosGarduPadam> gd = List<PosGarduPadam>();

//     String f = "mobile_petapadam_c/get_pos_gdpadam";
//     try {
//       http.Response response = await http.get(baseUrl + f);
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         var res = json.decode(response.body);
//         String pinpath = "assets/gd_gangguan.png";
//         if (res['statusCode'] == '200') {
//           //print(res['data']);
//           for (var r in res['data']) {
//             // print(r['id']);

//             if (r['jenis'] == 'GANGGUAN') pinpath = "assets/gd_gangguan.png";
//             if (r['jenis'] == 'PEMELIHARAAN')
//               pinpath = "assets/gd_pemeliharaan.png";
//             if (r['jenis'] == 'UFR') pinpath = "assets/gd_ufr.png";
//             if (r['jenis'] == 'BANJIR') pinpath = "assets/gd_banjir.png";
//             // print( r['gardu']);
//             gd.add(PosGarduPadam(
//               id: r['id'],
//               name: r['gardu'],
//               locationname: r['alamat'],
//               lat: double.parse(r['lat']),
//               lon: double.parse(r['lon']),
//               jenis: r['jenis'],
//               tglpadam: r['tglpadam'],
//               durasi: r['durasi'],
//               area: r['area'],
//               pinPath: pinpath,
//               avatarPath: "assets/pln.png",
//               labelColor: Colors.purple,
//               gi: r['gi'],
//               feeder: r['feeder'],
//               zona: r['zona'],
//               section: r['section'],
//               segment: r['segment'],
//             ));
//           }
//         }
//       }
//     } catch (e) {
//       print(e);
//     }
//     return gd;
//   }

//   Future<List<RekapGDPadam>> getRekapGDPadam() async {
//     List<RekapGDPadam> ds = List<RekapGDPadam>();

//     String f = "mobile_petapadam_c/get_rekap_gdpadam";
//     try {
//       http.Response response = await http.get(baseUrl + f);
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         var res = json.decode(response.body);

//         if (res['statusCode'] == '200') {
//           for (var r in res['data']) {
//             // print(r['id']);

//             ds.add(RekapGDPadam(
//               id: r['id'],
//               gangguan: r['gangguan'],
//               pemeliharaan: r['pemeliharaan'],
//               banjir: r['banjir'],
//               lms: r['lms'],
//             ));
//           }
//         }
//       }
//     } catch (e) {
//       print(e);
//     }
//     return ds;
//   }

//   Future<List<PosRTU>> getPosRTU(String group, idArea) async {
//     List<PosRTU> gd = List<PosRTU>();

//     // String f = BaseUrl.petugasGetPengaduan;
//     String jenisken = null;
//     if (group == 'petugas_mobile_roda_2') {
//       jenisken = '2';
//     } else if (group == 'petugas_mobile_roda_4') {
//       jenisken = '4';
//     }

//     if(jenisken == '2' || jenisken == '4'){
//       try {
//       http.Response response = await http.post(BaseUrl.petugasGetPengaduan,
//           headers: {"Content-Type": "application/x-www-form-urlencoded"},
//           body: {"key": "key", "kend_operasional": jenisken, "id_area": idArea, });
//           // print("KKKKKK" +jenisken);
//       // if (response.statusCode == 201 || response.statusCode == 200) {
//       var data = json.decode(response.body);
//       var code = data['code'];
//       var mess = data['mess'];
//       print(mess + ' AMBIL DATA WO');
//       // print(data['result']);
//       String pinpath = "assets/gd_gangguan.png";
//       if (code == '200') {
//         //print(res['data']);
//         for (var r in data['result']) {
//           // print(r['id']);

//           // print( r['id_trans_pengaduan']);
//           gd.add(PosRTU(
//             idTransPengaduan: r['id_trans_pengaduan'],
//             noPengaduan: r['no_pengaduan'],
//             // locationname : r['alamat'],
//             lat: double.parse(r['detail_lat']),
//             lon: double.parse(r['detail_lon']),
//             // jenis : r['tipe_point'],
//             // tipe_point : r['tipe_point'],
//             id_tipe_point: r['id_tipe_point'],
//             // tglawal : r['tglawal'],
//             // tglakhir : r['tglakhir'],
//             // durasi : r['durasi'],
//             status: r['status'],
//             pinPath: pinpath,
//             avatarPath: "assets/pln.png",
//             // labelColor :Colors.purple,
//           ));
//         }
//       }

//       // }
//     } catch (e) {
//       print(e);
//     }
//     }
    
//     return gd;
//   }

//   List<TipeRTU> getTipeRTU() {
//     List<TipeRTU> layerRTU = List<TipeRTU>();

//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration(devicePixelRatio: 2.5), 'assets/5a.png')
//         .then((onValue) {
//       BitmapDescriptor inpooll = onValue;
//       BitmapDescriptor.fromAssetImage(
//               ImageConfiguration(devicePixelRatio: 2.5), 'assets/gi-3.png')
//           .then((onValue) {
//         BitmapDescriptor outpooll = onValue;
//         layerRTU.add(TipeRTU(
//             id: '4',
//             name: 'RTU GI',
//             status: true,
//             assetinpool: 'assets/5a.png',
//             assetoutpool: 'assets/gi-3.png',
//             iconoutpooll: outpooll,
//             iconinpooll: inpooll));
//       });
//     });
//     //sleep(Duration(seconds:2));

//     // sleep(Duration(seconds:2));
//     return layerRTU;
//   }


//   Future<List<PosisiPetugas>> getPosisiPetugas() async {
//     List<PosisiPetugas> gd = List<PosisiPetugas>();

//     // String f = BaseUrl.petugasGetPengaduan;
//     // String jenisken = null;
//     // if (group == 'petugas_mobile_roda_2') {
//     //   jenisken = '2';
//     // } else if (group == 'petugas_mobile_roda_4') {
//     //   jenisken = '4';
//     // }
//     try {
//       http.Response response = await http.post(BaseUrl.getPosisiPetugas,
//           headers: {"Content-Type": "application/x-www-form-urlencoded"},
//           body: {"key": "key"});
//           // print("KKKKKK" +jenisken);
//       // if (response.statusCode == 201 || response.statusCode == 200) {
//       var data = json.decode(response.body);
//       var code = data['code'];
//       var mess = data['mess'];
//       print(mess);
//       print(data['result']);
//       String pinpath = "assets/gd_gangguan.png";
//       if (code == '200') {
//         //print(res['data']);
//         for (var r in data['result']) {
//           // print(r['id']);

//           // print( r['id_trans_pengaduan']);
//           gd.add(PosisiPetugas(
//             namaLengkap: r['nama_lengkap'],
//             idTransPetugasLog: r['id_trans_petugas_log'],
//             namaGroup: r['nama_group'],
//             aktifApp: r['aktif_app'],
//             idUser : r['id_user'],
//             lat: double.parse(r['lat']),
//             lon: double.parse(r['lon']),
//             // jenis : r['tipe_point'],
//             // tipe_point : r['tipe_point'],
//             jenisKendaraan: r['jenis_kendaraan'],
//             // tglawal : r['tglawal'],
//             // tglakhir : r['tglakhir'],
//             // durasi : r['durasi'],
//             // : r['status'],
//             pinPath: pinpath,
//             avatarPath: "assets/pln.png",
//             // labelColor :Colors.purple,
//           ));
//         }
//       }

//       // }
//     } catch (e) {
//       print(e);
//     }
//     return gd;
//   }


//   List<TipeKendaraan> getKendaraanJenis() {
//     List<TipeKendaraan> layerKendaraan = List<TipeKendaraan>();

//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration(devicePixelRatio: 2.5), 'assets/motor.png')
//         .then((onValue) {
//       BitmapDescriptor inpooll = onValue;
//       BitmapDescriptor.fromAssetImage(
//               ImageConfiguration(devicePixelRatio: 2.5), 'assets/motor.png')
//           .then((onValue) {
//         BitmapDescriptor outpooll = onValue;
//         layerKendaraan.add(TipeKendaraan(
//             id: '2',
//             name: 'Roda 2',
//             status: true,
//             assetinpool: 'assets/motor.png',
//             assetoutpool: 'assets/motor.png',
//             iconoutpooll: outpooll,
//             iconinpooll: inpooll));
//       });
//     });

//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration(devicePixelRatio: 2.5), 'assets/mobil.png')
//         .then((onValue) {
//       BitmapDescriptor inpooll = onValue;
//       BitmapDescriptor.fromAssetImage(
//               ImageConfiguration(devicePixelRatio: 2.5), 'assets/mobil.png')
//           .then((onValue) {
//         BitmapDescriptor outpooll = onValue;
//         layerKendaraan.add(TipeKendaraan(
//             id: '4',
//             name: 'Roda 4',
//             status: true,
//             assetinpool: 'assets/mobil.png',
//             assetoutpool: 'assets/mobil.png',
//             iconoutpooll: outpooll,
//             iconinpooll: inpooll));
//       });
//     });

//     return layerKendaraan;
//   }

// }
