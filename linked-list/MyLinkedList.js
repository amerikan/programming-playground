// node MyLinkedList.js

class Node {
  constructor(val) {
    this.next = null;
    this.value = val;
  }
}

class LinkedList {
  constructor() {
    this.head = null;
  }

  addFirst(val) {
    const newNode = new Node(val);

    if (this.head === null) {
      this.head = newNode;
    } else {
      newNode.next = this.head;

      this.head = newNode;
    }
  }

  addLast(val) {

    const newNode = new Node(val);

    if (this.head == null) {
      this.head = newNode;
    } else {
      let current = this.head;

      while (current !== null && current.next !== null) {
        current = current.next;
      }

      current.next = newNode;
    }
  }

  removeFirst() {
    if (this.head !== null) {
      if (this.head.next) {
        this.head = this.head.next;
      } else {
        this.head = null;
      }
    }
  }

  removeLast() {
    let current = this.head;

    if (current !== null) {
      while (current.next !== null && current.next.next !== null) {
        current = current.next;
      }

      current.next = null;
    }
  }

  getFirst() {
    if (this.head === null) {
      throw new Exception("List is empty");
    }

    return this.head.value;
  }

  getLast() {
    if (this.head === null) {
      throw new Exception("List is empty");
    }

    let current = this.head;

    while(current.next !== null) {
        current = current.next;
    }

    return current.value;
  }

  display() {
    let current = this.head;

    while (current) {
      console.log(`[${current.value}]->`);

      current = current.next;
    }
  }
}

// Driver
const ll = new LinkedList();

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

console.log(`First Item: ${ll.getFirst()}`);
console.log(`Last Item: ${ll.getLast()}`);