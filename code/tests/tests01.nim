import unittest

import eatsporkpkg/eppstein
import eatsporkpkg/graph
import eatsporkpkg/backtracking

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

#let matrix1 = newMatrix(5, [0, 1, 0, 1, 0,
#                                1, 0, 1, 1, 1,
#                                0, 1, 0, 0, 1,
#                                1, 1, 0, 0, 1,
#                                0, 1, 1, 1, 0,])
##hamCycle(matrix1)
#if(containsHamCycle(matrix1) == false):
#    echo "testMatrix Failed"
#else:
#    echo "testMatrix Passed"

#tests, refer to report testing justificaiton for visual representation
#test, contains hamiltonian cycle
test "testMatrix":
    var matrix1 = newMatrix(5, [0, 1, 0, 1, 0,
                                1, 0, 1, 1, 1,
                                0, 1, 0, 0, 1,
                                1, 1, 0, 0, 1,
                                0, 1, 1, 1, 0,])
    check(containsHamCycle(matrix1) == true)

#test, contains hamiltonian cycle
test "testMatrix2":
    var matrix = newMatrix(5)
    matrix.setData([0, 1, 1, 0, 1,
                    1, 0, 1, 1, 1,
                    1, 1, 0, 1, 0,
                    0, 1, 1, 0, 1,
                    1, 1, 0, 1, 0,])
    check(containsHamCycle(matrix) == true)

#test, contains hamiltonian cycle
test "testMatrix3":
    var matrix = newMatrix(5)
    matrix.setData([0, 1, 1, 1, 0,
                    1, 0, 1, 1, 1,
                    1, 1, 0, 0, 1,
                    1, 1, 0, 0, 1,
                    0, 1, 1, 1, 0,])
    check(containsHamCycle(matrix) == true)

#test, contains hamiltonian cycle
test "testDirectedMatrix":
    var matrix = newMatrix(6, [0, 1, 0, 0, 1, 0,
                                0, 0, 1, 0, 0, 0,
                                0, 0, 0, 1, 0, 0,
                                0, 0, 0, 0, 1, 1,
                                0, 0, 1, 0, 0, 1,
                                1, 0, 0, 0, 0, 0,])
    check(containsHamCycle(matrix) == true)

#test, does not contain hamiltonian cycle
test "testNoCycle":
    var matrix2 = newMatrix(5, [0, 1, 0, 1, 0,
                                1, 0, 1, 1, 1,
                                0, 1, 0, 0, 1,
                                1, 1, 0, 0, 0,
                                0, 1, 1, 0, 0,])
    check(containsHamCycle(matrix2) == false)

#test, does not contain hamiltonian cycle
test "testNoCycle2":
    var matrix = newMatrix(8)
    matrix.setData([0, 1, 0, 0, 0, 0, 0, 1,
                    1, 0, 1, 0, 0, 0, 0, 0,
                    0, 1, 0, 1, 0, 1, 0, 1,
                    0, 0, 1, 0, 1, 0, 0, 0,
                    0, 0, 0, 1, 0, 1, 0, 0,
                    0, 0, 1, 0, 0, 0, 1, 0,
                    0, 0, 0, 0, 0, 1, 0, 0,
                    1, 0, 1, 0, 0, 0, 0, 0,])
    check(containsHamCycle(matrix) == false)

#test, does not contain hamiltonian cycle
test "testDirectedNoCycle":
    var matrix = newMatrix(7)
    matrix.setData([0, 1, 0, 0, 0, 0, 1,
                    0, 0, 1, 0, 0, 0, 0,
                    0, 0, 0, 0, 0, 1, 0,
                    0, 0, 1, 0, 0, 0, 0,
                    0, 0, 0, 1, 0, 0, 1,
                    0, 1, 0, 1, 1, 0, 0,
                    0, 0, 0, 0, 0, 1, 0,])
    check(containsHamCycle(matrix) == false)

#test, does not contain hamiltonian cycle
test "testEmptyMatrix":
    var matrix = newMatrix(0)
    check(containsHamCycle(matrix) == false)

#test, does not contain hamiltonian cycle
test "testInvalidMatrix":
    var result = false
    try:
        var matrix1 = newMatrix(3, [3, 7, 5,
                                1, 1, 1,
                                1, 1, 1,])
        hamCycle(matrix1)
        result = true
    except IndexDefect as e:
        result = false
    check(result == false)

#test, does not contain hamiltonian cycle
test "testSelfLoop":
    var matrix = newMatrix(1, [1])
    check(containsHamCycle(matrix) == false)




