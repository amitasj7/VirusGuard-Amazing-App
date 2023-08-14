
import 'package:covid_tracker_app/services/states_services.dart';
import 'package:covid_tracker_app/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices _statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(  
          color: Colors.amber,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  hintText: 'Search with Country name',
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: 'Country',
                  labelStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: _statesServices.countriesListAPI(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    // return Center(
                    //   child: CircularProgressIndicator(
                    //     // strokeWidth: 2,
                    //     backgroundColor: Colors.white70 ,
                    //   ),
                    // );
                    // add shimmer effect in country search
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                  height: 10,
                                  width: 90,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 90,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        String name = snapshot.data![index]['country'];

                        // for filter countries , we use this approch ->

                        if (_searchController.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot.data![index]
                                            ['countryInfo']['flag'],
                                        totalCases: snapshot.data![index]
                                            ['cases'],
                                        totalDeaths: snapshot.data![index]
                                            ['deaths'],
                                        totalRecovered: snapshot.data![index]
                                            ['recovered'],
                                        todayRecovered: snapshot.data![index]
                                            ['todayRecovered'],
                                        active: snapshot.data![index]['active'],
                                        critical: snapshot.data![index]
                                            ['critical'],
                                        test: snapshot.data![index]['tests'],
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                    title: Text(
                                      snapshot.data![index]['country'],
                                    ),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                    leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']))),
                              ),
                            ],
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(_searchController.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot.data![index]
                                        ['countryInfo']['flag'],
                                        totalCases: snapshot.data![index]
                                        ['cases'],
                                        totalDeaths: snapshot.data![index]
                                        ['deaths'],
                                        totalRecovered: snapshot.data![index]
                                        ['recovered'],
                                        todayRecovered: snapshot.data![index]
                                        ['todayRecovered'],
                                        active: snapshot.data![index]['active'],
                                        critical: snapshot.data![index]
                                        ['critical'],
                                        test: snapshot.data![index]['tests'],
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                    title: Text(
                                      snapshot.data![index]['country'],
                                    ),
                                    subtitle: Text(snapshot.data![index]
                                    ['cases']
                                        .toString()),
                                    leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                            ['flag']))),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
