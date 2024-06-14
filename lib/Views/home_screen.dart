import 'package:api_new_app/Models/category.dart';
import 'package:api_new_app/Models/category_model.dart';
import 'package:api_new_app/Services/new_details.dart';
import 'package:flutter/material.dart';
import 'package:api_new_app/Services/services.dart';
import '../Models/new_model.dart';
import '../Models/news_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Articles> articles = [];
  List<CategoryModel> categories = [];
  bool isLoading = true;

  getNews() async {
    NewsApi newsApi = NewsApi();
    await newsApi.getNews();
    setState(() {
      articles = newsApi.dataStore;
      isLoading = false;
    });
  }

  @override
  void initState() {
    categories = getCategories();
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NEWS",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[200],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailNews(
                                news: Yournews(
                                  date: article.publishedAt ?? 'No Date',
                                  newsCategories:
                                      'General', // Change this as needed
                                  newsTitle: article.title ?? 'No Title',
                                  newsImage: article.urlToImage ??
                                      'https://via.placeholder.com/400x240',
                                  description:
                                      article.description ?? 'No Description',
                                  image: article.urlToImage!,
                                  time: '',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  article.urlToImage ??
                                      'https://via.placeholder.com/400x240',
                                  height: 240,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                article.title ?? 'No Title',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const Divider(thickness: 2)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
