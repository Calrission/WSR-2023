import 'package:supabase_flutter/supabase_flutter.dart';


final supabase = Supabase.instance.client;

Future<void> signUp({
    required String fullname,
    required String phone,
    required String email,
    required String password,
    required Function(User user) onResponse,
    required Function(String) onError
}) async {
  try{
    var result = await supabase.auth.signUp(
        password: password,
        email: email,
    );
    if (result.user == null){
      onError("User is null");
    }else{
      await fillRegisterUser(fullname, phone);
      onResponse(result.user!);
    }
  }on AuthException catch(e){
    onError(e.message);
  }
}

Future<void> signIn({
  required String email,
  required String password,
  required Function onResponse,
  required Function onError
}) async {
  try{
    var result = await supabase.auth.signInWithPassword(
        password: password,
        email: email
    );
    if (result.user == null){
      onError("User is null");
    }else{
      onResponse(result.user);
    }
  }on AuthException catch(e){
    onError(e.message);
  }
}

Future<void> fillRegisterUser(String fullname, String phone) async {
  await supabase.from("profiles").insert(
      {
        "fullname": fullname,
        "id_user": supabase.auth.currentUser!.id,
        "avatar": "",
        "phone": phone
      }
  );
}

Future<List<Map<String, dynamic>>> updateStatusOrder(int newStatus, String id) async{
  return await supabase
      .from("orders")
      .update({"status": newStatus})
      .eq("id", id)
      .select();
}

Future<List<Map<String, dynamic>>> deleteFirstOrderUser() async{
  return await supabase
      .from("orders")
      .delete()
      .eq("id_user", supabase.auth.currentUser!.id);
}

Future<List<Map<String, dynamic>>> getAllOrders() async {
  return await supabase
      .from("orders")
      .select()
      .eq("id_user", supabase.auth.currentUser!.id);
}

Future<List<Map<String, dynamic>>> fetchAds() async {
  var res = await supabase.from("ads").select("ads_url");
  return res;
}

