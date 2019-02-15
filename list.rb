class Node
    attr_accessor :next_node, :val
    def initialize(next_node, val)
        @next = next_node
        @val = val
    end

    def insert(node, node_list)
        curr_node = node_list
        node_value = node.val
        # if there is no head then the to be inserted node becomes the head 
        if(curr_node == nil)
            return node
        end
        #while the current node is not nil
        while(curr_node != nil)
            #adding it to the beginnig of the list
            if(curr_node.next_node == nil && node_value < curr_node.val)
                temp_node = node_list
                node_list = node
                node.next_node = temp_node
                return node
            #adding it to the end of the list
            elsif(curr_node.next_node == nil && node_value => curr_node.val)
                curr_node.next_node = node
                return node_list
            #adding it in the middle of the list 
            elsif((node_value => curr_node.val || node_value > curr_node.val) && node_value < curr_node.next_node.val)
                temp_node = curr_node.next_node
                curr_node.next_node = node
                node.next_node = temp_node
                puts "#{curr_node.val} #{node.val} #{node.next_node.val}"
                return node_list
            end
            #iterate
            curr_node = curr_node.next_node
        end
    end

    #display all nodes given the head of a list
    def display_all(node)
        curr_node = node
        while(curr_node != nil)
            puts "#{curr_node.val}"
            curr_node = curr_node.next_node
        end
    end
end

#test case
head = Node.new(nil, 10)
new_node = Node.new(nil, 5)
new_node2 = Node.new(nil, 7)
head.insert(new_node, head)
new_head = new_node.insert(new_node2, new_node)
new_head.display_all(new_head)





