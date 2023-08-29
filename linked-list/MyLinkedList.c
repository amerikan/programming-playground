#include <stdio.h>
#include <stdlib.h>

// gcc MyLinkedList.c # to compile
// ./a.out # to run

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

int getFirst(struct LinkedList* list) {
    // TODO: throw error if empty
    return list->head->value;
}

int getLast(struct LinkedList* list) {
    // TODO: throw error if empty
    struct Node* current =  malloc(sizeof(struct Node));

    current = list->head;

    while(current != NULL && current->next != NULL) {
        current = current->next;
    }

    return current->value;
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

    printf("First Item: %d\n", getFirst(ll));
    printf("Last Item: %d\n", getLast(ll));

    freeList(ll);

    return 0;
}

