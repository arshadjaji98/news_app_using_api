import 'package:flutter/material.dart';

import '../Models/news_model.dart';

class DetailNews extends StatelessWidget {
  const DetailNews({super.key, required this.news});

  final Yournews news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Color.fromARGB(255, 73, 98, 223),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${news.date} . ${news.newsCategories.toLowerCase()}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  news.newsTitle,
                  style: const TextStyle(
                    fontSize: 33,
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(news.newsImage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  news.description,
                  style: const TextStyle(
                    fontSize: 21,
                    height: 1.6,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "So what's changed?",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  news.description,
                  style: const TextStyle(
                    fontSize: 21,
                    height: 1.6,
                  ),
                ),
                Text(
                  news.description,
                  style: const TextStyle(
                    fontSize: 21,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: bottomSheet(),
    );
  }

  Container bottomSheet() {
    return Container(
      height: 75,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(spreadRadius: 1, blurRadius: 2, offset: Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: TextFormField(
              decoration:
                  InputDecoration(prefix: Image.asset('assets/chat.png')),
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFEDE3FA),
            child: Image.asset(
              "assets/icon.png",
              height: 20,
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFFFF7E2),
            child: Image.asset(
              "assets/star.png",
              height: 20,
            ),
          ),
          const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFD9F9F5),
              child: Icon(
                Icons.more_vert,
                size: 20,
                color: Color(0xFF00D9BC),
              )),
          const SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}
