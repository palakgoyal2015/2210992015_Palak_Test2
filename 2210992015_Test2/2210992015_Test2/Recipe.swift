//
//  ViewController.swift
//  2210992015_Test2
//
//  Created by student-2 on 23/11/24.
//

import Foundation
import UIKit


enum foodType {
    case glutan, vegan, vegetarian, Non_vegetarian, dairy
}


struct FoodDetail {
    let recipeName: String
    let ingredients: [String]
    let category: foodType
    let recipeImage: UIImage
    let preprationTime: Int
    let calorieCount: Float
}


struct Food {
    let foodName: String
    let foodDetail: [FoodDetail]
}


class FoodTime {
    let foodTime: String
    var food: [Food]

    init(foodTime: String, food: [Food]) {
        self.foodTime = foodTime
        self.food = food
    }
}

