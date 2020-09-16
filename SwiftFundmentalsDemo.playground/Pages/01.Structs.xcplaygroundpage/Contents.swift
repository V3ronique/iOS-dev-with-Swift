// Location -> first struct
struct Location {
    let x: Int
    let y: Int
}

// Delivery Area
struct DeliveryArea: CustomStringConvertible {
    let center: Location
    var radius: Double
    
    func contains(_ location: Location) -> Bool {
        let distanceFromCenter =
            distance(from: center,
                     to: location)
        
        return distanceFromCenter < radius
    }
    
    func overlaps(with area: DeliveryArea) -> Bool {
        distance(from: center, to: area.center) <=
            (radius + area.radius)
    }
    
    // Pythagorean Theorem 📐🎓
    func distance(from source: Location,
                  to target: Location) -> Double {
        let distanceX = Double(source.x - target.x)
        let distanceY = Double(source.y - target.y)
        return (distanceX * distanceX +
            distanceY * distanceY).squareRoot()
    }
    
    
    var description: String {
        """
        Area with center: (x: \(center.x), y: \(center.y)),
        radius: \(radius)
        """
    }
}

let location = Location(x: 2, y: 4)
var area = DeliveryArea(center: location, radius: 4)

print(area.radius)
print(area.center.x)

area.radius = 250

let fixedArea = DeliveryArea(center: location, radius: 4)
//fixedArea.radius = 250.0

let areas = [
    DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5),
    DeliveryArea(center: Location(x: 9, y: 7), radius: 4.5)
]

let newArea = DeliveryArea(center: Location(x: 5, y: 5), radius: 4.5)
let customerLocation = Location(x: 2, y: 2)
newArea.contains(customerLocation) // true

// Value type example
var area1 = DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5)
var area2 = area1
print(area1.radius) // 2.5
print(area2.radius) // 2.5

area1.radius = 4
print(area1.radius) // 4.0
print(area2.radius) // 2.5
