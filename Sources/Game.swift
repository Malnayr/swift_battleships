import Foundation

//Coordinate will be placed into an array which will be passed into a ship
struct coordinate {
    var latitude : Int
    var longitude : Int
}

public class Game
{
  public func start()
  {
    var board = Board()
    var play : Bool = true
    print("Welcome to Battleships! Made by the Lam fam.")
    repeat {
        board.displayBoard()
        //While all ship are not destoryed
          //Ask for coords



        //Ask if user wants to play again
        play = playAgain()
    } while (play)

  }

  //Use this to generate ships randomly
  public func genShip() -> Ship
  {
    srand( UInt32( time( nil ) ) )
    let shipID = random()%3
    var ship : Ship?
    switch (shipID)
    {
      //generate ship coordinates before you create the Ship
      //Then pass in the coordinates
      case 0 : ship = TugBoat(coordinates : [[0,0],[0,1]])
      case 1 : ship = Submarine(coordinates : [[0,2],[0,3],[0,4]])
      case 2 : ship = ACCarrier(coordinates : [[0,5],[0,6],[0,7]])
      default : print()
    }
    return ship!
  }

  public func playAgain() -> Bool
  {
    var bReturn = false
    var answer : String = ""

    repeat {
      print("Would you like to play again? (Y/N)")
      answer = readLine()!
      answer = String(answer[answer.startIndex]).lowercased()
      switch (answer) {
        case "y": bReturn = true
        case "n": bReturn = false
        default: answer = ""
      }
    } while (answer == "")

    return bReturn
  }
}
