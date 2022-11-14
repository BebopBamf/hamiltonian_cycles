import std/parseopt

import eatsporkpkg/graph
import eatsporkpkg/backtracking 

#method 1: 
#initialise a new matrix using:
#var matrixName = newMatrix(number of verts, [the adjacency matrix]), e.g.
var matrix1 = newMatrix(3, [1, 1, 1,
                            1, 1, 1,
                            1, 1, 1,])

#method 2: initialise a new matrix(number of verts)
var matrix2 = newMatrix(5)
#and then set the data afterwards
matrix2.setData([0, 1, 1, 0, 1,
                1, 0, 1, 1, 1,
                1, 1, 0, 1, 0,
                0, 1, 1, 0, 1,
                1, 1, 0, 1, 0,])

#possible commands:
#hamCycle()
#hamCycleEveryPerm()

proc writeVersion() =
  echo("<eatspork> Hamiltonian Cycle Algorithms CLI")
  echo("Version 0.1.0")

proc writeHelp() =
  writeVersion()

when isMainModule:
  echo("Starting Algorithms!")
  writeHelp()
  hamCycle(matrix2)
  hamCycleEveryPerm(matrix2)
