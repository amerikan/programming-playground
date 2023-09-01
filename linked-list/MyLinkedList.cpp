// g++ MyLinkedList.cpp -o MyLinkedList && ./MyLinkedList

#include <iostream>

using namespace std;

// template are similar to generics, but specialized at compile time, not run time
template <class T>
// there's also template <typename T>
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

        void addFirst(U value) {
            Node<U> *node = new Node<U>(value);

            node->next = head;
            head = node;
        }

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

        void removeFirst() {
            if (head != NULL) {
                if (head->next) {
                    head = head->next;
                } else {
                    head = NULL;
                }
            }
        }

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

        bool getFirst(U &value) {
            if (head != NULL) {
                value = head->value;

                return true;
            }

            return false;
        }

        bool getLast(U &value) {
            if (head != NULL) {
                Node<U> *current = head;

                while(current->next) {
                    current = current->next;
                }

                value = current->value;

                return true;
            }

            return false;
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
    // string linked list
    LinkedList<string> *ll = new LinkedList<string>();

    ll->addLast("cat");
    ll->addLast("dog");
    ll->addFirst("alligator");

    ll->display();

    string first1;
    int firstResult1 = ll->getFirst(first1);

    if (firstResult1) {
        cout << "First Item: " << first1 << endl;
    } else {
        cout << "List is empty" << endl;
    }

    string second1;
    int secondResult1 = ll->getLast(second1);

    if (secondResult1) {
        cout << "Last Item: " << second1<< endl;
    } else {
        cout << "List is empty" << endl;
    }

    // int linked list
    LinkedList<int> *ll2 = new LinkedList<int>();

    ll2->addLast(4);
    ll2->addLast(3);
    ll2->addLast(2);
    ll2->addLast(1);
    ll2->addFirst(5);
    ll2->addFirst(6);
    ll2->addFirst(7);

    ll2->removeFirst();
    ll2->removeLast();

    ll2->display();

    int first2;
    int firstResult2 = ll2->getFirst(first2);

    if (firstResult2) {
        cout << "First Item: " << first2 << endl;
    } else {
        cout << "List is empty" << endl;
    }

    int second2;
    int secondResult2 = ll2->getLast(second2);

    if (secondResult2) {
        cout << "Last Item: " << second2<< endl;
    } else {
        cout << "List is empty" << endl;
    }

    return 0;
}