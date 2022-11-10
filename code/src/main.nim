import std/parseopt

import eatspork/backtrackingOne 

let m = newMatrix(5, [0, 1, 0, 1, 0,
                            1, 0, 1, 1, 1,
                            0, 1, 0, 0, 1,
                            1, 1, 0, 0, 1,
                            0, 1, 1, 1, 0,])

proc writeVersion() =
  echo("Hamiltonian Cycle Algorithms CLI")
  echo("Version 0.0.1")

proc writeHelp() =
  writeVersion()

when isMainModule:
  echo("Starting Algorithms!")
  writeHelp()
  hamCycle(m)
