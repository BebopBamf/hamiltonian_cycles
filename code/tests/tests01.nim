import unittest

import eatsporkpkg/eppstein
import eatsporkpkg/graph

# Simple graph with a vertex of degree 0
let graphv0 = newAdjList(@[@[], @[2u], @[1u]])

let graphv0 = newAdjList(@[@[1u], @[0u, 2u], @[1u]])

# Simple graph with a vertex of degree 1

# Resulting Test Arrays
let noPath: AdjList = @[]

test "fails with degree 0 and 1 vertex":
    check hamCycleEpp(graphv0) == noPath
