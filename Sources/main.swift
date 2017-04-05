var game1 = Game()
var ship = game1.genShip()
print ("symbol: \(ship.symbol)")
print ("size: \(ship.size)")
print ("coords: \(ship.coordinates)")

ship.checkHit(userCoord: [0,0])
ship.checkHit(userCoord: [0,2])
ship.checkHit(userCoord: [0,5])

print ("size: \(ship.size)")
print ("coords: \(ship.coordinates)")
