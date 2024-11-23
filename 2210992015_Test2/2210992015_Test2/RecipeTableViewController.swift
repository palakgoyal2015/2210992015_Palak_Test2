
//
//  ViewController.swift
//  2210992015_Test2
//
//  Created by student-2 on 23/11/24.
//
import UIKit

class RecipeTableViewController: UITableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var MainPageFoodName: UILabel!
    @IBOutlet weak var MainPageCalorieCount: UILabel!
    @IBOutlet weak var MainPagePreprationTime: UILabel!
    
    var foodTimes: [FoodTime] {
       
        let breakfastFoodDetail1 = FoodDetail(
            recipeName: "Avocado Toast with Tomatoes",
            ingredients: ["Avocado", "Whole Wheat Bread", "Tomato", "Chili Flakes", "Olive Oil"],
            category: .vegan,
            recipeImage: UIImage(named: "avocado_toast.jpg") ?? UIImage(),
            preprationTime: 12,
            calorieCount: 380.0
        )

        let breakfastFoodDetail2 = FoodDetail(
            recipeName: "Berry Oatmeal",
            ingredients: ["Oats", "Strawberries", "Blueberries", "Almond Milk", "Agave Syrup"],
            category: .vegan,
            recipeImage: UIImage(named: "berry_oatmeal.jpg") ?? UIImage(),
            preprationTime: 8,
            calorieCount: 270.0
        )

        // Updated FoodDetails for Lunch
        let lunchFoodDetail1 = FoodDetail(
            recipeName: "Grilled Chicken & Quinoa Salad",
            ingredients: ["Chicken Breast", "Quinoa", "Spinach", "Olive Oil", "Balsamic Vinegar", "Tomatoes"],
            category: .Non_vegetarian,
            recipeImage: UIImage(named: "grilled_chicken_quinoa_salad.jpg") ?? UIImage(),
            preprationTime: 25,  // Slightly increased prep time
            calorieCount: 500.0  // Adjusted calorie count
        )

        let lunchFoodDetail2 = FoodDetail(
            recipeName: "Roasted Veggie & Hummus Wrap",
            ingredients: ["Whole Wheat Wrap", "Zucchini", "Bell Pepper", "Hummus", "Cucumber", "Lettuce"],
            category: .vegan,
            recipeImage: UIImage(named: "roasted_veggie_wrap.jpg") ?? UIImage(),
            preprationTime: 15,  // Slightly reduced prep time
            calorieCount: 350.0  // Adjusted calorie count
        )

        // Updated FoodDetails for Dinner
        let dinnerFoodDetail1 = FoodDetail(
            recipeName: "Beef & Mushroom Spaghetti",
            ingredients: ["Spaghetti", "Ground Beef", "Mushrooms", "Tomato Sauce", "Garlic", "Olive Oil", "Parmesan"],
            category: .Non_vegetarian,
            recipeImage: UIImage(named: "beef_mushroom_spaghetti.jpg") ?? UIImage(),
            preprationTime: 35,  // Slightly increased prep time for the sauce
            calorieCount: 750.0  // Increased calorie count
        )

        let dinnerFoodDetail2 = FoodDetail(
            recipeName: "Tofu & Veggie Stir Fry",
            ingredients: ["Tofu", "Broccoli", "Carrot", "Bell Pepper", "Soy Sauce", "Ginger", "Rice"],
            category: .vegetarian,
            recipeImage: UIImage(named: "tofu_veggie_stir_fry.jpg") ?? UIImage(),
            preprationTime: 22,  // Increased prep time slightly
            calorieCount: 480.0  // Adjusted calorie count
        )

        // Create Food objects for each meal time
        let breakfast = Food(foodName: "Breakfast", foodDetail: [breakfastFoodDetail1, breakfastFoodDetail2])
        let lunch = Food(foodName: "Lunch", foodDetail: [lunchFoodDetail1, lunchFoodDetail2])
        let dinner = Food(foodName: "Dinner", foodDetail: [dinnerFoodDetail1, dinnerFoodDetail2])

        // Create FoodTime objects for each time of day
        let breakfastTime = FoodTime(foodTime: "Breakfast", food: [breakfast])
        let lunchTime = FoodTime(foodTime: "Lunch", food: [lunch])
        let dinnerTime = FoodTime(foodTime: "Dinner", food: [dinner])

        return [breakfastTime, lunchTime, dinnerTime]
    }

    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return foodTimes.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodTimes[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        
            let foodTime = foodTimes[indexPath.section]
            let food = foodTime.food[indexPath.row]
            
            MainPageFoodName.text = food.foodName
            MainPageCalorieCount.text = "\(food.foodDetail[0].calorieCount) kcal"
            MainPagePreprationTime.text = "\(food.foodDetail[0].preprationTime) minutes"
            
            return cell

    }
    

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section : Int) -> String? {
        return foodTimes[section].foodTime
    }



}
