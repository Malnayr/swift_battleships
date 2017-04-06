/*
  filename: Submarine.swift
  author: Ryan Lam (CST215) & Joe Lam (CST234)
  date: 4/6/2017
*/

public class Submarine : Ship
{
  public init(coordinates : [[Int]])
  {
    super.init(size : 3, symbol : "Ө", name : "Submarine", coordinates : coordinates)
  }
}
