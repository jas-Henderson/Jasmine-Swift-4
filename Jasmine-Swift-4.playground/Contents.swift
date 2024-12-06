import UIKit

// Base Monster Protocol
protocol Monster {
    var name: String { get }
    var canFly: Bool { get }
    
    func roar() -> String
}
// Monster Element Category Protocols - inherits from Monster
protocol FireMonster: Monster {
    var fireTemperature: Int { get }
    func unleashFire() -> String
}

protocol IceMonster: Monster {
    var iceTemperature: Int { get }
    func unleashFreeze() -> String
}

// Mobility Monster Protocol - Can be used with either monster element protocols (Or even both in one example below)
protocol FlyingMonster: Monster {
    var wingSpan: Double { get }
    func fly() -> String
}

protocol GroundMonster: Monster {
    var speedOnFoot: Double { get }
    func run() -> String
}
// Firemonster and Flying Monster Class
class Phoenix: FireMonster, FlyingMonster {
    var name: String
    var canFly: Bool
    var fireTemperature: Int
    var wingSpan: Double
    
    init(name: String, canFly: Bool, fireTemperature: Int, wingSpan: Double) {
        self.name = name
        self.canFly = canFly
        self.fireTemperature = fireTemperature
        self.wingSpan = wingSpan
    }
    func roar() -> String {
        return "\(name) roars fiercely with blazing intensity!"
    }
    func unleashFire() -> String {
        return "\(name) unleashes flames from the sky, at \(fireTemperature) degrees Celsius!"
    }
    func fly() -> String {
        return "\(name) flies with a fiercful glide, with \(wingSpan) meters wingspan!"
    }
}
// Fire Monster and Ground Monster Class
class Kajutsuchi:FireMonster,GroundMonster {
    var name: String
    var canFly: Bool
    var fireTemperature: Int
    var speedOnFoot: Double
    
        init(name: String, canFly: Bool, fireTemperature: Int, speedOnFoot: Double) {
        self.name = name
        self.canFly = canFly
        self.fireTemperature = fireTemperature
        self.speedOnFoot = speedOnFoot
    }
    func roar() -> String {
        return "\(name) let's out a low, rumbling growl!"
    }
    func unleashFire() -> String {
        return "\(name) unleashes flames from the ground, at \(fireTemperature) degrees Celsius!"
    }
    func run() -> String {
        return "\(name) runs at \(speedOnFoot) kilometers per hour!"
    }
}
// Ice Monster, Fire Monster and Flying Monster Class
class ZmeyGorynych:IceMonster, FireMonster, FlyingMonster{
    var name: String
    var canFly: Bool
    var iceTemperature: Int
    var fireTemperature: Int
    var wingSpan: Double
    
    init(name: String, canFly: Bool, iceTemperature: Int, fireTemperature: Int, wingSpan: Double) {
        self.name = name
        self.canFly = canFly
        self.iceTemperature = iceTemperature
        self.fireTemperature = fireTemperature
        self.wingSpan = wingSpan
    }
    func roar() -> String {
        return "\(name) let's out echoing laughter when near by!"
    }
    func unleashFreeze() -> String {
        return "\(name) unleashes ice breath at \(iceTemperature) degrees Celsius!"
    }
    func unleashFire() -> String {
        return "\(name) unleashes fire breath at \(fireTemperature) degrees Celsius!"
    }
    func fly() -> String {
        return "\(name) flies with \(wingSpan) feet wingspan!"
    }
}
// Ice Monster and Ground Monster Class
class Wendigo:IceMonster,GroundMonster {
    var name: String
    var canFly: Bool
    var iceTemperature: Int
    var speedOnFoot: Double
    // no harm to Scarlett during the making of this assignment
    init(name: String, canFly: Bool, iceTemperature: Int, speedOnFoot: Double) {
        self.name = name
        self.canFly = canFly
        self.iceTemperature = iceTemperature
        self.speedOnFoot = speedOnFoot
    }
    func roar() -> String {
        return "\(name) screaches a piercing wail!"
    }
    func unleashFreeze() -> String {
        return "\(name) unleashes ice touch at \(iceTemperature) degrees Celsius!"
    }
    func run() -> String {
        return "\(name) runs at \(speedOnFoot) kilometers per hour!"
    }
}
// Function that will print the monster details regarding their abilities (Runs through all four protocols)
func printMonsterDetails (monsters: [Monster]) {
    for monster in monsters {
        if monster.canFly { //Flying Monsters
            print ("\(monster.name) Attacks from the sky!")
            print(monster.roar())
            
            if let flyingMonster = monster as? FlyingMonster {
                print (flyingMonster.fly())
            }
        } else { // Ground Monsters
            print ("\(monster.name) Hunts prey on the ground.")
            print(monster.roar())
            if let groundMonster = monster as? GroundMonster {
                print(groundMonster.run())
            }
        }
        // Element Type Monster
        if let fireMonster = monster as? FireMonster {
            print(fireMonster.unleashFire())
        } else if let iceMonster = monster as? IceMonster{
            print (iceMonster.unleashFreeze())
        }
        print("---------------------------")
    }
}

// Monster Instances
let phoenix = Phoenix (name: "Phoenix", canFly: true, fireTemperature: 1000, wingSpan: 50)
let kajutsuchi = Kajutsuchi (name: "kaju-tsuchi", canFly: false, fireTemperature: 1093, speedOnFoot: 500)
let zmeygorynych = ZmeyGorynych (name: "Zmey Gorynych", canFly: true, iceTemperature: -50, fireTemperature: 2000, wingSpan: 60 )
let wendigo = Wendigo (name: "Wendigo", canFly: false, iceTemperature: -60, speedOnFoot: 50)
print ("Monsters")

let monsters: [Monster] = [phoenix, kajutsuchi, zmeygorynych, wendigo]

printMonsterDetails(monsters: monsters)

