import 'package:hive/hive.dart';
import 'package:hive_project2/models/account.dart';
import 'package:hive_project2/models/user_model.dart';

class HiveDB {
  var box = Hive.box('my_box');
  // user
  void storeUser (User user) async {
    box.put("user", user.toJson());
  }

  User loadUser() {
    var user = new User.fromJason(box.get('user'));
    return user;
  }

  void removeUser() async {
    box.delete("user");
  }
// account
  void storeAccount (Account account) async {
    box.put("account", account.toJson());
  }

  Account loadAccount() {
    var account = new Account.fromJason(box.get('account'));
    return account;
  }

  void removeAccount() async {
    box.delete("account");
  }


}