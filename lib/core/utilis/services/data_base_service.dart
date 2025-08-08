abstract class DataBaseService {
  Future<void> addData({required String path, required Map<String, dynamic> data,String? id,});
  Future<dynamic>getData({required String path, Map<String, dynamic>? query, String? id,});
  Future<bool> isDataExists({required String path,required String id});
  Future<void> deleteData({required String path,required String id,});
}
