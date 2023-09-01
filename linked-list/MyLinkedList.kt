// kotlinc MyLinkedList.kt -include-runtime -d MyLinkedList.jar && java -jar MyLinkedList.jar

// declare variables with var for mutable, or val for non-mutable

// Can have a primary constructor like this, but also many secondary constructors
class Node<V> constructor(var value: V) {
    // instance variables must be initialized, can be done via constructors too
    var next: Node<V>? = null
}

// Generics are supported
class LinkedList<T> {
    private var head: Node<T>? = null // supports nullable types (optionals)

    // when functions don't return anything we can use Unit (like void)
    // though setting a return type is optional if nothing is returned
    fun addLast(value: T): Unit {
        val newNode = Node<T>(value)

        // for instance variables can also be refer with this. i.e this.head
        if (head == null) {
            head = newNode
        } else {
            var current = head

            while (current?.next != null) {
                current = current.next
            }

            current?.next = newNode
        }
    }

    fun addFirst(value: T) {
        val newNode = Node<T>(value)

        if (head == null) {
            head = newNode
        } else {
            newNode.next = head
            head = newNode
        }
    }

    fun removeFirst() {
        if (head != null) {
            if (head?.next != null) {
                head = head?.next
            } else {
                head = null;
            }
        }
    }

    fun removeLast() {
        if (head != null) {
            if (head?.next != null) {
                var current = head

                while (current?.next?.next != null) {
                    current = current.next
                }

                current?.next = null
            } else {
                head = null
            }
        }
    }

    fun getFirst(): T? {
        if (head != null) {
            return head?.value;
        }

        return null
    }

    fun getLast(): T? {
        if (head != null) {
            var current = head

            while (current?.next != null) {
                current = current.next
            }

            return current?.value
        }

        return null;
    }

    fun display() {
        if (head != null) {
            var current = head

            while (current != null) {
                print("[${current.value}]->") // without no new line

                current = current.next
            }

            println() // new line
        }
    }
}

fun main() {
    // string linkedlist
    val ll = LinkedList<String>();

    ll.addLast("cat");
    ll.addLast("dog");
    ll.addFirst("alligator");

    ll.display();

    println("First Item: ${ll.getFirst()}");
    println("Last Item: ${ll.getLast()}");

    // int linkedlist
    val ll2 = LinkedList<Int>();

    ll2.addLast(4);
    ll2.addLast(3);
    ll2.addLast(2);
    ll2.addLast(1);
    ll2.addFirst(5);
    ll2.addFirst(6);
    ll2.addFirst(7);

    ll2.removeFirst();
    ll2.removeLast();

    ll2.display();

    println("First Item: ${ll2.getFirst()}");
    println("Last Item: ${ll2.getLast()}");
}
