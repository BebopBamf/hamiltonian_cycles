#[

# Named after the person who discovered this algorithm not anyone else,
# unfortunate name :(
import std/options
import std/tables
import zero_functional
import graph


proc toEmptyEdge (e: seq[Vertex]): seq[Vertex] = @[]

# Find a hamiltonian cycle in a graph in ~O(1.260^n)
proc hamCycleEpp*(graph : AdjTable): AdjTable =
    # Mutable Graph
    let hasDegreeOne = graph --> exists(it.len < 2)
    if hasDegreeOne:
        return newAdjTable([])
    
    var mGraph = graph --> map(it)

    var degreeTwoEdges = graph --> filter(it.len == 2)

    proc handleDegreeTwo(): Option[AdjTable] =
        let v = degreeTwoEdges.pop()
    
    proc hamCycleInner(graph: AdjTable, forcedSet: AdjTable): Option[AdjTable] =
        let hasDegreeOne = graph --> exists(it.len < 2)
        if hasDegreeOne:
            return newAdjTable([])
    
   
        return some(newAdjTable(@[(0, @[2])]))

]#