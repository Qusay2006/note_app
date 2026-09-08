import 'dart:io';

import 'package:rivaan_project2/core/error/app_exeption.dart';
import 'package:rivaan_project2/features/blog/data/model/blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



// شراح ليش حطينا select بلاخير عند addBlog function










abstract interface class BlogRemoteData {
  Future<List<BlogModel>>getBlogs();
  Future<BlogModel>addBlogs(BlogModel blog);
  Future<String> uploadImage(BlogModel blog, File image);
}

class BlogRemoteDataImpl implements BlogRemoteData{
 final SupabaseClient _supabaseClient;
  BlogRemoteDataImpl({required this._supabaseClient});

  @override
  Future<BlogModel> addBlogs(BlogModel blog)async {
    try {
      final result = await _supabaseClient.from('blogs')
          .insert(blog.toJson())
          .select();
      return BlogModel.fromJson(result.first);
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  @override
  Future<String> uploadImage(BlogModel blog, File image) async{
    try {
        await _supabaseClient.storage.from(
          //id in supabase sqlEditor
          //id in supabase sqlEditor
          //id in supabase sqlEditor
          //id in supabase sqlEditor
           'blog_images').upload(blog.id, image);
        return _supabaseClient.storage.from('blog_images').getPublicUrl(blog.id);
    } catch (e) {
      throw AppException(e.toString());
    }
  }


  //مافهمت التحت





  @override
  Future<List<BlogModel>> getBlogs() async{
    try{
      final blog =await _supabaseClient.from('blogs').select(
        //لتاخد كل الداتا مع اسم اليوزر لانو ال مافي بلblog hsl hgd,.v
         '*,profile(name)');
      return blog.map((e) => BlogModel.fromJson(e).copyWith(posterName: e['profile']['name']),).toList();
    }catch (e){
      throw AppException(e.toString());
    }
  }


}