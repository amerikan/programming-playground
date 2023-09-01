// cd into MyLinkedListCS folder, then:
// dotnet run

class Node<U>
{
    // supports nullable values (optionals)
    public Node<U>? next = null;
    public U value;

    // constructor
    public Node(U value)
    {
        this.value = value;
    }
}

class LinkedList<T>
{
    // can access in methods using this. keyword
    private Node<T>? head = null;

    public void addLast(T value)
    {
        Node<T> newNode = new Node<T>(value);

        // could also use == null when check nulls
        if (head is null)
        {
            head = newNode;
        }
        else
        {
            Node<T> current = head;

            while (current.next is not null)
            {
                current = current.next;
            }

            current.next = newNode;
        }
    }

    public void addFirst(T value)
    {
        Node<T> newNode = new Node<T>(value);

        if (head is null)
        {
            head = newNode;
        }
        else
        {
            newNode.next = head;
            head = newNode;
        }
    }

    public void removeFirst()
    {
        if (head is not null)
        {
            if (head.next is null)
            {
                head = null;
            }
            else
            {
                head = head.next;
            }
        }
    }

    public void removeLast()
    {
        if (head is not null)
        {
            if (head.next is null)
            {
                head = null;
            }
            else
            {
                Node<T> current = head;

                while (current?.next?.next is not null)
                {
                    current = current?.next;
                }

                current.next = null;
            }
        }
    }

    public T getFirst()
    {
        if (head is not null)
        {
            return head.value;
        }

        // "default" keyword used for Generics to return default "null" for receiving T type
        // types have different type "nullables" and this choose appropriate one
        // return null;
        throw new InvalidOperationException();
    }

    public T getLast()
    {
         if (head is not null)
         {
            Node<T> current = head;

            while (current.next is not null)
            {
                current = current.next;
            }

            return current.value;
        }

        throw new InvalidOperationException();;
    }

    public void display()
    {
        if (head is not null)
        {
            Node<T> current = head;

            while (current is not null)
            {
                Console.Write($"[{current.value}]->");

                current = current.next;
            }

            Console.WriteLine();
        }
    }
}

class Program
{
    static void Main()
    {
        // int linked list
        LinkedList<int> ll = new LinkedList<int>();

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

        try
        {
            // string interpolation prefix quotes with $
            Console.WriteLine($"First Item: {ll.getFirst()}");
            Console.WriteLine("Last Item: " + ll.getLast());
        }
        catch
        {
            Console.WriteLine("List is empty");
        }

        // string linked list
        LinkedList<string> ll2 = new LinkedList<string>();

        ll2.addLast("cat");
        ll2.addLast("dog");
        ll2.addFirst("alligator");

        ll2.display();
    }
}
