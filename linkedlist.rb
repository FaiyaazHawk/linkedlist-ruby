# frozen_string_literal: true

class Node
  attr_accessor :value, :nextNode

  def initialize(value = nil, nextNode = nil)
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
      @head = Node.new(value, nil)
    else
      lastNode = @head
      lastNode = lastNode.nextNode until lastNode.nextNode.nil?
      lastNode.nextNode = Node.new(value, nil)
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
        count += 1
        currentNode = currentNode.nextNode
      end
    end

    count
  end

  attr_reader :head

  def tail
    lastNode = @head
    lastNode = lastNode.nextNode until lastNode.nextNode.nil?
    lastNode
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

    currentNode
  end

  def pop
    prevNode = nil
    endNode = @head
    until endNode.nextNode.nil?
      prevNode = endNode
      endNode = endNode.nextNode
    end
    prevNode.nextNode = nil
    endNode
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
    false
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
    nil
  end

  def to_s
    output = ''
    currentNode = @head
    until currentNode.nil?
      output << "(#{currentNode.value}) ->"
      currentNode = currentNode.nextNode
    end
    output << 'nil'
    output
  end

  def insert_at(value, index)
    if index > size
      puts 'index greater than list size'
    elsif index == size
      append(value)
    elsif index == 0
      prepend(value)
    else
      newNode = Node.new(value, at(index))
      prevNode = at(index - 1)
      prevNode.nextNode = newNode
    end
  end

  def remove_at(index)
    if index >= size
      puts 'index greater than list size'
    elsif index == 0
      @head = at(1)
    else
      preNode = at(index - 1)
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
