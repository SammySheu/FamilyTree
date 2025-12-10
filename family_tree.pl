% ============================================================================
% PART 1: BASIC FACTS - Gender Definitions
% ============================================================================

% Male family members
male(john).
male(david).
male(michael).
male(robert).
male(james).
male(william).
male(thomas).
male(daniel).
male(christopher).

% Female family members
female(mary).
female(susan).
female(linda).
female(patricia).
female(jennifer).
female(elizabeth).
female(sarah).
female(emily).
female(jessica).

% ============================================================================
% PART 2: BASIC FACTS - Parent Relationships
% ============================================================================
% Format: parent(Parent, Child)
% This represents the fundamental relationship from which all others derive

% Generation 1 -> Generation 2
parent(john, david).
parent(john, susan).
parent(john, michael).
parent(mary, david).
parent(mary, susan).
parent(mary, michael).

parent(robert, linda).
parent(robert, james).
parent(patricia, linda).
parent(patricia, james).

% Generation 2 -> Generation 3
parent(david, william).
parent(david, jennifer).
parent(linda, william).
parent(linda, jennifer).

parent(susan, thomas).
parent(susan, elizabeth).
parent(michael, daniel).
parent(michael, sarah).

parent(james, emily).
parent(james, christopher).
parent(jennifer, jessica).

% ============================================================================
% PART 3: DERIVED RELATIONSHIPS - Basic Rules
% ============================================================================

% Father: A father is a male parent
father(Father, Child) :-
    parent(Father, Child),
    male(Father).

% Mother: A mother is a female parent
mother(Mother, Child) :-
    parent(Mother, Child),
    female(Mother).

% Child: X is a child of Y if Y is a parent of X
child(Child, Parent) :-
    parent(Parent, Child).

% Son: A son is a male child
son(Son, Parent) :-
    child(Son, Parent),
    male(Son).

% Daughter: A daughter is a female child
daughter(Daughter, Parent) :-
    child(Daughter, Parent),
    female(Daughter).

% ============================================================================
% PART 4: GRANDPARENT RELATIONSHIPS (Using Recursion)
% ============================================================================

% Grandparent: X is a grandparent of Y if X is a parent of someone who is a parent of Y
% This demonstrates recursion through the intermediate parent relationship
grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

% Grandfather: A grandfather is a male grandparent
grandfather(Grandfather, Grandchild) :-
    grandparent(Grandfather, Grandchild),
    male(Grandfather).

% Grandmother: A grandmother is a female grandparent
grandmother(Grandmother, Grandchild) :-
    grandparent(Grandmother, Grandchild),
    female(Grandmother).

% Grandchild: X is a grandchild of Y if Y is a grandparent of X
grandchild(Grandchild, Grandparent) :-
    grandparent(Grandparent, Grandchild).

% ============================================================================
% PART 5: SIBLING RELATIONSHIPS
% ============================================================================

% Sibling: X and Y are siblings if they share the same parent and are different people
% The \= ensures that a person is not considered their own sibling
sibling(X, Y) :-
    parent(Parent, X),
    parent(Parent, Y),
    X \= Y.

% Full sibling: X and Y are full siblings if they share both parents
full_sibling(X, Y) :-
    father(Father, X),
    father(Father, Y),
    mother(Mother, X),
    mother(Mother, Y),
    X \= Y.

% Brother: A brother is a male sibling
brother(Brother, Person) :-
    sibling(Brother, Person),
    male(Brother).

% Sister: A sister is a female sibling
sister(Sister, Person) :-
    sibling(Sister, Person),
    female(Sister).

% ============================================================================
% PART 6: COUSIN RELATIONSHIPS
% ============================================================================

% Cousin: X and Y are cousins if their parents are siblings
% This implements the rule: cousins have parents who are siblings
cousin(X, Y) :-
    parent(ParentX, X),
    parent(ParentY, Y),
    sibling(ParentX, ParentY),
    X \= Y.

% First cousin: Same as cousin (for clarity)
first_cousin(X, Y) :-
    cousin(X, Y).

% ============================================================================
% PART 7: AUNT AND UNCLE RELATIONSHIPS
% ============================================================================

% Aunt: An aunt is a female sibling of a parent
aunt(Aunt, NieceNephew) :-
    parent(Parent, NieceNephew),
    sibling(Aunt, Parent),
    female(Aunt).

% Uncle: An uncle is a male sibling of a parent
uncle(Uncle, NieceNephew) :-
    parent(Parent, NieceNephew),
    sibling(Uncle, Parent),
    male(Uncle).

% ============================================================================
% PART 8: RECURSIVE RELATIONSHIPS - Ancestor and Descendant
% ============================================================================

% Ancestor: X is an ancestor of Y if X is a parent of Y (base case)
% or if X is a parent of some Z who is an ancestor of Y (recursive case)
ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% Descendant: Y is a descendant of X if X is an ancestor of Y
descendant(Y, X) :-
    ancestor(X, Y).

% ============================================================================
% PART 9: UTILITY PREDICATES FOR QUERIES
% ============================================================================

% Get all children of a person
children(Parent, Child) :-
    parent(Parent, Child).

% Count children (returns list of all children)
all_children(Parent, Children) :-
    findall(Child, parent(Parent, Child), Children).

% Get all siblings of a person
all_siblings(Person, Siblings) :-
    findall(Sibling, sibling(Person, Sibling), SiblingsList),
    list_to_set(SiblingsList, Siblings).

% Get all cousins of a person
all_cousins(Person, Cousins) :-
    findall(Cousin, cousin(Person, Cousin), CousinsList),
    list_to_set(CousinsList, Cousins).

% Get all descendants of a person
all_descendants(Person, Descendants) :-
    findall(Descendant, descendant(Descendant, Person), DescendantsList),
    list_to_set(DescendantsList, Descendants).

% Get all ancestors of a person
all_ancestors(Person, Ancestors) :-
    findall(Ancestor, ancestor(Ancestor, Person), AncestorsList),
    list_to_set(AncestorsList, Ancestors).

% ============================================================================
% END OF FAMILY TREE PROGRAM
% ============================================================================

