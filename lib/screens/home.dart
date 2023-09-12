import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/provider/my_provider.dart';
import 'package:food_app/screens/cart_page.dart';
import 'package:food_app/screens/categories_details.dart';
import 'package:food_app/screens/detail_screen.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/widgets/Categories.dart';
import 'package:food_app/widgets/my_container.dart';
import 'package:provider/provider.dart';

import '../models/categories_model.dart';
import '../models/food_categories_model.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();


}
class _HomeScreenState extends State<HomeScreen> {

  List<CategoriesModel>burger=[];
  final auth=FirebaseAuth.instance;
  List<CategoriesModel>recipe=[];
  List<CategoriesModel>bbq=[];
  List<CategoriesModel>biryanil=[];
  List<CategoriesModel>karahi=[];
  List<FoodModel>foodlist=[];
  List<FoodCategoriesModel>burgerCategories=[];
  List<FoodCategoriesModel>recipeCategories=[];
  List<FoodCategoriesModel>bbqCategories=[];
  List<FoodCategoriesModel>biryaniCategories=[];
  List<FoodCategoriesModel>karahiCategories=[];
  Widget recipes(){
    return Row(
        children:recipe.map((e) => Categories(
          ontap:(){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context)=>CategoriesDetails(list: recipeCategories)));
          },
            image: e.image, name: e.name)).toList(),
    );
  }
  Widget burgers(){
    return Row(
        children:burger.map((e) => Categories(
          ontap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CategoriesDetails(
              list: burgerCategories,
            ),
            ),
            );},
            image: e.image, name: e.name)).toList()
    );
  }
  Widget bbqs(){
    return Row(
      children:bbq.map((e) => Categories(
          ontap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CategoriesDetails(list: bbqCategories)));
          },
          name: e.name, image: e.image)).toList(),
    );
  }
  Widget biryani(){
    return Row(
      children: biryanil.map((e) => Categories(
        ontap: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=>
                  CategoriesDetails(list: biryaniCategories)
              ));
          },
          image:e.image,
          name: e.name)).toList(),

    );
  }
  Widget karahii(){
    return Row(
      children: karahi.map((e) => Categories(
          ontap: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context)=>
                    CategoriesDetails(list: karahiCategories)
                ));
          },
          image:e.image,
          name: e.name)).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    MyProvider provider=Provider.of<MyProvider>(context);
    //burger list
    provider.getBurgerCategories();
    // burger=provider.burgerList;
    burger=provider.throwburgerlist;
    //Recipe
    provider.getRecipes();
    recipe=provider.throwrecipeList;
    // recipe=provider.recipeList;
    //bbq
    provider.getbbqCategories();
    // bbq=provider.bbqList;
    bbq=provider.throwbbqList;
    //biryani
    provider.getBiryaniCategories();
    // burger=provider.biryaniList;
    biryanil=provider.throwbiryanilist;
    //karahi
    provider.getkarahi();
    // karahi=provider.karahiList;
    karahi=provider.throwkarahiList;

    //hjkjkll//
    provider.getFoodList();
    foodlist=provider.throwFoodList;
    provider.getBurgerCategoriesList();
    burgerCategories=provider.throwburgerCategoriesList;
    ///recipecategories here///
    provider.getRecipeCategoriesList();
    recipeCategories=provider.throwRecipeCatList;
    ///bbq categories list////
    provider.getBBQCategoriesList();
    bbqCategories=provider.throwBBQCatList;
    ///biryani categories List///
    provider.getBiryaniCategoriesList();
    biryaniCategories=provider.throwBiryaniCatList;
    ///karahi Categories///
    provider.getKarahiCategoriesList();
       karahiCategories=provider.throwKarahiCatList;
    GlobalKey<ScaffoldState>globalKey=GlobalKey<ScaffoldState>();
    return  Scaffold(
      backgroundColor: const Color(0xff2b2b2b),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFBCD438),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  UserAccountsDrawerHeader(
                    accountName: Text('Hamza',style: TextStyle(color: Colors.black,fontSize: 20),),
                    accountEmail: Text('hamzakhan115@gmail.com',style: TextStyle(color: Colors.black,fontSize: 15),),
                  decoration: BoxDecoration(
                    // color: Color(0xff3a3e3e)
                    border: Border(
                      bottom: Divider.createBorderSide(context,color: Colors.black,width: 3),
                    )

                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
                ),
                drawer(name: 'profile', icon: Icons.person,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                  },
                    child: drawer(name: 'Cart', icon: Icons.shopping_cart,)),
                drawer(name: 'Order', icon: Icons.shop_2,),
                 const Divider(
                   thickness: 3,
                   color: Colors.black,
                 ),
                const Text('Communicate',
                  style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                drawer(name: 'change', icon: Icons.lock),
                InkWell(
                  onTap: (){
                    auth.signOut().then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen())));

                  },
                    child: drawer(name: 'Logout', icon: Icons.logout))

              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:const Color(0xff2b2b2b),
        iconTheme:IconThemeData(color: Colors.white),

        actions: const [
          CircleAvatar(

            backgroundImage: AssetImage('images/profile.jpg'),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: (){
          globalKey.currentState?.openEndDrawer();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white,),

                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.search,color: Colors.white,),
                    filled: true,
                    fillColor: const Color(0xff3a3e3e),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      burgers(),
                      recipes(),
                      bbqs(),
                      biryani(),
                      karahii(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: 505,
                  child: GridView.count(crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    shrinkWrap: false,
                    primary: false,
                  children: foodlist.map((e) =>
                      MyContainer(image: e.image, price: e.price, name: e.name,
                        ontap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                          name: e.name,
                          price: e.price,
                          image: e.image,
                        )));
                        },
                      )).toList(),

                  //   children: [
                  //   MyContainer(
                  //       name: 'Burger',
                  //       image: 'images/burger.jpg', price: 2),
                  //   MyContainer(
                  //       name: 'BBQ',
                  //       image: 'images/bbq.jpg', price: 12),
                  //   MyContainer(
                  //       name: 'Burger',
                  //       image: 'images/profile.jpg', price: 12),
                  //     MyContainer(image: 'images/profile.jpg', price: 1, name: 'pizza'),
                  //
                  // ],
                    ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
Widget drawer({required String name,required IconData icon}){

  return  ListTile(
    leading: Icon(icon,color: Colors.black,),
    trailing: Text(name,style: const TextStyle(color: Colors.black,fontSize: 15),),
  );
}

