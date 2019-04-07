function test_interface(::Type{T}) where T
    for S in subtypes(T)
        _test_interface(S{Int}) 
    end
end

function _test_interface(::Type{T}) where T<:AbstractList
    @testset "$(T)" begin
        l = T()
        @testset "basics" begin
            @test isempty(l)
            @test length(l) == 0
            @test currentposition(l) == 1
            @test_throws ArgumentError getvalue(l)
            @test eltype(l) == Int
        end
        @testset "move position empty" begin
            movetoend!(l)
            @test currentposition(l) == 1
            movetoposition!(l, 1)
            @test currentposition(l) == 1
            movetostart!(l)
            @test currentposition(l) == 1
            @test_throws BoundsError(l, 2) movetoposition!(l, 2)
            @test_throws BoundsError(l, 0) movetoposition!(l, 0)
        end
        @testset "insert!, remove! and append!" begin
            append!(l, 5)
            append!(l, 10)
            movetoposition!(l, 2)
            insert!(l, 7)
            movetoposition!(l, 4)
            @test_throws ArgumentError remove!(l)
            insert!(l, 15)
            @test remove!(l) == 15
            next!(l)
            prev!(l)
            prev!(l)
            @test remove!(l) == 7
            movetostart!(l)
            @test remove!(l) == 5
            movetoend!(l)
            @test_throws ArgumentError remove!(l)
            prev!(l)
            @test remove!(l) == 10
            @test isempty(l)
            @test currentposition(l) == 1
        end
    end
end

function _test_interface(::Type{T}) where T<:AbstractQueue
    @testset "$(T)" begin
        q = T()
        @testset "basics" begin
            @test isempty(q)
            @test length(q) == 0
            @test_throws ArgumentError frontvalue(q)
            @test eltype(q) == Int
        end
        @testset "enqueue! and dequeue!" begin
            enqueue!(q, 5)
            enqueue!(q, 10)
            @test dequeue!(q) == 5
            enqueue!(q, 15)
            @test frontvalue(q) == 10
            @test dequeue!(q) == 10
            dequeue!(q)
            @test_throws ArgumentError dequeue!(q)
            @test isempty(q)
        end
    end
end

function _test_interface(::Type{T}) where T<:AbstractStack
    @testset "$(T)" begin
        s = T()
        @testset "basics" begin
            @test isempty(s)
            @test length(s) == 0
            @test_throws ArgumentError topvalue(s)
            @test eltype(s) == Int
        end
        @testset "push! and pop!" begin
            push!(s, 5)
            push!(s, 10)
            @test pop!(s) == 10
            push!(s, 15)
            @test topvalue(s) == 15
            @test pop!(s) == 15
            pop!(s)
            @test_throws ArgumentError pop!(s)
            @test isempty(s)
        end
    end
end


test_interface(AbstractList)
test_interface(AbstractQueue)
test_interface(AbstractStack)

