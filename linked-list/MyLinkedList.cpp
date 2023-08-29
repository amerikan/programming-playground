
// g++ MyLinkedList.cpp -o MyLinkedList && ./MyLinkedList

#include <iostream>

using namespace std;

template <class T>
// template <typename T>
class Node {
    public:
        T value;
        Node* next;

        Node(T val) {
            next = NULL;
            value = val;
        }
};

template <class U>
class LinkedList {
    private:
        Node<U>* head;

    public:
        LinkedList() {
            head = NULL;
        }

        // Adds an item to the beginning of the list.
        void addFirst(U value) {
            Node<U> *node = new Node<U>(value);

            node->next = head;
            head = node;
        }
        // Add an item to the end of the list
        void addLast(U value) {
            Node<U> *node = new Node<U>(value);

            if (head == NULL) {
                head = node;
            } else {
                Node<U> *current = head;

                while (current->next) {
                    current = current->next;
                }

                current->next = node;
            }
        }
        // Remove an item from the beginning of the list.
        void removeFirst() {
            if (head != NULL) {
                if (head->next) {
                    head = head->next;
                } else {
                    head = NULL;
                }
            }
        }
        // Remove an item from the end of the list
        void removeLast() {
            if (head != NULL) {
                if (head->next) {
                    Node<U>* current = head;

                    while (current->next->next) {
                        current = current->next;
                    }

                    current->next = NULL;
                } else {
                    head = NULL;
                }
            }
        }

        // Get the item at the beginning of the list
        U getFirst() {
            // TOOD: what if empty linked list?

            // if (head == NULL) {
                return head->value;
            // }
        }

        // Get the item at the end of the list
        U getLast() {
            // TOOD: what if empty linked list?
            Node<U> *current = head;

            while(current->next) {
                current = current->next;
            }

            return current->value;
        }

        void display() {
            Node<U> *current = head;

            while (current) {
                cout << "[" << current->value << "]-->";

                current = current->next;
            }

            cout << endl;
        }
};

int main() {
    // Try a string linked list
    LinkedList<string> *ll = new LinkedList<string>();

    ll->addLast("cat");
    ll->addLast("dog");
    ll->addFirst("alligator");

    ll->display();

    cout << "First Item: " << ll->getFirst() << endl;
    cout << "Last Item: " << ll->getLast() << endl;

    // Try a int linked list
    LinkedList<int> *ll2 = new LinkedList<int>();

    ll2->addLast(4);
    ll2->addLast(3);
    ll2->addLast(2);
    ll2->addLast(1);
    ll2->addFirst(5);
    ll2->addFirst(6);

    ll2->removeFirst();
    ll2->removeLast();

    ll2->display();

    cout << "First Item: " << ll2->getFirst() << endl;
    cout << "Last Item: " << ll2->getLast() << endl;

    return 0;
}