# greedy algorithm
#------------------------matrices stuff i stole from somewhere

type
    Matrix = object
        #data: array[vertices, array[vertices, int]]
        Vertices: int
        data: seq[int]

proc newMatrix*(vertices: int, d: openarray[int]): Matrix =
    result.Vertices = vertices
    newSeq(result.data, vertices*vertices)
    if len(d)<(vertices*vertices):
      raise newException(IndexError, "insufficient data supplied in matrix constructor")

    for i in countup(0,vertices*vertices-1):
      result.data[i] = d[i]

proc newMatrix*(vertices: int): Matrix =
    result.Vertices = vertices
    newSeq(result.data, vertices*vertices)
    for i in countup(0,vertices*vertices-1):
      result.data[i] = (0)

proc index(x: Matrix, row, column: int): int =
    return x.data[row*x.Vertices+column]

#-----------------------matrices stuff i stole from somewhere


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
    
    if position == self.Vertices:
        #if the last node and first node is adjacent, it is a cycle
        if self.index(path[position-1], path[0]) == 1:
            for vertex in path:
                stdout.write vertex, " "
            echo(path[0]) 
            #return true
        else:
            return false

    
    for v in 0 .. self.Vertices-1:
        #if self.isAdjacent(v, position, path) == true:
        if isAdjacent(self, v, position, path) == true:
            path[position] = v
            
            #Checks if the previous node and current node in the path are adjacent
            if self.hamCycleChecks(path, position+1) == true:
                return true
            
            #removes current node if it does not result in a solution
            path[position] = -1

    return false

proc hamCycle*(self: Matrix): void = 
    #create a empty path sequence and fill it with -1
    var path = newSeq[int](self.Vertices)
    for i in 0 .. self.Vertices-1:
        path[i] = -1

    #for every node in the graph, find all the hamiltonain cycles
    for s in 0 .. self.Vertices-1:
        path[0] = s
        if hamCycleChecks(self, path, 1) == false:
            stdout.write ""
    return 

    



var matrix1 = newMatrix(5, [0, 1, 0, 1, 0,
                            1, 0, 1, 1, 1,
                            0, 1, 0, 0, 1,
                            1, 1, 0, 0, 1,
                            0, 1, 1, 1, 0,])
hamCycle(matrix1)
#
#
#
#var matrix2 = newMatrix(5, [0, 1, 0, 1, 0,
#                            1, 0, 1, 1, 1,
#                            0, 1, 0, 0, 1,
#                            1, 1, 0, 0, 0,
#                            0, 1, 1, 0, 0,])
#hamCycle(matrix2)

#var matrix3 = newMatrix(5, [0, 1, 1, 0, 1,
#                            1, 0, 1, 1, 1,
#                            1, 1, 0, 1, 0,
#                            0, 1, 1, 0, 1,
#                            1, 1, 0, 1, 0,])
#hamCycle(matrix3)
