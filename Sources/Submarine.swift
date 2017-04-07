/*
  filename: Submarine.swift
  author: Ryan Lam (CST215) & Joe Lam (CST234)
  date: 4/6/2017
*/

//Child class of Ship
public class Submarine : Ship
{
  /*
    Purpose: Initializer for child
  */
  public init(coordinates : [[Int]])
  {
    //default values for Submarine
    super.init(size : 3, symbol : "Ө", name : "Submarine", coordinates : coordinates)
  }
}
