import 'package:LanguageLearningApp/models/my_product.dart';
import 'package:LanguageLearningApp/models/product.dart';
import 'package:LanguageLearningApp/screens/bottom.dart';
import 'package:flutter/material.dart';
import '../providers/favorite_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalist = provider.favorite;
    return Scaffold(
      appBar: AppBar(
        title: Text(' my Books'),
      ),
      body: Column(
        children: [
          //Padding(padding: EdgeInsets.only(top: 20,left: 20),
          // child: Row(
          //children: [
          //Text("MyBooks",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
          //],
          // ),
          //),
          Expanded(
            child: ListView.builder(
              itemCount: finalist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        // GestureDetector(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>bottom([index])),

                        // child:
                        SlidableAction(
                          onPressed: (context) {
                            finalist.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () => finalist[index].description,
                      title: Text(
                        finalist[index].name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        finalist[index].description,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          finalist[index].image,
                        ),
                        backgroundColor: Colors.red.shade100,
                      ),
                      tileColor: Colors.white,
                    ),
                  ),
                );
                //  gestureDetector = GestureDetector(onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> bottom(widget.product.name));
              },
            ),
          ),
        ],
      ),
    );
  }
}
