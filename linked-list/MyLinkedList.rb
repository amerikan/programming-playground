# ruby MyLinkedList.rb

class Node
    # to be able to access from outside, otherwise need to set
    # getter and setter as methods. to limit read/write you can use
    # attr_read/attr_write respectively, attr_accessor does both
    attr_accessor :value
    attr_accessor :next

    def initialize(value)
        # @ just denotes an instance variable
        # there are also @@ variables which denote class variable
        @value = value
        @next = nil
    end
end

class LinkedList
    def initialize
        @head = nil
    end

    def addLast(value)
        newNode = Node.new(value) # instantiation

        if @head.nil?
            # the nil? method checks for nil, ? is valid method or variable name, commonly used for variables that return or hold booleans
            @head = newNode
        else
            current = @head

            while current.next do
                current = current.next
            end

            current.next = newNode
        end
    end

    def addFirst(value)
        newNode = Node.new(value)

        if @head.nil?
            @head = newNode
        else
            newNode.next = @head
            @head = newNode
        end
    end

    def removeFirst
        unless @head.nil?
            if @head.next
                @head = @head.next
            else
                @head = nil
            end
        end
    end

    def removeLast
        unless @head.nil?
            if @head.next.nil?
                @head = nil
            else
                current = @head

                while current.next.next do
                    current = current.next
                end

                current.next = nil
            end
        end
    end

    def getFirst
        unless @head.nil?
            return @head.value
        end

        nil # last expression in function always is implicitly returned
    end

    def getLast
        unless @head.nil?
            current = @head

            while current.next do
                current = current.next
            end

            return current.value
        end

        nil
    end

    def display
        unless @head.nil?
            current = @head

            while !current.nil? do
                puts "[#{current.value}]->"

                current = current.next
            end
        end
    end
end

ll = LinkedList.new

ll.addLast(4)
ll.addLast(3)
ll.addLast(2)
ll.addLast(1)
ll.addFirst(5)
ll.addFirst(6)
ll.addFirst(7)

ll.removeFirst
ll.removeLast

ll.display

puts "First Item: " + ll.getFirst.to_s
puts "Last Item: " + ll.getLast.to_s