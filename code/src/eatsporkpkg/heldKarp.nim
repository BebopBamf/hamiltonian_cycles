import graph

proc hamCycleHeldKarp*(startNode: int, g: Matrix): Matrix =
    let n = g.vertices

    let finishedState = (1 shl n) - 1

    let state = 1 shl startNode
    var memo = newSeqUninitialized[int](n * (1 shl n))
    var prev = newSeqUninitialized[int](n * (1 shl n))

    proc findPath(i: int, state: int): int =
        if state == finishedState:
            return index(g, i, startNode)

        if memo[i * n + state].isNil:
            return memo[i * n + state]

        var minDistance = high(int)
        var index = -1
        for next in 0..n:
            if (state and (1 shl next)) != 0:
                continue
            
            let nextState = state or (1 shl next)
            let nextDistance = index(g, i, next) + findPath(next, nextState)
            if (nextDistance < minDistance):
                minDistance = nextDistance
                index = next
            
        prev[i*n + state] = index
        memo[i*n + state] = minDistance
        return memo[i*n + state]

    let distance = findPath(startNode, state)
    var idx = startNode
    
    var hamPath: Matrix = newMatrix()
