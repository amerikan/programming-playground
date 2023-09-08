(* ocaml MyLinkedList.ml *)

(* Ocaml is functioal, imperative, and object oriented, can use the paradignm
   best fit for job *)

(* types can be inferred, but sometimes must be explicit *)

(* ===================================================================== *)
(* ===================================================================== *)
(* OOP impelementation *)
class node (value: int) =
    (* can declare self. self refers to itself (this in some languages), though could be named anything i.e. s
   that way we can call other methods within other methods using s#methodname format *)
    object (self)
        (* must declare as "mutable" if values can get updated,
           could have used "ref" type instead to accomplish the same along with
           dereference operators ! and := *)
        val mutable next = (None : node option)
        val mutable value = (value: int)
        (* setting up some custom setters/getters *)
        method getValue : int = value
        method getNext : node option = next
        method setNext (newNext: node option) : unit = next <- newNext
    end

class linked_list =
    object (self)
        val mutable head = (None : node option)
        method addLast (vle: int) =
            let newNode = new node vle in
                match head with
                    | None ->
                        head <- Some newNode
                    | Some hn ->
                        (* functions that can be recursive must be marked with rec *)
                        let rec goNext (current: node) =
                            let nextNode = current#getNext in
                                match nextNode with
                                    | None ->
                                        current#setNext (Some newNode)
                                    | Some m ->
                                        goNext m
                        in
                            goNext hn
        method addFirst (vle: int) : unit =
            let newNode = new node vle in
                match head with
                    | None ->
                        head <- Some newNode
                    | Some hn ->
                        newNode#setNext (Some hn);
                        head <- Some newNode
        method removeFirst : unit =
            match head with
                | None -> ()
                | Some h ->
                    head <- h#getNext
        method removeLast : unit =
            match head with
                | None -> ()
                | Some hn ->
                    let rec goNextNext (current: node) =
                        let nextNode = current#getNext in
                            match nextNode with
                                | None ->
                                    head <- None
                                | Some nn ->
                                    let nextNextNode = nn#getNext in
                                        match nextNextNode with
                                            | None ->
                                                current#setNext None
                                            | Some _ ->
                                                goNextNext nn
                    in
                        goNextNext hn
        method getFirst : int option =
            match head with
                | None -> None
                | Some h -> Some h#getValue
        method getLast : int option =
            match head with
                | None -> None
                | Some h ->
                    let rec goNext (current: node) =
                        let nextNode = current#getNext in
                            match nextNode with
                                | None ->
                                    Some current#getValue
                                | Some m ->
                                    goNext m
                    in
                        goNext h
        method display : unit =
            match head with
                | None -> () (* unit value constant, a not useful value to dispose *)
                | Some n ->
                    let rec goNext (current: node) =
                        let nextNode = current#getNext in
                            match nextNode with
                                | None ->
                                    Printf.printf "[%d]->\n" current#getValue;
                                | Some nn ->
                                    Printf.printf "[%d]->" current#getValue;
                                    goNext nn
                    in
                        goNext n
    end

let () = Printf.printf "Object Oriented way\n"

let ll = new linked_list;;

(* TODO: make polymorphic data to work with any type using 'a (alpha)  *)
ll#addLast 4;; (* for most part ;; is optional though in some top-level is needed for ambiguous cases*)
ll#addLast 3;;
ll#addLast 2;;
ll#addLast 1;;

ll#addFirst 5;;
ll#addFirst 6;;
ll#addFirst 7;;

ll#removeFirst;;
ll#removeLast;;

ll#display;;

let () =
    match ll#getFirst with
        | None -> Printf.printf "List is empty"
        | Some first ->
            Printf.printf "First Item: %d\n" first;
    match ll#getLast with
        | None -> Printf.printf "List is empty"
        | Some last ->
            Printf.printf "Last Item: %d\n" last

(* ===================================================================== *)
(* ===================================================================== *)
(* Pure functional implementation using record types and helper functions *)
(* I'm prefixing it with "f" to distinguish from oop implementation *)
let () = Printf.printf "\nImperative functional way\n"

type fnode = {
    mutable next: fnode option;
    mutable value: int
}

type flinked_list = {
    mutable head: fnode option;
}

(* factories *)
let create_fnode v = {
    next = None;
    value = v;
}
let create_flinkedlist = {
    head = None;
};;

(* helpers *)
let add_last (linkedlist: flinked_list) (vle: int) =
    let nd = create_fnode vle in
        let head = linkedlist.head in
            match head with
                | None ->
                    linkedlist.head <- Some nd
                | Some hn ->
                    (* functions that can be recursive must be marked with rec *)
                    let rec goNext (current: fnode) =
                        let nextNode = current.next in
                            match nextNode with
                                | None ->
                                    current.next <- Some nd
                                | Some m ->
                                    goNext m
                    in
                        goNext hn
let add_first (linkedlist: flinked_list) (vle: int) : unit =
    let nd = create_fnode vle in
        let head = linkedlist.head in
            match head with
                | None ->
                    linkedlist.head <- Some nd
                | Some hn ->
                    nd.next <- (Some hn);
                    linkedlist.head <- Some nd
let remove_first (linkedlist: flinked_list) : unit =
    let head = linkedlist.head in
        match head with
            | None -> ()
            | Some h ->
                linkedlist.head <- h.next
let remove_last (linkedlist: flinked_list) : unit =
    let head = linkedlist.head in
        match head with
            | None -> ()
            | Some hn ->
                let rec goNextNext (current: fnode) =
                    let nextNode = current.next in
                        match nextNode with
                            | None ->
                                linkedlist.head <- None
                            | Some nn ->
                                let nextNextNode = nn.next in
                                    match nextNextNode with
                                        | None ->
                                            current.next <- None
                                        | Some _ ->
                                            goNextNext nn
                in
                    goNextNext hn
let get_first (linkedlist: flinked_list) : int option =
    let head = linkedlist.head in
        match head with
            | None -> None
            | Some h -> Some h.value
let get_last (linkedlist: flinked_list) : int option =
    let head = linkedlist.head in
        match head with
            | None -> None
            | Some h ->
                let rec goNext (current: fnode) =
                    let nextNode = current.next in
                        match nextNode with
                            | None ->
                                Some current.value
                            | Some m ->
                                goNext m
                in
                    goNext h
let display (linkedlist: flinked_list) =
    let head = linkedlist.head in
        match head with
            | None -> ()
            | Some n ->
                let rec goNext (current: fnode) =
                    let nextNode = current.next in
                        match nextNode with
                            | None ->
                                Printf.printf "[%d]->\n" current.value;
                            | Some nn ->
                                Printf.printf "[%d]->" current.value;
                                goNext nn
                in
                    goNext n

(* driver *)
let fll = create_flinkedlist;;

add_last fll 4;;
add_last fll 3;;
add_last fll 2;;
add_last fll 1;;

add_first fll 5;;
add_first fll 6;;
add_first fll 7;;

remove_first fll;;
remove_last fll;;

display fll;;

let () =
    match get_first fll with
        | None -> Printf.printf "List is empty"
        | Some first ->
            Printf.printf "First Item: %d\n" first;
    match get_last fll with
        | None -> Printf.printf "List is empty"
        | Some last ->
            Printf.printf "Last Item: %d\n" last