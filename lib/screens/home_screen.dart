import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/logic/provider_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  TextEditingController searchController = TextEditingController();
  late TabController tabController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        bottom:PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: Container(
            width: double.infinity,
            height: 160,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.black,
                  child: Row(
                    children: [
                      Padding(padding:const EdgeInsets.only(left: 5,right:3,bottom: 25),child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.back,size: 45,color: Colors.white,))),
                      Container(
                        height: 50,
                        width: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.fromBorderSide(BorderSide(color: Colors.green)),
                        ),
                        child: TextFormField(

                          cursorColor: Colors.white70,
                          controller: searchController,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                          onChanged: (inputValue){
                          },
                          decoration: InputDecoration(
                            hintText: 'Movies',
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // focusedBorder: (
                            //   borderSide: BorderSide(color: Color.fromRGBO(249,247,242, 1)),
                            // ),
                            // contentPadding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                SizedBox(height: 15,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TabBar(
                      controller: tabController,
                      indicatorSize:TabBarIndicatorSize.label,
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(
                          text: "Movies",
                        ),
                        Tab(
                          text: "Shows",
                        ),
                      ]
                  ),
                ),
                Divider(color: Colors.white38,height: 2,thickness: 3,)
              ],
            ),
          ),
        ) ,
      ),
      body:
      Consumer<ProviderState>(
        builder: (context,provider,child){
          return ListView.separated(
            shrinkWrap: true,
            primary: true,
            itemCount: provider.movieList.length,
            itemBuilder: (context,index){
              return SizedBox(height: 5,);
            },
            separatorBuilder: (context,index){
              return provider.isLoading?
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.black.withOpacity(0.7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 130,
                      child: CachedNetworkImage(
                        imageUrl: "https://image.tmdb.org/t/p/w500/${provider.movieList[index].results[index].posterPath}",
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      child: Container(
                        height:100 ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("K.G.F Chapter1",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Container(
                                height: 20,
                                width: 65,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(child: Text("Active",style: TextStyle(color: Colors.black),)),
                              ),
                            ),
                            Text("DT Prime",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 17),),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment:Alignment.bottomRight ,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,)),
                    ),
                  ],
                ),
              )
                  :
              Center(child: CircularProgressIndicator(),);

            },

          );
        },
      ),

     /* ListView.separated(
          shrinkWrap: true,
          primary: true,
          itemCount:8,
          separatorBuilder:(context,index){return SizedBox(height: 5,);} ,
          itemBuilder: (context,index){
            return Container(
              height: 100,
              width: double.infinity,
              color: Colors.black.withOpacity(0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 100,width: 130,color: Colors.cyan,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                    child: Container(
                      height:100 ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("K.G.F Chapter1",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Container(
                              height: 20,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text("Active",style: TextStyle(color: Colors.black),)),
                            ),
                          ),
                          Text("DT Prime",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 17),),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment:Alignment.bottomRight ,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,)),
                  ),
                ],
              ),
            );
          }
      )*/


    );
  }
}
