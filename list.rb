## 
# This class represents a node of a linked list

class Node

    attr_accessor :next_node, :val

    # Creates a new node pointing to +next_node+ with a value of +val+
    # Params:
    # +next_node+:: next node in the list 
    # +val+:: value of the node
    def initialize(next_node, val)
        @next = next_node
        @val = val
    end

    # Inserts a new +node+ into the +node_list+. 
    # Assumes +node_list+ is sorted
    # Returns the new head of the list
    # Params:
    # +node+:: the node to be inserted into the list
    # +node_list+:: the head of the sorted list
    def insert(node, node_list)
        curr_node = node_list
        node_value = node.val
        # If the head of the list is nil, node becomes the head
        if(curr_node == nil)
            return node
        end
        # Iterate over the whole linked list
        while(curr_node != nil)
            # If the node value is less than the first node, insert it in the beginning
            if(curr_node.next_node == nil && node_value < curr_node.val)
                temp_node = node_list
                node_list = node
                node.next_node = temp_node
                return node
            # If the node value is more than the last node, insert it in the end
            elsif(curr_node.next_node == nil && node_value => curr_node.val)
                curr_node.next_node = node
                return node_list
            # Otherwise, add the node in between two elements 
            elsif((node_value => curr_node.val || node_value > curr_node.val) && node_value < curr_node.next_node.val)
                temp_node = curr_node.next_node
                curr_node.next_node = node
                node.next_node = temp_node
                puts "#{curr_node.val} #{node.val} #{node.next_node.val}"
                return node_list
            end
            # Set the current node to the next node in the list
            curr_node = curr_node.next_node
        end
    end

    # Display all nodes in the list
    # +node+:: The head of the linked list
    def display_all(node)
        curr_node = node
        while(curr_node != nil)
            puts "#{curr_node.val}"
            curr_node = curr_node.next_node
        end
    end
end

# Simple test of inserting nodes out of order to confirm that the list stays sorted
head = Node.new(nil, 10)
new_node = Node.new(nil, 5)
new_node2 = Node.new(nil, 7)
head.insert(new_node, head)
new_head = new_node.insert(new_node2, new_node)
new_head.display_all(new_head)





