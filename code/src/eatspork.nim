import std/parseopt

import eatsporkpkg/graph
import eatsporkpkg/backtracking 

let m = newMatrix(5, [0, 1, 0, 1, 0,
                            1, 0, 1, 1, 1,
                            0, 1, 0, 0, 1,
                            1, 1, 0, 0, 1,
                            0, 1, 1, 1, 0,])

proc writeVersion() =
  echo("<eatspork> Hamiltonian Cycle Algorithms CLI")
  echo("Version 0.1.0")

proc writeHelp() =
  writeVersion()

when isMainModule:
  echo("Starting Algorithms!")
  writeHelp()
  hamCycle(m)
