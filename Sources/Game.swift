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
        print(board.ships[0])
        print(board.ships[1])
        print(board.ships[2])
        print(board.ships[3])
        print(board.ships[4])
        //While all ship are not destoryed
          //Ask for coords



        //Ask if user wants to play again
        play = playAgain()
    } while (play)

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
