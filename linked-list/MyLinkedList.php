<?php
// php MyLinkedList.php

class Node  {
    // instance variables
    // Typing is optional in php
    public int $value;
    public ?Node $next = null; // type that start with ? are nullable (optional type)

    // constructor
    function __construct(int $value) {
        $this->value = $value;
    }
}

class LinkedList {
    private ?Node $head = null;

    // if function doesn't return a value, it can be annotated with void
    function addLast(int $value): void {
        $newNode = new Node($value);

        // $this refers to instance variable
        if ($this->head == null) {
            $this->head = $newNode;
        } else {
            $current = $this->head;

            while ($current->next) {
                $current = $current->next;
            }

            $current->next = $newNode;
        }
    }

    function addFirst(int $value): void {
        $newNode = new Node($value);

        if ($this->head == null) {
            $this->head = $newNode;
        } else {
            $newNode->next = $this->head;
            $this->head = $newNode;
        }
    }

    function removeFirst(): void {
        if ($this->head != null) {
            if ($this->head->next) {
                $this->head = $this->head->next;
            } else {
                $this->head = null;
            }
        }
    }

    function removeLast(): void {
        if ($this->head != null) {
            $current = $this->head;

            while ($current->next->next) {
                $current = $current->next;
            }

            $current->next = null;
        }
    }

    function getFirst(): ?int {
        if ($this->head != null) {
            return $this->head->value;
        }

        return null;
    }

    function getLast(): ?int {
        if ($this->head != null) {
            $current = $this->head;

            while ($current->next) {
                $current = $current->next;
            }

            return $current->value;
        }

        return null;
    }

    function display(): void {
        if ($this->head != null) {
            $current = $this->head;

            while ($current) {
                print "[$current->value]->";

                $current = $current->next;
            }

            print "\n";
        }
    }
}

$ll = new LinkedList();

$ll->addLast(1);
$ll->addLast(3);
$ll->addLast(2);
$ll->addLast(1);
$ll->addFirst(5);
$ll->addFirst(6);
$ll->addFirst(7);

$ll->removeFirst();
$ll->removeLast();

$ll->display();

// use double quote for direct string interpolation
print "First Item: {$ll->getFirst()}\n";
print "Last Item: {$ll->getLast()}\n";

// since most of my variables and methods are using type annotations set to int,
// a string type linked list won't work. I could remove the type annotations or
// even set the type to "mixed" for it to work. I can't use generics since as of
// php 8.2 they're not supported. With an IDE it's possible to use type templates
// via comments