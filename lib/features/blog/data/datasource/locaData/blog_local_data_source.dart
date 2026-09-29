  import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
  import 'package:rivaan_project2/features/blog/data/model/blog_model.dart';

  abstract interface class BlogLocalDataSource {
    void addLocalBlog({required List<BlogModel>blogs});
    List<BlogModel> loadBlogs() ;
  }

  @LazySingleton(as: BlogLocalDataSource)
  class BlogLocalDataSourceImpl implements BlogLocalDataSource{
    final Box box;
    BlogLocalDataSourceImpl(this.box);

    @override
    void addLocalBlog({required List<BlogModel> blogs}) {
      box.clear();
      for (var i = 0; i < blogs.length; ++i) {
        box.put(i.toString(), blogs[i].toJson());
      }
    }

    @override
    List<BlogModel> loadBlogs() {
      List<BlogModel> blogs =[];
      for (var i = 0; i < box.length; ++i) {
         blogs.add(BlogModel.fromHiveJson(box.get(i.toString())));
      }
      return blogs;
     }
  }