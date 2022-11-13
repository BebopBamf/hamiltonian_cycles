import std/lists

import graph 

proc isAdjacent(self: Matrix, v: int, position: int, path: seq): bool =
    #checks if the current node is already in the path
    for vertex in path:
        if vertex == v:
            return false
    
    #Checks if the previous node and current node in the path are adjacent
    if self.index(path[position-1], v)==0:
        return false
    
    return true

proc hamCycleChecks(self: Matrix, path: var seq, position: int) : bool=
    #checks if the path is a cycle
    
    if position == self.vertices:
        #if the last node and first node is adjacent, it is a cycle
        if self.index(path[position-1], path[0]) == 1:
            self.printSol(path)
            #return true  <--- add this to only print first solution
        else:
            return false

    for v in 0 .. self.vertices-1:
        if isAdjacent(self, v, position, path) == true:
            path[position] = v
            
            #Checks if the previous node and current node in the path are adjacent
            if self.hamCycleChecks(path, position+1) == true:
                return true
            
            #removes current node if it does not result in a solution
            path[position] = -1
    return false

proc hamCycleChecksOneSol(self: Matrix, path: var seq, position: int): bool =
    #checks if the path is a cycle
    
    if position == self.vertices:
        #if the last node and first node is adjacent, it is a cycle
        if self.index(path[position-1], path[0]) == 1:
            return true
        else:
            return false

    for v in 1 .. self.vertices-1:
        if isAdjacent(self, v, position, path) == true:
            path[position] = v
            
            #Checks if the previous node and current node in the path are adjacent
            if self.hamCycleChecksOneSol(path, position+1) == true:
                return true
            
            #removes current node if it does not result in a solution
            path[position] = -1
    return false

proc printSol(self: Matrix, path: seq): void =
    #for every vertex in the path, print the vertex
    stdout.write "    "
    for vertex in path:
        stdout.write vertex, " "
    echo(path[0])
    return 

proc initPath(self: Matrix): seq =
    #create a empty path sequence and fill it with -1
    var path = newSeq[int](self.vertices)
    for i in 0 .. self.vertices-1:
        path[i] = -1
    
    path[0] = 0
    return path

proc containsHamCycle(self: Matrix): bool =
    if self.vertices == 0 or self.vertices == 1:
        return false
    
    var path = initPath(self)

    if self.hamCycleChecksOneSol(path, 1) == false:
        #echo("Solution does not exist")
        return false
    
    #self.printSol(path)
    return true


proc hamCycleEveryPerm(self: Matrix): void =
    #check for empty adjacency matrix
    if self.vertices == 0 or self.vertices == 1:
        echo("No solutions", "\n")
        return
    
    var path = initPath(self)
    
    #for every node in the graph, find all the hamiltonain cycles (including all permutations)
    echo("The solutions are:")
    for s in 0 .. self.vertices-1:
        path[0] = s
        if hamCycleChecks(self, path, 1) == false:
            stdout.write ""
    echo("no more solutions", "\n")
    return

proc hamCycle(self: Matrix): void = 
    #check for empty adjacency matrix
    if self.vertices == 0 or self.vertices == 1:
        echo("No solutions", "\n")
        return
    
    var path = initPath(self)

    #for every node in the graph, find all the hamiltonain cycles (no permutations)
    echo("The solutions are:")
    if hamCycleChecks(self, path, 1) == false:
        stdout.write ""
    echo("no more solutions", "\n")
    return

#-----------------------------------------------------testing

#check adjacency matrix validity: contains only 1s and 0s
proc isBinary(self: Matrix): bool=
    #for every input data in the matrix, check if it is a 0 or 1, if it isnt, return false
    for i in countup(0,self.vertices*self.vertices-1):
        if self.data[i] != 0 and self.data[i] != 1:
            echo("Unknown number found in adjacency matrix")
            return false
    return true

#test 1, refer to report testing justificaiton for visual representation
proc testMatrix(): void =
    var matrix1 = newMatrix(5, [0, 1, 0, 1, 0,
                                1, 0, 1, 1, 1,
                                0, 1, 0, 0, 1,
                                1, 1, 0, 0, 1,
                                0, 1, 1, 1, 0,])
    #hamCycle(matrix1)
    if(containsHamCycle(matrix1) == false):
        echo "testMatrix Failed"
    else:
        echo "testMatrix Passed"

proc testMatrix2(): void =
    var matrix = newMatrix(5)
    matrix.setData([0, 1, 1, 0, 1,
                    1, 0, 1, 1, 1,
                    1, 1, 0, 1, 0,
                    0, 1, 1, 0, 1,
                    1, 1, 0, 1, 0,])
    if(containsHamCycle(matrix) == false):
        echo "testMatrix2 Failed"
    else:
        echo "testMatrix2 Passed"

