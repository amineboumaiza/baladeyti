import 'package:flutter/material.dart';

import '../../Constant.dart';


//bare de recherche
class AppBarMc extends StatelessWidget {
  const AppBarMc({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      child: Row(
        children: [
          Container(
            width: size.width * 0.7,
            height: 50,
            decoration: BoxDecoration(
                color: KGreyColor, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: ' ',
                  prefixIcon: Icon(
                    Icons.search,
                    color: KBlackColor.withOpacity(0.8),
                  ),
                ),
                onTap: () {
                 /* showSearch(
                    context: context,
                    delegate: CustomSearch(),
                  );*/
                },
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: size.width * 0.12,
            height: size.width * 0.12,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: KGreyColor),
              image: const DecorationImage(
                image: AssetImage('assets/logomc.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }
}
/*
class CustomSearch extends SearchDelegate {
  List<Movie> l = List.empty();
 @override
  String get searchFieldLabel => 'Chercher un film';
  void fun() async {
    l = await MoviesServices().getMoviesList();
  }
  List<String> availableMoviesList = ["the matrix", "iron man", "aliens"];
  CustomSearch() {
    
    fun();
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Movie> matchQuery = [];
    for (var item in l) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(matchQuery[index].name),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Movie> matchQuery = [];
    for (var item in l) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //navigate to detail film + buy
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SingleMovieDetail(
                            idMovie: matchQuery[index].MovieID,
                          )));
            },
            child: ListTile(
              leading: Image.network(
                matchQuery[index].coverPath,
                width: 50,
                height: 40,
              ),
              title: Text(
                matchQuery[index].name,
                style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400),
              ),
            ),
          );
        });
  }
}
*/