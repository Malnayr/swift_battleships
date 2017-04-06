import Foundation

//Extension for variables that are type Character
//Give it a extension, so it can convert its ascii value to a number
extension Character {
    var asciiValue: UInt32? {
        //look into unicodeScalars and filter out the ascii that matches the
        //Character that is calling this extension and grab its value
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
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
        while(board.ships.count > 0)
        {
          //variables for user coordinates
          var row : Int
          var col : Int
          row = getRow()
          col = getCol()
          //pass coords to board
            //board will check if it hit a ship
          board.checkCoords(userCoord: [row,col])
          print("\n\nYou've decided to fire at: ")
          print("row: \(row), col: \(col)")
          //display board
          board.displayBoard()
        }
        //Ask if user wants to play again
        play = playAgain()
        if(play)
        {
          board = Board()
        }
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

  public func getRow() -> Int
  {
      var row : Int = -1

      repeat {
          print("Please enter row (A-J): ")
          var getRow = readLine()!
          //Handles if user enter in a lowercase - it will convert to upper
          getRow = getRow.uppercased()
          //Handles if user enters in a string it will just take the first letter
          let charRow : Character = getRow[getRow.startIndex]
          row = Int(charRow.asciiValue!) - 64
      } while (row <= 0 || row > 10)

      return row - 1
  }

  public func getCol() -> Int
  {
      var col : Int = -1

      repeat {
          print("Please enter column (1-10): ")
          let getCol = readLine()!
          if let temp_col = Int(getCol)
          {
            col = temp_col
          }

      } while (col <= 0 || col > 10)
      return col - 1
  }
}
