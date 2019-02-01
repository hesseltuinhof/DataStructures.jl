abstract type BinaryNode{T} <: AbstractNode{T} end

### Interface

# Return the node's value.
getvalue(n::BinaryNode) = nothing

# Set the node's value.
setvalue!(n::BinaryNode) = nothing

# Return node's left child.
left(n::BinaryNode) = nothing

# Set the node' left child.
setleft!(n::BinaryNode, node) = nothing

# Return node's left child.
right(n::BinaryNode) = nothing

# Set the node' left child.
setright!(n::BinaryNode, node) = nothing

# Check if node is a leaf.
isleaf(n::BinaryNode) = nothing

# generic traversal and others
# function traversal() end

# preorder, inorder, postorder, levelorder
