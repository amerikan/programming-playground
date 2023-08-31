// dart MyLinkedList.dart

class Node {
    Node? next;
    int? value;

    // constructor
    Node(int value) {
        this.value = value;
    }
}

class LinkedList {
    Node? head;

    void addLast(int value) {
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

    void addFirst(int value) {
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

    int? getFirst() {
        if (this.head != null) {
            return this.head?.value;
        }

        return null;
    }

    int? getLast() {
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
    var ll = LinkedList();

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

}