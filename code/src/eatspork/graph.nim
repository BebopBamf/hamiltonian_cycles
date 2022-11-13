type
    Matrix = object
        vertices: int
        data: seq[int]


proc newMatrix*(verts: int, d: openarray[int]): Matrix =
    #places amount of verts into object instance
    result.vertices = verts
    newSeq(result.data, verts*verts)

    #checks if there is the correct amount of inputs in the adjacency matrix
    if len(d)<(verts*verts):
        raise newException(IndexError, "insufficient data supplied in matrix constructor")
    
    #raises error if adjacency matrix is invalid (contains a number that isnt 0 or 1)
    for i in countup(0,verts*verts-1):
        if d[i] != 0 and d[i] != 1:
            raise newException(IndexError, "Unknown number found")  
        result.data[i] = d[i]


proc newMatrix*(verts: int): Matrix =
    #places amount of verts into object instance
    result.vertices = verts

    #fills in matrix with 0s temporarily
    newSeq(result.data, verts*verts)
    for i in countup(0,verts*verts-1):
        result.data[i] = (0)


proc setData*(self: var Matrix, d: openarray[int]) =
    #checks if there is the correct amount of inputs in the adjacency matrix
    if len(d)<(self.vertices*self.vertices):
      raise newException(IndexError, "insufficient data supplied in matrix constructor")

    #raises error if adjacency matrix is invalid (contains a number that isnt 0 or 1)
    for i in countup(0,self.vertices*self.vertices-1):
        if d[i] != 0 and d[i] != 1:
            raise newException(IndexError, "Unknown number found")  
        self.data[i] = d[i]

proc index(self: Matrix, row, column: int): int =
    return self.data[row*self.vertices+column]
#----------matrix related


proc isAdjacent(self: Matrix, v: int, position: int, path: seq): bool =
    #checks if the current node is already in the path
    for vertex in path:
        if vertex == v:
            return false
    
    #Checks if the previous node and current node in the path are adjacent
    if self.index(path[position-1], v)==0:
        return false
    
    return true