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

    def find(value)
        currentNode = @head
        currentindex = 0
        until currentNode.nextNode.nil?
            if currentNode.value == value
                return currentindex
            else
                currentNode = currentNode.nextNode
                currentindex += 1
            end
        end
        return nil
    end

    def to_s
        output = ''
        currentNode = @head
        until currentNode.nil?
            output << "(#{currentNode.value}) ->"
            currentNode = currentNode.nextNode
        end
        output << 'nil'
        return output
    end

    def insert_at(value, index)
        if index > self.size
            return puts "index greater than list size"
        elsif (index) == self.size
            self.append(value)
        elsif index == 0
            self.prepend(value)
        else
            newNode = Node.new(value,self.at(index))
            prevNode = self.at(index-1)
            prevNode.nextNode = newNode
        end
    end

    def remove_at(index)
        if index >= self.size
            return puts "index greater than list size"
        elsif index == 0
            @head = self.at(1)
        else
            preNode = self.at(index-1)
            preNode.nextNode = preNode.nextNode.nextNode
        end
    end

end

ll = Linkedlist.new
ll.append(10)
ll.append(20)
ll.append(30)
ll.append(40)
ll.remove_at(3)
puts ll.to_s