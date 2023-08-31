#include <stdio.h>
#include <stdlib.h>

// gcc MyLinkedList.c && ./a.out

// Can use typedef, to not have to use the more verbose
// i.e. "struct LinkedList" everywhere we declare the struct
// typedef struct LinkedList {
//     struct Node *head;
// } LinkedList;

struct LinkedList {
    struct Node *head;
};

struct Node {
    int value;
    struct Node *next;
};

struct Node *head = NULL;

struct LinkedList* createList() {
    struct LinkedList *ll = malloc(sizeof(struct LinkedList));

    return ll;
}

void addFirst(struct LinkedList *list, int value) {
    struct Node *node = malloc(sizeof(struct Node));

    node->value = value;
    node->next = NULL;

    if (list->head == NULL) {
        list->head = node;
    } else {
        struct Node *current = head;

        node->next = list->head;
        list->head = node;
    }
}

void addLast(struct LinkedList *list, int value) {
    struct Node *node = malloc(sizeof(struct Node));

    node->value = value;
    node->next = NULL;

    if (list->head == NULL) {
        list->head = node;
    } else {
        struct Node *current = list->head;

        while (current != NULL && current->next != NULL) {
            current = current->next;
        }

        current->next = node;
    }
}

void removeFirst(struct LinkedList* list) {
    if (list->head != NULL) {
        if (list->head->next == NULL) {
            list->head = NULL;
        } else {
            struct Node* tmp = list->head;

            tmp = list->head;

            list->head = list->head->next;

            free(tmp);
        }
    }
}

void removeLast(struct LinkedList* list) {
    if (list->head != NULL) {

        if (list->head->next == NULL) {
            list->head = NULL;
        } else {
            struct Node* current = malloc(sizeof(struct Node));

            current = list->head;

            while(current != NULL && current->next->next != NULL) {
                current = current->next;
            }

            struct Node* tmp = current->next;

            current->next = NULL;

            free(tmp);
        }
    }
}

int getFirst(struct LinkedList* list, int *value) {
    if (list->head != NULL) {
        *value = list->head->value; // modify passed value inside function

        return 0; // Success
    }

    return -1; // Failure, in case of empty list
}

int getLast(struct LinkedList* list, int *value) {

    if (list->head != NULL) {
        struct Node* current =  malloc(sizeof(struct Node));

        current = list->head;

        while(current != NULL && current->next != NULL) {
            current = current->next;
        }

        *value = current->value;

        return 0; // Success
    }

    return -1; // Failure, in case of empty list
}

void freeList(struct LinkedList* list) {
    struct Node* tmp;

    while (list->head != NULL) {
        tmp = list->head;
        list->head = list->head->next;
        free(tmp);
    }
}

void display(struct LinkedList* list) {
    struct Node *node = list->head;

    while (node != NULL) {
        printf("[%d]-->", node->value);

        node = node->next;
    }

    printf("\n");
}

int main() {
    struct LinkedList *ll = createList();

    addLast(ll, 4);
    addLast(ll, 3);
    addLast(ll, 2);
    addLast(ll, 1);
    addFirst(ll, 5);
    addFirst(ll, 6);
    addFirst(ll, 7);

    removeFirst(ll);
    removeLast(ll);

    display(ll);

    int first;
    int firstResult = getFirst(ll, &first); // pass reference so that it can be modified in function directly

    if (firstResult == EXIT_SUCCESS) {
        printf("First Item: %d\n", first);
    } else {
        printf("List is empty\n");
    }

    int last;
    int lastResult = getLast(ll, &last);

    if (lastResult == EXIT_SUCCESS) {
        printf("Last Item: %d\n", last);
    } else {
        printf("List is empty\n");
    }

    freeList(ll);

    return 0;
}