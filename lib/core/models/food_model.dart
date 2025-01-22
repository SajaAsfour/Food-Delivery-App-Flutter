import 'package:food_app/core/models/category_model.dart';

class FoodItem{
  final String id;
  final String name;
  final String imgUrl;
  final String description;
  final double price;
  final CategoryModel category;

  FoodItem({
    required this.id ,
    required this.name ,
    required this.imgUrl ,
    this.description  = "This is description",
    required this.price ,
    required this.category ,
  });
}
List<FoodItem> food = [
  FoodItem(
    id: '1',
    name: 'Beef Burger',
    imgUrl:
        'https://www.freepnglogos.com/uploads/burger-png/download-hamburger-burger-png-image-png-image-pngimg-15.png',
    price: 8.5,
    category: Categories[0],
    description: "A delicious beef patty\nwith fresh vegetables and sauce\nserved in a soft bun."
  ),
  FoodItem(
    id: '2',
    name: 'Chicken Burger',
    imgUrl: 'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png',
    price: 9.5,
    category: Categories[0],
    description: "A tender chicken fillet\nwith crisp lettuce and mayonnaise\nnestled in a toasted bun."
  ),
  FoodItem(
    id: '3',
    name: 'Cheese Burger',
    imgUrl: 'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png',
    price: 8,
    category: Categories[0],
    description: "A juicy beef patty topped\nwith melted cheese\naccompanied by fresh lettuce and tomato."
  ),
  FoodItem(
    id: '4',
    name: 'Chicken Pizza',
    imgUrl:
        'https://graficsea.com/wp-content/uploads/2021/12/Chicken-Supreme-Pizza-.png',
    price: 9,
    category: Categories[1],
    description: "A savory pizza topped\nwith seasoned chicken ,vegetables\nand melted cheese."
  ),
  FoodItem(
    id: '5',
    name: 'Pasta',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
    description: "A classic pasta dish served\nwith a rich and creamy tomato sauce."
  ),
  FoodItem(
    id: '6',
    name: 'Pasta2',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
    description: "Delicious pasta with a choice of sauce:\nmarinara, pesto, or Alfredo."
  ),
  FoodItem(
    id: '7',
    name: 'Pasta3',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
    description: "A hearty pasta dish\nwith garlic, olive oil, \nand a touch of parmesan."
  ),
  FoodItem(
    id: '8',
    name: 'Pasta4',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
    description: "Pasta with a flavorful mix of fresh vegetables\nand a light cream sauce."
  ),
];
