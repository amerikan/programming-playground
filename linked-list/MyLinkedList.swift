// swift MyLinkedList.swift

class Node<V> {
    var value: V
    var next: Node? = nil

    init(val: V) {
        value = val
    }
}

class LinkedList<T> {
    private var head: Node<T>? = nil

    func addLast(value: T) {
        let newNode = Node<T>(val:value)

        if head == nil {
            head = newNode
        } else {
            var current = head;

            while current?.next != nil {
                current = current?.next
            }

            current?.next = newNode;
        }
    }

    func addFirst(value: T) {
        let newNode = Node<T>(val: value)

        if head == nil {
            head = newNode
        } else {
            newNode.next = head;
            head = newNode;
        }
    }

    func removeFirst() {
        if head != nil {

            if head?.next == nil {
                head = nil
            } else {
                head = head?.next
            }
        }
    }

    func removeLast() {
        if head != nil {
            if head?.next == nil {
                head = nil
            } else {
                var current = head;

                while current?.next?.next != nil {
                    current = current?.next;
                }

                current?.next = nil;
            }
        }
    }

    func getFirst() -> T? {
        if let head {
            return head.value;
        }

        return nil;
    }

    func getLast() -> T? {
        if let head {
            var current = head;

            while current.next != nil {
                current = current.next!
            }

            return current.value
        }

        return nil;
    }

    func display() {
        var current = head;

        while current != nil {
            if let value = current?.value {
                print("[\(value)]-->")
            }

            current = current?.next
        }
    }
}


let ll = LinkedList<Int>()

ll.addLast(value: 4)
ll.addLast(value: 3)
ll.addLast(value: 2)
ll.addLast(value: 1)
ll.addFirst(value: 5)
ll.addFirst(value: 6)
ll.addFirst(value: 7)

ll.removeFirst()
ll.removeLast()

ll.display()

if let first = ll.getFirst() {
    print("First Item: \(first)")
}

if let last = ll.getLast() {
    print("Last Item: \(last)")
}

let ll2 = LinkedList<String>()

ll2.addLast(value: "cat");
ll2.addLast(value: "dog");
ll2.addFirst(value: "alligator");

ll2.display();

if let first = ll2.getFirst() {
    print("First Item: \(first)")
}

if let last = ll2.getLast() {
    print("Last Item: \(last)")
}