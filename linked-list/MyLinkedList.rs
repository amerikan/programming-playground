// rustc MyLinkedList.rs && ./MyLinkedList

// Instead of Garbage collection or manual memory allocation,
// Rust uses "borrowing" for memory management

// Box, a "smart pointer" is a built-in way to allocate memory in the heap instead of stack,
//which we need to do here since the Node struct is recursive and the compiler doesn't know
// how big it is to actually use the stack.
struct Node {
    value: u32,
    next: Option<Box<Node>>
}

// btw we can alias a type such as the following to avoid writing it all out
// type Link = Option<Box<Node>>;

// Option (optional) allows to use Some or None
struct LinkedList {
    head: Option<Box<Node>>
}

// Adding "methods" to the type
impl LinkedList {
    fn new() -> Self {
        LinkedList {
            head: None // default value of None
        }
    }

    // convention to use snake case for functions
    fn add_last(self: &mut Self, value: u32) {
        let new_node = Some(Box::new(Node{value, next: None}));

        // we can check optional with match instead of is_some()
        match &self.head {
            Some(_) => {
                let mut current = &mut self.head;

                // way to destructure Optional into a variable i.e. below I used nde
                while let Some(nde) = current {
                    if nde.next.is_none() {
                        nde.next = new_node;
                        break;
                    }

                    current = &mut nde.next;
                }
            },
            None => {
                self.head = new_node;
            }
        }
    }

    // &self is shorthand for self: &Self
    fn add_first(&mut self, value: u32) {
        let mut new_node = Box::new(Node{value, next: None});

        match &self.head {
            Some(_) => {
                // .take() gets the value of the Option and leaves (sets) None in it's place
                new_node.next = self.head.take();
                self.head = Some(new_node);
            },
            None => {
                self.head = Some(new_node);
            }
        }
    }

    fn remove_first(&mut self) {
        if let Some(h) = &self.head {
            if h.next.is_none() {
                self.head = None;
            } else {
                if let Some(mut od) = self.head.take() {
                    self.head = od.next.take();
                }
            }
        }
    }

    // no return type implies void, we could be explicit and do "-> void"
    fn remove_last(&mut self) {
        if let Some(hd) = &mut self.head {
            if hd.next.is_none() {
                self.head = None;
            } else {

                let mut current = &self.head;

                while let Some(nde) = current {

                    println!("{}", nde.value);

                    if nde.next.is_none() {
                        // TODO: remove last item!
                        println!("REMOVE {}", nde.value);
                        break;
                    }

                    current = &nde.next;

                }
            }
        }
    }

    // -> explicit return type
    fn get_first(&self) -> Option<u32> {
        // using is_some() is an alternative way to using something like "match"
        if self.head.is_some() {
            return Some(self.head.as_ref().unwrap().value);
        }

        None // implied return (no semi-colon!)
    }

    fn get_last(&self) -> Option<u32> {
        match self.head {
            Some (_) => {
                let mut current = &self.head;

                while let Some(nde) = current {
                    if nde.next.is_none() {
                        break;
                    }

                    current = &nde.next;
                }

                return Some (current.as_ref().unwrap().value);
            },
            None => None
        }
    }

    fn display(&self) {
        if self.head.is_some() {
            let mut current = &self.head;

            // way to destructure Optional into a variable i.e. below I used n
            while let Some(n) = current {
                print!("[{}]->", n.value);

                current = &n.next;
            }

            println!();
        }
    }
}

fn main() {
    let mut ll = LinkedList::new();

    // TODO: make list generic!

    ll.add_last(4);
    ll.add_last(3);
    ll.add_last(2);
    ll.add_last(1);
    ll.add_first(5);
    ll.add_first(6);
    ll.add_first(7);

    ll.remove_first();
    ll.remove_last();

    ll.display();

    // Match pattern
    match ll.get_first() {
        Some (val) => { // unwrapped value
            println!("First Item: {}", val);
        },
        None => {
            println!("No first item, list is empty!")
        }
    }

    // if else with is_some and manual unwrap()
    if ll.get_last().is_some() {
        println!("Last Item: {}",  ll.get_last().unwrap());
    } else {
        println!("No last item, list is empty!")
    }
}