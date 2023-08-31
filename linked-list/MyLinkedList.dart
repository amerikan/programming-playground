// dart MyLinkedList.dart

class Node<U> {
    Node? next;
    U? value;

    // constructor
    Node(U value) {
        this.value = value;
    }
}

class LinkedList<T> {
    Node? head;

    void addLast(T value) {
        var newNode = Node(value);

        if (this.head == null) {
            this.head = newNode;
        } else {
            var current = this.head;

            while (current?.next != null) {
                current = current?.next;
            }

            current?.next = newNode;
        }
    }

    void addFirst(T value) {
        var newNode = Node(value);

        if (this.head == null) {
            this.head = newNode;
        } else {
            newNode.next = this.head;
            this.head = newNode;
        }
    }

    void removeFirst() {
        if (this.head != null) {
            if (this.head?.next == null) {
                this.head = null;
            } else {
                this.head = this.head?.next;
            }
        }
    }

    void removeLast() {
        if (this.head != null) {
            if (this.head?.next == null) {
                this.head = null;
            } else {
                var current = this.head;

                while (current?.next?.next != null) {
                    current = current?.next;
                }

                current?.next = null;
            }
        }
    }

    T? getFirst() {
        if (this.head != null) {
            return this.head?.value;
        }

        return null;
    }

    T? getLast() {
        if (this.head != null) {
            var current = this.head;

            while (current?.next != null) {
                current = current?.next;
            }

            return current?.value;
        }

        return null;
    }

    void display() {
        if (this.head != null) {
            var current = this.head;

            while (current != null) {
                print("[${current.value}]->");

                current = current.next;
            }
        }
    }
}

void main() {
    // int linked list
    var ll = LinkedList<int>();

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

    print("First Item: ${ll.getFirst()}");
    print("Last Item: ${ll.getLast()}");

    // string linked list
    var ll2 = LinkedList<String>();

    ll2.addLast("cat");
    ll2.addLast("dog");
    ll2.addFirst("alligator");

    ll2.display();

    print("First Item: ${ll2.getFirst()}");
    print("Last Item: ${ll2.getLast()}");
}