proc testMatrix3(): void =
    var matrix = newMatrix(5)
    matrix.setData([0, 1, 1, 1, 0,
                    1, 0, 1, 1, 1,
                    1, 1, 0, 0, 1,
                    1, 1, 0, 0, 1,
                    0, 1, 1, 1, 0,])
    if(containsHamCycle(matrix) == false):
        echo "testMatrix3 Failed"
    else:
        echo "testMatrix3 Passed"

proc testDirectedMatrix(): void =
    var matrix = newMatrix(6, [0, 1, 0, 0, 1, 0,
                                0, 0, 1, 0, 0, 0,
                                0, 0, 0, 1, 0, 0,
                                0, 0, 0, 0, 1, 1,
                                0, 0, 1, 0, 0, 1,
                                1, 0, 0, 0, 0, 0,])
    if(containsHamCycle(matrix) == false):
        echo "testDirectedMatrix1 Failed"
    else:
        echo "testDirectedMatrix1 Passed"

#test, does not contain hamiltonian cycle
proc testNoCycle(): void =
    var matrix2 = newMatrix(5, [0, 1, 0, 1, 0,
                                1, 0, 1, 1, 1,
                                0, 1, 0, 0, 1,
                                1, 1, 0, 0, 0,
                                0, 1, 1, 0, 0,])
    if(containsHamCycle(matrix2) == false):
        echo "testNoCycle Passed"
    else:
        echo "testNoCycle Failed"

proc testNoCycle2(): void =
    var matrix = newMatrix(8)
    matrix.setData([0, 1, 0, 0, 0, 0, 0, 1,
                    1, 0, 1, 0, 0, 0, 0, 0,
                    0, 1, 0, 1, 0, 1, 0, 1,
                    0, 0, 1, 0, 1, 0, 0, 0,
                    0, 0, 0, 1, 0, 1, 0, 0,
                    0, 0, 1, 0, 0, 0, 1, 0,
                    0, 0, 0, 0, 0, 1, 0, 0,
                    1, 0, 1, 0, 0, 0, 0, 0,])
    if(containsHamCycle(matrix) == false):
        echo "testNoCycle2 Passed"
    else:
        echo "testNoCycle2 Failed"

proc testDirectedNoCycle(): void =
    var matrix = newMatrix(7)
    matrix.setData([0, 1, 0, 0, 0, 0, 1,
                    0, 0, 1, 0, 0, 0, 0,
                    0, 0, 0, 0, 0, 1, 0,
                    0, 0, 1, 0, 0, 0, 0,
                    0, 0, 0, 1, 0, 0, 1,
                    0, 1, 0, 1, 1, 0, 0,
                    0, 0, 0, 0, 0, 1, 0,])
    if(containsHamCycle(matrix) == false):
        echo "testDirectedNoCycle Passed"
    else:
        echo "testDirectedNoCycle Failed"

proc testEmptyMatrix(): void =
    var matrix = newMatrix(0)
    #hamCycle(matrix)
    if(containsHamCycle(matrix) == false):
        echo "testEmptyMatrix Passed"
    else:
        echo "testEmptyMatrix Failed"

proc testInvalidMatrix(): void =

    try:
        var matrix1 = newMatrix(3, [3, 7, 5,
                                1, 1, 1,
                                1, 1, 1,])
        hamCycle(matrix1)
    except IndexDefect as e:
        echo "testInvalidMatrix Passed"

proc testSelfLoop(): void =
    var matrix = newMatrix(1, [1])
    if(containsHamCycle(matrix) == false):
        echo "testEmptyMatrix Passed"
    else:
        echo "testEmptyMatrix Failed"

#------------------------------------------------------testing


#main code area ------v

#method 1: 
#initialise a new matrix using:
#var matrixName = newMatrix(number of verts, [the adjacency matrix]), e.g.
var matrix1 = newMatrix(3, [1, 1, 1,
                            1, 1, 1,
                            1, 1, 1,])
#hamCycle(matrix1)

#method 2: initialise a new matrix(number of verts)
var matrix3 = newMatrix(5)
#and then set the data afterwards
matrix3.setData([0, 1, 1, 0, 1,
                1, 0, 1, 1, 1,
                1, 1, 0, 1, 0,
                0, 1, 1, 0, 1,
                1, 1, 0, 1, 0,])
#hamCycle(matrix3)

#tests
testMatrix()
testMatrix2()
testMatrix3()
testDirectedMatrix()
testNoCycle()
testNoCycle2()
testDirectedNoCycle()
testEmptyMatrix()
testInvalidMatrix()
testSelfLoop()
