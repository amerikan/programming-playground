// go run MyLinkedList.go

package main

import (
    "fmt"
    "errors"
)

type Node[V any] struct {
    next *Node[V]
    value V
}

type LinkedList[T any] struct {
    head *Node[T]
}

// Go does not have classes.
// We can define methods on types though.
func (l *LinkedList[T]) addLast(value T) {
    newNode := Node[T]{nil, value}

    if l.head == nil {
        l.head = &newNode
    } else {
        current := l.head

        for current.next != nil {
            current = current.next
        }

        current.next = &newNode
    }
}

// * is a pointer receiver which allows mutation of type value
func (l *LinkedList[T]) addFirst(value T) {
    newNode := Node[T]{nil, value}

    if l.head == nil {
        l.head = &newNode
    } else {
        newNode.next = l.head
        l.head = &newNode
    }
}

// functions that begin with lower case are "private" and can
// only be used within the file, use capital letter to make it
// "exportable" to outside
func (l *LinkedList[T]) removeFirst() {
    if l.head != nil {
        if l.head.next == nil {
            l.head = nil
        } else {
            l.head = l.head.next
        }
    }
}

func (l *LinkedList[T]) removeLast() {
    if l.head != nil {
        current := l.head

        for current.next.next != nil {
            current = current.next
        }

        current.next = nil
    }
}

// we can omit * pointer here since nothing is getting modified
func (l LinkedList[T]) getFirst() (T, error) {
    if l.head != nil {
        return l.head.value, nil
    }

    var ret T

    return ret, errors.New("empty list");
}

// multiple return types are allowed
func (l LinkedList[T]) getLast() (T, error) {
    if l.head != nil {
        current := l.head

        for current.next != nil {
            current = current.next
        }

        return current.value, nil
    }

    var ret T

    return ret, errors.New("empty list");
}

func (l LinkedList[T]) display() {
    if l.head != nil {
        current := l.head

        for current != nil {
            fmt.Printf("[%v]->", current.value)

            current = current.next
        }
    }
}

func main() {
    // int linked list
    ll := LinkedList[int]{}

    ll.addLast(4)
    ll.addLast(3)
    ll.addLast(2)
    ll.addLast(1)
    ll.addFirst(5)
    ll.addFirst(6)
    ll.addFirst(7)

    ll.removeFirst()
    ll.removeLast()

    ll.display()

    first, err := ll.getFirst()

    if err == nil {
        fmt.Println("\nFirst Item: ", first)
    }

    second, err := ll.getLast()

    if err == nil {
        fmt.Println("Last Item: ", second)
    }

    // string linked list
    ll2 := LinkedList[string]{}

    ll2.addLast("tarantula")
    ll2.addLast("vulture")
    ll2.addLast("yak")
    ll2.addLast("zombat")
    ll2.addFirst("cat")
    ll2.addFirst("bat")
    ll2.addFirst("ant")

    ll2.removeFirst()
    ll2.removeLast()

    ll2.display()

    first2, err := ll2.getFirst()

    if err == nil {
        fmt.Println("\nFirst Item: ", first2)
    }

    second2, err := ll2.getLast()

    if err == nil {
        fmt.Println("Last Item: ", second2)
    }
}