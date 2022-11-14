# Named after the person who discovered this algorithm not anyone else,
# unfortunate name :(
import zero_functional
import graph

# proc remove(v: index, w: index)

proc toEmptyEdge (e: seq[Vertex]): seq[Vertex] = @[]

proc hamCycleEpp*(graph : AdjList): AdjList =
    for a in graph:
        if a.len < 2:
            return @[]

    # Mutable copy of the graph
    var mutGraph = graph --> map(it)

    var inputForcedEdges = graph --> map(toEmptyEdge(it)) --> enumerate()
    var currentForcedEdges = graph --> map(toEmptyEdge(it)) --> enumerate()
    
    var degreeTwo = graph --> filter(it.len == 2) --> indexedMap(it)

    var forced: AdjList = @[]

    echo degreeTwo

    raise newException(IOError, "Unimplemented")
