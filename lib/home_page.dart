
import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText = '';
  bool isGridView = false;

  // Shared value used by every card.
  int discount = 20;

  void _decreaseDiscount() {
    if (discount <= 0) return;

    setState(() {
      discount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final query = searchText.trim().toLowerCase();

    final filteredMovies = movies.where((movie) {
      return movie.title.toLowerCase().contains(query) ||
          movie.genre.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Library'),
        actions: [
          IconButton(
            tooltip: 'Switch view',
            icon: Icon(
              isGridView ? Icons.view_list : Icons.grid_view,
            ),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search movies...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: filteredMovies.isEmpty
                      ? const Center(
                          child: Text('No movies found'),
                        )
                      : isGridView
                          ? GridView.builder(
                              padding: const EdgeInsets.only(
                                bottom: 12,
                              ),
                              itemCount: filteredMovies.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 0.46,
                              ),
                              itemBuilder: (context, index) {
                                return MovieCard(
                                  movie: filteredMovies[index],
                                  isGridView: true,
                                  discount: discount,
                                  onDiscountTap: _decreaseDiscount,
                                );
                              },
                            )
                          : ListView.builder(
                              itemCount: filteredMovies.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 12,
                                  ),
                                  child: MovieCard(
                                    movie: filteredMovies[index],
                                    isGridView: false,
                                    discount: discount,
                                    onDiscountTap: _decreaseDiscount,
                                  ),
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
