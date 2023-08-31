// ts-node MyLinkedList.ts

class MyNode<T> { // Named this way to avoid global Node name
    next: MyNode<T> | null = null;
    value: T;

    constructor(val: T) {
      this.value = val;
    }
  }

  class LinkedList<T> {
    head: MyNode<T> | null = null;

    constructor() {
    }

    addFirst(val: T): void {
      const newNode = new MyNode<T>(val);

      if (this.head === null) {
        this.head = newNode;
      } else {
        newNode.next = this.head;

        this.head = newNode;
      }
    }

    addLast(val: T): void {
      const newNode = new MyNode<T>(val);

      if (this.head === null) {
        this.head = newNode;
      } else {
        let current = this.head;

        while (current !== null && current.next !== null) {
          current = current.next;
        }

        current.next = newNode;
      }
    }

    removeFirst(): void {
      if (this.head !== null) {
        if (this.head.next) {
          this.head = this.head.next;
        } else {
          this.head = null;
        }
      }
    }

    removeLast(): void {
      if (this.head !== null) {
        if (this.head.next === null) {
          this.head = null;
        } else {
          let current = this.head;

          if (current !== null) {
            while (current.next !== null && current.next.next !== null) {
              current = current.next;
            }

            current.next = null;
          }
        }
      }
    }

    getFirst(): T | never {
      if (this.head === null) {
        throw new Error("List is empty");
      }

      return this.head.value;
    }

    getLast(): T | never {
      if (this.head === null) {
        throw new Error("List is empty");
      }

      let current = this.head;

      while(current.next !== null) {
          current = current.next;
      }

      return current.value;
    }

    display(): void {
      let current = this.head;

      while (current) {
        console.log(`[${current.value}]->`);

        current = current.next;
      }
    }
  }

  // Number linkedlist
  const ll = new LinkedList<number>();

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

  try {
    console.log(`First Item: ${ll.getFirst()}`);
    console.log(`Last Item: ${ll.getLast()}`);
  } catch (e) {
    console.error("List is empty");
  }

  // String Linkedlist
  const ll2 = new LinkedList<string>();

  ll2.addLast("Cat");
  ll2.addLast("Dog");
  ll2.addFirst("Bat");
  ll2.addFirst("Ant");

  ll2.removeFirst();
  ll2.removeLast();

  ll2.display();

  try {
    console.log(`First Item: ${ll2.getFirst()}`);
    console.log(`Last Item: ${ll2.getLast()}`);
  } catch (e) {
    console.error("List is empty");
  }