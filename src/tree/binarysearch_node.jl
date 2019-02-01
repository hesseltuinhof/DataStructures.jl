mutable struct BinarySearchNode{T} <: BinaryNode{T}
    key
    data::T
    leftchild::BinarySearchNode{T}
    rightchild::BinarySearchNode{T}
    function BinarySearchNode{T}() where T
        n = new()
        n.leftchild = n.rightchild = n
        n
    end
    function BinarySearchNode{T}(key, data) where T
        n = new()
        n.key = key
        n.data = data
        n.leftchild = n.rightchild = n
        n
    end
    function BinarySearchNode{T}(key, data, leftchild, rightchild) where T
        new(key, data, leftchild, rightchild)
    end
end 

function BinarySearchNode(key, data, lc::BinarySearchNode{T}, rc::BinarySearchNode{T}) where T
    BinarySearchNode{T}(key, data, lc, rc)
end
BinarySearchNode(key, data::T) where T = BinarySearchNode{T}(key, data)

getvalue(n::BinarySearchNode) = n.data
setvalue!(n::BinarySearchNode, item) = (n.data = item)

getkey(n::BinarySearchNode) = n.key
setkey!(n::BinarySearchNode, key) = (n.key = key)

left(n::BinarySearchNode) = n.leftchild
setleft!(n::BinarySearchNode, node) = (n.leftchild = node)

right(n::BinarySearchNode) = n.rightchild
setright!(n::BinarySearchNode, node) = (n.rightchild = node)

isleaf(n::BinarySearchNode) = (n === n.leftchild === n.rightchild)
