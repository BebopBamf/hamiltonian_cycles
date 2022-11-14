# Named after the person who discovered this algorithm not anyone else,
# unfortunate name :(
import std/options
import std/tables
import zero_functional
import graph

# proc remove(v: index, w: index)

proc toEmptyEdge (e: seq[Vertex]): seq[Vertex] = @[]

# Find a hamiltonian cycle in a graph in ~O(1.260^n)
proc hamCycleEpp*(graph : AdjList): AdjList =
    for a in graph:
        if a.len < 2:
            return @[]

    # Mutable copy of the graph
    var mutGraph = graph --> enumerate()

    # Keep track of forced edges
    var inputForcedEdges = graph --> map(toEmptyEdge(it)) --> enumerate()
    var currentForcedEdges = graph --> map(toEmptyEdge(it)) --> enumerate()

    # Subgraph with vertices of degree 2 
    var degreeTwo = graph --> filter(it.len == 2) --> indexedMap(it)

    # Forced set S
    var forced: AdjList = @[]

    var actions: seq[proc (): Option[bool]] = @[]

    proc removeEdge(u: Vertex, v: Vertex): Option[bool] =
        let orig = mutGraph[u][v]

        let wasForced = currentForcedEdges --> exists(it.idx == v)
        if wasForced:
            currentForcedEdges()
    
    proc addIncedentD2(v: Vertex): Option[bool] =
        let (u, vSeq) = mutGraph[v]

    proc handleDegreeTwo(): Option[bool] =
        let v = degreeTwo.pop()

        proc unPop(): Option[bool] =
            degreeTwo.append(v)
        actions.append(unPop)

        return 

    proc findCycle(): bool =
        if degreeTwo.len > 0:
            return handleDegreeTwo()
    
    raise newException(IOError, "Unimplemented")
