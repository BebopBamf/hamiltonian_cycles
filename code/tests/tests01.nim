import unittest

import eatsporkpkg/eppstein
import eatsporkpkg/graph

#[

# Simple graph with a vertex of degree 0
let graphv0 = newAdjTable([(0, @[]), (1, @[2]), (2, @[1])])
let graphv1 = newAdjTable([(0, @[1]), (1, @[0, 2]), (2, @[1])])

# Sample graph with degree 2 vertices
let graphv2 = newAdjTable([(0, @[1, 2]), (1, @[0, 2]), (2, @[0, 1])])

# Simple graph with a vertex of degree 1

# Resulting Test Arrays
let noPath: AdjTable = newAdjTable([])

test "fails with degree 0 and 1 vertex":
    check hamCycleEpp(graphv0) == noPath
    check hamCycleEpp(graphv1) == noPath
    check hamCycleEpp(graphv2) != noPath

]#

let matrix1 = newMatrix(5, [0, 1, 0, 1, 0,
                                1, 0, 1, 1, 1,
                                0, 1, 0, 0, 1,
                                1, 1, 0, 0, 1,
                                0, 1, 1, 1, 0,])
    #hamCycle(matrix1)
    if(containsHamCycle(matrix1) == false):
        echo "testMatrix Failed"
    else:
        echo "testMatrix Passed"

