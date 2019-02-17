mutable struct BinarySearchTree{T,K} <: AbstractDictionary{T,K}
    root::BinarySearchNode{T}
    size::Int
    function BinarySearchTree{T,K}() where {T,K}
        root = BinarySearchNode{T}()
        size = 0
        new(root, size)
    end
end

#FIXME You need a fucking EmptyNode Type

### Helper methods

function _insert(r::BinarySearchNode, key, item)

end

function _remove(r::BinarySearchNode, key)

end

function _find(r::BinarySearchNode, key)
    if (key < r.key) && (r.leftchild !== r)
        _find(r.leftchild, key)
    elseif (key > r.key) && (r.rightchild !== r)
        _find(r.rightchild, key)
    elseif key == r.key
        return r.data
    else
        return nothing
    end
end

# Non-Null approach avoids reassigning every child to every
# node along the path from the root to the parent of the new 
# node. However, at less simple insertion process (see book).
function _insert!(r::BinarySearchNode, key, item)
    if (key < r.key)
        if r.leftchild === r
            setleftchild!(r, BinarySearchNode(key, item))
        else
            _insert!(r.leftchild, key, item)
        end
    else
        if r.rightchild === r
            setrightchild!(r, BinarySearchNode(key, item))
        else
            _insert!(r.rightchild, key, item)
        end
    end
end

### Interface

isempty(d::BinarySearchTree) = d.size == 0
length(d::BinarySearchTree) = d.size

function find(t::BinarySearchTree, key)
    (t.size == 0) && throw(ArgumentError("Empty tree"))
    return _find(t.root, key)
end

function insert!(t::BinarySearchTree, key, item)
    if t.size == 0
        setkey!(t.root, key)
        setvalue!(t.root, item)
    else
        _insert!(t.root, key, item)
    end
    t.size += 1
end

