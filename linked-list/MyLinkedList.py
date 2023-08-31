# python3 MyLinkedList.py

class Node:
    def __init__(self, value):
        self.value = value
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None

    def addLast(self, value):
        new_node = Node(value)

        if self.head is None:
            self.head = new_node
        else:
            current = self.head

            while current.next:
                current = current.next

            current.next = new_node

    def addFirst(self, value):
        new_node = Node(value)

        if self.head is None:
            self.head = new_node
        else:
            new_node.next = self.head
            self.head = new_node

    def removeFirst(self):
        if self.head is not None:
            if self.head.next:
                self.head = self.head.next
            else:
                self.head = None

    def removeLast(self):
        if self.head is not None:

            if self.head.next:
                current = self.head

                while current.next.next:
                    current = current.next

                current.next = None
            else:
                self.head = None

    def getFirst(self):
        if self.head is not None:
            return self.head.value

        return None

    def getLast(self):
        if self.head is not None:
            current = self.head

            while current.next:
                current = current.next

            return current.value

        return None

    def display(self):
        if self.head is not None:
            current = self.head

            while current:
                print(f"[{current.value}]->")

                current = current.next

ll = LinkedList();

ll.addLast(4);
ll.addLast(3);
ll.addLast(2);
ll.addLast(1);
ll.addFirst(5);
ll.addFirst(6);
ll.addFirst(7);

ll.removeFirst();
ll.removeLast();

ll.display();

print(f"First Item: {ll.getFirst()}");
print(f"Last Item: {ll.getLast()}");