# Named after the person who discovered this algorithm not anyone else,
# unfortunate name :(
import zero_functional
import graph

# proc remove(v: index, w: index)

proc hamCycleEpp*(graph : AdjList): AdjList =
    for a in graph:
        if a.len < 2:
            return @[]

    raise newException(IOError, "Unimplemented")
