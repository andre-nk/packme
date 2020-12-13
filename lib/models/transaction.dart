import 'package:equatable/equatable.dart';
import 'package:pack_me_alpha/models/packDetail.dart';
import 'package:pack_me_alpha/models/user.dart';

enum TransactionStatus {in_progress, completed, pending}
enum TransactionType { Peminjaman, Pengembalian, Bonus, Penarikan }

class Transaction extends Equatable {
  final int id;
  final String provider;
  final String providerLocation;
  final String dateTime;
  final int total;
  final List packDetail;
  final TransactionStatus status;
  final TransactionType type;
  final User user;

  Transaction(
      {this.id,
      this.provider,
      this.providerLocation,
      this.dateTime,
      this.total,
      this.type,
      this.packDetail,
      this.status,
      this.user,});

  Transaction copyWith(
      {int id,
      String provider,
      String providerLocation,
      String dateTime,
      int total,
      List packDetail,
      TransactionStatus status,
      TransactionType type,
      User user}){
        return Transaction(
          id: id ?? this.id,
          provider: provider ?? this.provider,
          dateTime: dateTime ?? this.dateTime,
          total: total ?? this.total,
          packDetail: packDetail ?? this.packDetail,
          status: status ?? this.status,
          type: type ?? this.type,
          user: user ?? this.user,
        );
      }

  @override
  List<Object> get props => [
        id,
        provider,
        providerLocation,
        dateTime,
        total,
        packDetail,
        status,
        user
      ];
}

List<Transaction> mockTransaction = [
  Transaction(
    dateTime: '12 Desember 2020',
    id: 1,
    provider: 'De Koffie',
    providerLocation: 'Jalan Mayor Kaslam, no. 12, Wonosobo Barat, Jawa Tengah',
    total: 12,
    packDetail: [
      PackDetail(
        idPack: 2,
        name: 'Medium Box',
        quantity: 2,
        packValue: 2000,
      )
    ],
    type: TransactionType.Peminjaman,
    status: TransactionStatus.completed,
    user: sampleUser,
  ),
  Transaction(
    dateTime: '12 Desember 2020',
    id: 1,
    provider: 'Xi No Na Boba',
    providerLocation: 'Jalan Mayor Kaslam, no. 10, Wonosobo Barat, Jawa Tengah',
    total: 2,
    packDetail: [
      PackDetail(
        idPack: 8,
        name: 'Medium Glass 500mL',
        quantity: 3,
        packValue: 500,
      )
    ],
    type: TransactionType.Peminjaman,
    status: TransactionStatus.completed,
    user: sampleUser,
  ),
  Transaction(
    dateTime: '15 Desember 2020',
    id: 1,
    provider: 'Ahmadi Sancaka',
    providerLocation: 'Jalan Ahmad Yani, no. 76, Wonosobo Barat, Jawa Tengah, 56311',
    total: 14,
    packDetail: [
      PackDetail(
        idPack: 8,
        name: 'Medium Glass 500mL',
        quantity: 3,
        packValue: 500,
      ),
      PackDetail(
        idPack: 2,
        name: 'Medium Box',
        quantity: 2,
        packValue: 2000,
      )
    ],
    type: TransactionType.Pengembalian,
    status: TransactionStatus.completed,
    user: sampleUser,
  ),
  Transaction(
    dateTime: '15 Desember 2020',
    id: 1,
    provider: 'PackMe LLC',
    providerLocation: '-',
    total: 35000,
    type: TransactionType.Bonus,
    status: TransactionStatus.completed,
    user: sampleUser,
  ),
  Transaction(
    dateTime: 'Menunggu Tindakan',
    id: 1,
    provider: 'OVO',
    providerLocation: '-',
    total: 35000,
    type: TransactionType.Penarikan,
    status: TransactionStatus.in_progress,
    user: sampleUser,
  ),
];
