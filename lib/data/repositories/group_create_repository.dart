import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';

abstract class GroupCreateRepository {
  Future<List<UserModel>> getIconContacts();

  Future<List<CategoryModel>> getCategories();

  Future<ConversationModel> createConversation(
      List<UserModel> contacts, List<int> categoriesIds);
}

final urlIconMock =
    'https://www.ynet.co.il/PicServer3/2013/12/15/5039627/5304521585699490490no.jpg';
final urlCategoryMock =
    'https://cdn4.vectorstock.com/i/thumb-large/65/78/porridge-bowl-flat-longshadow-square-icon-vector-7666578.jpg';

class GroupCreateRepositoryImpl implements GroupCreateRepository {
  @override
  Future<List<UserModel>> getIconContacts() {
    final users = List.generate(
        20,
        (index) => UserModel(
            id: index,
            fullName: 'עידן איילון', photo: PhotoModel(url: urlIconMock)));

    return Future.value(users);
  }

  @override
  Future<List<CategoryModel>> getCategories() {
    final categories = List.generate(
      20,
      (index) => CategoryModel(
          id: index.toString(),
          title: 'קטגוריה',
          photo: PhotoModel(description: 'בישול', url: urlCategoryMock)),
    );
    return Future.value(categories);
  }

  @override
  Future<ConversationModel> createConversation(
      List<UserModel> contacts, List<int> categoriesIds) async {
    return ConversationModel();
  }
}
