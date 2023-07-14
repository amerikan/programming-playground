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

  addToFront(val) {
    const node = new Node(val);
    node.next = this.head;

    this.head = node;
  }

  addToBack(val) {
    let current = this.head;

    while (current.next !== null) {
      current = current.next;
    }

    current.next = new Node(val);
  }

  addAfter(needle, val) {
    let current = this.head;

    while (current) {
      if (current.value === needle) {
        const newNode = new Node(val);
        newNode.next = current.next;

        current.next = newNode;

        return;
      }

      current = current.next;
    }
  }

  removeFront() {
    const head = this.head;

    if (head) {
      if (head.next) {
        this.head = head.next;
      } else {
        this.head = null;
      }
    }
  }

  removeBack() {
    let current = this.head;

    if (current !== null) {
      while (current.next !== null && current.next.next !== null) {
        current = current.next;
      }

      current.next = null;
    }
  }

  remove(needle) {
    let previous = null;
    let current = this.head;

    while (current) {
      if (current.value === needle) {
        if (previous === null) {
          this.head = current.next;
        } else {
          if (current.next) {
            previous.next = current.next;
          } else {
            previous.next = null;
          }
        }

        break;
      }

      previous = current;
      current = current.next;
    }
  }

  search(needle) {
    let current = this.head;

    while (current) {
      if (current.value === needle) {
        return true;
      }

      current = current.next;
    }

    return false;
  }

  update(needle, newVal) {
    let current = this.head;

    while (current) {
      if (current.value === needle) {
        current.value = newVal;

        break;
      }

      current = current.next;
    }
  }

  traverse() {
    let current = this.head;

    while (current) {
      console.log(current.value);

      current = current.next;
    }
  }
}

// Driver
const ll = new LinkedList();

ll.addToFront("fox");
ll.addToFront("elephant");
ll.addToFront("dog");
ll.addToFront("cat");
ll.addToFront("camel");
ll.addToFront("bear");
ll.addToFront("alligator");
ll.addToFront("aardvark");

ll.addToBack("hippo");
ll.addToBack("ibis");
ll.addToBack("iguana");

ll.update("alligator", "alpaca");

ll.removeFront();

ll.removeBack();

ll.remove("camel");

ll.addAfter("fox", "giraffe");

ll.traverse();

console.log(ll.search("dog"));
console.log(ll.search("turkey"));


const ll2 = new LinkedList();
ll2.addToFront("apple");
ll2.addToFront("pear");
ll2.addToFront("banana");
ll2.remove("pear")
ll2.traverse();