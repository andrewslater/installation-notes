## Tree Node Structure
```java
public class TreeNode {
  public int val;
  public TreeNode left;
  public TreeNode right;
  public TreeNode(int val) {
    this.val = val;
  }
}  
```

## Breadth-First Traversal
With BFS we are traversing the tree one level at a time from the top to the bottom. This can be accomplished with the use of a queue.

```java
public void bfs(TreeNode root) {
  Queue<TreeNode> queue = new LinkedList<>();
  queue.add(root);
  
  while (!queue.isEmpty()) {
    TreeNode node = queue.poll();
    visit(node);
    if (root.left != null) queue.add(root.left);
    if (root.right != null) queue.add(root.right);
  }
}
```

## Depth-First Traversal
There are three types of depth-first tree traversal: Inorder, Preorder, Postorder. You can remember the meaning of each by thinking about how the root node is treated:

**In**order - The nodes are visited **in** order from left to right (Left -> Root -> Right).  
**Pre**order - The root node is visited before(**pre**) left and right nodes (Root -> Left -> Right).  
**Post**order - The root node is visited after(**post**) left and right nodes (Left -> Right -> Root).  

### Inorder (Left - Root - Right)
Inorder traversal can be used on a binary search tree (BST) to visit nodes in ascending or descending order.

#### Recursive Method
```java
public void dfs(TreeNode root) {
  if (root == null) return;
  
  dfs(root.left);
  visit(root);
  dfs(root.right);
}
```

#### Iterative Method
```java
public void dfs(TreeNode root) {
  Stack<TreeNode> stack = new Stack<>();
  TreeNode current = root;
  
  while (current != null || !stack.isEmpty()) {
    while (current != null) {
      stack.push(current);
      current = current.left;
  }
  
  current = stack.pop();  
  visit(current);
  current = current.right;
}
```


### Preorder (Root - Left - Right)
Preorder traversal is useful for making copies of trees and for generating prefix expressions from an expression tree.

#### Recursive Method
```java
public void dfs(TreeNode root) {
  if (root == null) return;
  
  visit(root);
  dfs(root.left);
  dfs(root.right); 
}
```

#### Iterative Method
```java
public void dfs(TreeNode root) {
  Stack<TreeNode> stack = new Stack<>();
  stack.add(root);
  
  while (!stack.isEmpty()) {
    TreeNode node = stack.pop();
    visit(node);
    stack.push(node.right);
    stack.push(node.left);
  }
}
```

### Postorder (Left - Right - Root)
#### Recursive Method
```java
public void dfs(TreeNode root) {
  if (root == null) return;
  
  dfs(root.left);
  dfs(root.right);
  visit(root);
}
```
#### Iterative Method

```java
public void dfs(TreeNode root) {
  Stack<TreeNode> stack1 = new Stack<>();
  Stack<TreeNode> stack2 = new Stack<>()'
  stack1.push(root);
  
  while (!stack1.isEmpty()) {
    TreeNode node = stack1.pop();
    stack2.push(node);
    if (node.left != null) stack1.push(node.left);
    if (node.right != null) stack1.push(node.right);
  }
  
  while (!stack2.isEmpty()) {
    TreeNode node = stack2.pop();
    visit(node);
  }
}
```
