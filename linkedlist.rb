class Node
    attr_accessor :value, :nextNode

    def initialize(value = nil,nextNode = nil)
        @value = value
        @nextNode = nextNode
    end
end

class Linkedlist
    attr_accessor :head
    def initialize
        @head = nil
    end

    def append(value)
        if @head.nil?
            @head = Node.new(value,nil)
        else
            lastNode = @head
            until lastNode.nextNode.nil?
                lastNode = lastNode.nextNode
            end
            lastNode.nextNode = Node.new(value,nil)
        end
    end

    def prepend(value)
        newHead = Node.new(value)
        newHead.nextNode = @head
        @head = newHead
    end

    def size
        count = 1
        if head.nextNode.nil?
            return count
        else
            currentNode = @head
            until currentNode.nextNode.nil?
                count +=1
                currentNode = currentNode.nextNode
            end
        end
        return count        
    end

    def head
        return @head
    end

    def tail
        lastNode = @head
        until lastNode.nextNode.nil?
            lastNode = lastNode.nextNode
        end
        return lastNode
    end

    def at(index)
        currentNode = @head
        currentindex = 0
        if index == 0
            return @head
        else
            until currentindex == index
                currentindex += 1
                currentNode = currentNode.nextNode
            end
        end
        return currentNode
    end

    def pop
        prevNode = nil
        endNode = @head
        until endNode.nextNode.nil?
            prevNode = endNode
            endNode = endNode.nextNode
        end
        prevNode.nextNode = nil
        return endNode
    end

    def contains?(value)
        currentNode = @head
        until currentNode.nextNode.nil?
            if currentNode.value == value
                return true
            else
                currentNode = currentNode.nextNode
            end
        end
        return false
        
    end
end

ll = Linkedlist.new
ll.append(10)
ll.append(20)
ll.append(30)
ll.append(40)
puts ll.head.value
puts ll.tail.value
puts ll.at(4)
p ll.pop
p ll
puts ll.contains?(10)
puts ll.contains?(50)