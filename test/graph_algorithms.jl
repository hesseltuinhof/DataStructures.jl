@testset "dijkstra (dense)" begin
    begin
        g = AdjacencyMatrix(5)
        setedge!(g, 1, 2, 10)
        setedge!(g, 1, 3, 3)
        setedge!(g, 1, 4, 20)
        setedge!(g, 2, 4, 5)
        setedge!(g, 3, 2, 2)
        setedge!(g, 4, 5, 11)
        setedge!(g, 3, 5, 15)
    end
    @test dijkstra(g, 1) == [0, 5, 3, 10, 18]
end

@testset "dijkstra (sparse)" begin
    begin
        g = AdjacencyList(5)
        setedge!(g, 1, 2, 10)
        setedge!(g, 1, 3, 3)
        setedge!(g, 1, 4, 20)
        setedge!(g, 2, 4, 5)
        setedge!(g, 3, 2, 2)
        setedge!(g, 4, 5, 11)
        setedge!(g, 3, 5, 15)
    end
    @test dijkstra(g, 1) == [0, 5, 3, 10, 18]
end


@testset "jarnik (dense)" begin
    begin
        g = AdjacencyMatrix(6)
            setedge!(g, 1, 3, 7)
            setedge!(g, 3, 1, 7)
            setedge!(g, 1, 5, 9)
            setedge!(g, 5, 1, 9)
            setedge!(g, 3, 2, 5)
            setedge!(g, 2, 3, 5)
            setedge!(g, 3, 4, 1)
            setedge!(g, 4, 3, 1)
            setedge!(g, 3, 6, 2)
            setedge!(g, 6, 3, 2)
            setedge!(g, 2, 6, 6)
            setedge!(g, 6, 2, 6)
            setedge!(g, 4, 6, 2)
            setedge!(g, 6, 4, 2)
            setedge!(g, 5, 6, 1)
            setedge!(g, 6, 5, 1)
        result = AdjacencyMatrix(6)
            setedge!(result, 1, 3, 7)
            setedge!(result, 3, 1, 7)
            setedge!(result, 3, 2, 5)
            setedge!(result, 2, 3, 5)
            setedge!(result, 3, 4, 1)
            setedge!(result, 4, 3, 1)
            setedge!(result, 3, 6, 2)
            setedge!(result, 6, 3, 2)
            setedge!(result, 5, 6, 1)
            setedge!(result, 6, 5, 1)
    end
    @test jarnik(g, 1) == result
end
