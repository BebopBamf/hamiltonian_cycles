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

proc containsHamCycle*(self: Matrix): bool =
    if self.vertices == 0 or self.vertices == 1:
        return false
    
    var path = initPath(self)

    if self.hamCycleChecksOneSol(path, 1) == false:
        #echo("Solution does not exist")
        return false
    
    #self.printSol(path)
    return true


proc hamCycleEveryPerm*(self: Matrix): void =
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

proc hamCycle*(self: Matrix): void = 
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
