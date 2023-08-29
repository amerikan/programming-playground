// compile: javac <file>.java, file and class name must have same name
//      i.e. javac MyLinkedList.java  produce -> MyLinkedList.class
// run java <CompiledFile>.class
//      i.e. java MyLinkedList

public class MyLinkedList {
    public static void main(String args[]) {

        // String linked list
        LL<String> ll = new LL<>();

        ll.addLast("cat");
        ll.addLast("dog");
        ll.addFirst("alligator");

        ll.display();

        try {
            System.out.println("First Item: " + ll.getFirst());
            System.out.println("Last Item: " + ll.getLast());
        } catch (Exception e) {
            System.out.println(e);
        }


        // Integer linked list
        LL<Integer> ll2 = new LL<>();

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

        try {
            System.out.println("First Item: " + ll2.getFirst());
            System.out.println("Last Item: " + ll2.getLast());
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}

class Node<V> {
    Node<V> next = null;
    V value;

    public Node(V val) {
        value = val;
    }
}

class LL<T> {
    private Node<T> head;

    public void LL() {
        head = null;
    }

    public void addFirst(T val) {
        Node<T> newNode = new Node<>(val);

        if (head == null) {
            head = newNode;
        } else {
            newNode.next = head;
            head = newNode;
        }
    }

    public void addLast(T val) {
        Node<T> newNode = new Node<>(val);

        if (head == null) {
            head = newNode;
        } else {
            Node<T> current = head;

            while (current != null && current.next != null) {
                current = current.next;
            }

            current.next = newNode;
        }
    }

    public void removeFirst() {
        if (head != null) {
            if (head.next != null) {
                head = head.next;
            } else {
                head = null;
            }
        }
    }

    public void removeLast() {
        if (head != null) {
            Node<T> current = head;

            while(current != null && current.next.next != null) {
                current = current.next;
            }

            current.next = null;
        }
    }

    public T getFirst() throws Exception {

        if (head == null) {
            throw new Exception("Empty linked list!");
        }

        return head.value;
    }

    public T getLast() throws Exception {
        Node<T> current = head;

        if (current == null) {
            throw new Exception("Empty linked list!");
        }

        while(current != null && current.next != null) {
            current = current.next;
        }

        return current.value;
    }

    public void display() {
        if (head != null) {
            Node<T> current = head;

            while(current != null) {
                System.out.print("[" + current.value + "]->");

                current = current.next;
            }

            System.out.println();
        }
    }
}
