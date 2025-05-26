import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:s_rocks_music/models/service.dart';

class HomeService {
  Future<List<ServiceModel>> fetchHomeServices() async {
    final snapshot = await FirebaseFirestore.instance.collection('services').get();
    List<ServiceModel> services = snapshot.docs
        .map((doc) => ServiceModel.fromMap(doc.data()))
        .toList();
    
    return services;
  }
}