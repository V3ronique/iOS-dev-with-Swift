import UIKit

// first restaurant
let restaurantLocation = (2, 4)
let restaurantRange = 2.5

// second restaurant
let otherRestaurantLocation = (7, 8)
let otherRestaurantRange = 1.5

// Pythagorean Theorem 📐🎓
func distance(from source: (x: Int, y: Int),
              to target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX +
        distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
    let deliveryDistance = distance(from: location,
                                    to: restaurantLocation)
    // use when only one restaurant
    // return deliveryDistance < restaurantRange
    // second restaurant
    let secondDeliveryDistance = distance(from: location, to: otherRestaurantLocation)
    
    return deliveryDistance < restaurantRange ||
        secondDeliveryDistance < otherRestaurantRange
}
