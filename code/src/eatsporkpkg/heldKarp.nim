import graph

proc hamCycleHeldKarp*(startNode: int, graph: Matrix): Matrix =
    let n = graph.vertex

    let finishedState = (1 << n) - 1

    let state = 1 << startNode
    var memo: array[n, array[1 << n, int]]
    var prev: array[n, array[1 << n, int]]

    proc findPath(i: int, state: int):
        if (state == finishedState):
            return index(graph, i, startNode)

        if (memo[i][state] != nil):
            return memo[i][state]

        var minDistance = high(int)
        var index = -1
        for next in 0..n:
            if (state & (1 << next) != 0):
                continue
            
            let nextState = state | (1 << next)
            let nextDistance = distance[i][next] + findPath(next, nextState)
            if (nextDistance < minDistance):
                minDistance = nextDistance
                index = next
            
        prev[i][state] = index
        memo[i][state] = minDistance
        return memo[i][state]

    let distance = findPath(startNode, state)
    var idx = startNode
    
    var hamPath: Matrix = newMatrix
    while true:
