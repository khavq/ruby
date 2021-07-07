# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def build_root(arr)
  arr.with_index.reduce([]).
end

def height(root)
  return 0 unless root

  l_height = height(root.left)
  r_height = height(root.right)

  [height(root.left), height(root.right)].max + 1
end

def is_balanced(root)
  return true if root == nil
  return false unless is_balanced(root.left) && is_balanced(root.right)
  return (height(root.left) - height(root.right)).abs <= 1
end

root = build_root([3,9,20,nil,nil,15,7])

p is_balanced(root) == true
