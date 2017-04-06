/*
  filename: Ship.swift
  author: Ryan Lam (CST215) & Joe Lam (CST234)
  date: 4/6/2017
*/

import Foundation

public class Ship
{
  //Size of the ship
  var size : Int

  //Attribute to check if ship is destoryed
  var isDestoryed : Bool = false

  //String that represents the ship
  var symbol : String

  //Name of the ship
  var name : String

  //Determine if ship is facing North, East, South, or West
  var direction : Int

  //Where the ship is located on the board
  var coordinates : [[Int]]

  /*
    Purpose: Initialize Ship parameters
    Params: size - size of Ship
            symbol - Ship symbol
            name - name of Ship
            coordinates - Initial coordinate of Ship
    Return: None
  */
  public init(size : Int, symbol : String, name : String, coordinates : [[Int]])
  {
      self.size = size
      self.symbol = symbol
      self.name = name
      self.direction = random()%4
      self.coordinates = coordinates
      self.placeShip()
  }

  /*
    Purpose: Generate a new direction that the Ship should be facing
    Params: None
    Return: None
  */
  public func genDirection()
  {
    //North(0), East(1), South(2), West(3)
    srand( UInt32( time( nil ) ) )
    return direction = random()%4
  }

  /*
    Purpose: Check if the user's coordinates match Ship's coordinate
    Params: userCoord - User's coordinate
    Return: Return Bool - True if Ship was hit, False if Ship was not
  */
  public func checkHit(userCoord : [Int]) -> Bool
  {
    var isHit : Bool = false
    if (!isDestoryed)
    {
      for coord in self.coordinates
      {
        if(coord == userCoord)
        {
          isHit = true
          size -= 1
          print("The \(name) has been hit!")
          //remove the index that has been hit from the ship coordinate array
          self.coordinates = self.coordinates.filter(){ $0 != coord }
        }
        if(self.coordinates.count == 0)
        {
          isDestoryed = true
          print("The \(name) has been destoryed!")
        }
      }
    }
    return isHit
  }

  /*
    Purpose: Check Ship boundary placement, as well as setting the other coordinates
             that the ship belongs to based on the direction and size of the Ship.
    Params: None
    Return: None
  */
  public func placeShip()
  {
    var initialCoord = coordinates[0]
    //North(0), East(1), South(2), West(3)
    switch(self.direction)
    {
    case 0:
      if(initialCoord[0] + self.size > 9)
      {
        self.genDirection()
        self.placeShip()
      }
      else
      {
        for index in 1..<self.size
        {
          var coord = [Int]()
          coord.append(initialCoord[0] + index)
          coord.append(initialCoord[1])
          coordinates.append(coord)
        }
      }
    case 1:
      if(initialCoord[1] + self.size > 9)
      {
        self.genDirection()
        self.placeShip()
      }
      else
      {
        for index in 1..<self.size
        {
          var coord = [Int]()
          coord.append(initialCoord[0])
          coord.append(initialCoord[1] + index)
          coordinates.append(coord)
        }
      }
    case 2:
      if(initialCoord[0] - self.size < 0)
      {
        self.genDirection()
        self.placeShip()
      }
      else
      {
        for index in 1..<self.size
        {
          var coord = [Int]()
          coord.append(initialCoord[0] - index)
          coord.append(initialCoord[1])
          coordinates.append(coord)
        }
      }
    case 3:
      if(initialCoord[1] - self.size < 0)
      {
        self.genDirection()
        self.placeShip()
      }
      else
      {
        for index in 1..<self.size
        {
          var coord = [Int]()
          coord.append(initialCoord[0])
          coord.append(initialCoord[1] - index)
          coordinates.append(coord)
        }
      }
    default:
      print("Dead.")
    }
  }


}
