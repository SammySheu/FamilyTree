# Family Tree Program in Prolog

A Prolog program demonstrating logical inference and recursive queries through family relationships.


## 🔍 Overview

This project implements a Family Tree Program in Prolog that models relationships between family members using facts and rules. It demonstrates logical inference, pattern matching, and recursive queries to determine various familial relationships.

## ✨ Features

- **Basic Relationships**: Parent, father, mother, child, son, daughter
- **Grandparent Relationships**: Grandparent, grandfather, grandmother (with recursion)
- **Sibling Relationships**: Sibling, full sibling, brother, sister
- **Extended Family**: Cousin, aunt, uncle
- **Recursive Relationships**: Ancestor and descendant queries
- **Utility Predicates**: Helper functions to get all relatives of a specific type

## 🛠️ Installation


1. **Install SWI-Prolog**:
   
   - **macOS**: 
     ```bash
     brew install swi-prolog
     ```
   
   - **Ubuntu/Debian**:
     ```bash
     sudo apt-get install swi-prolog
     ```
   
   - **Windows**: 
     Download from [https://www.swi-prolog.org/download/stable](https://www.swi-prolog.org/download/stable)

2. **Verify Installation**:
   ```bash
   swipl --version
   ```


## 🚀 Usage

### Starting SWI-Prolog

1. Open terminal in the project directory
2. Start SWI-Prolog:
   ```bash
   swipl
   ```

3. Load the family tree program:
   ```prolog
   ?- [family_tree].
   ```

### Running Queries

After loading the program, you can run queries at the `?-` prompt:

```prolog
% Find all children of john
?- parent(john, X).

% Check if david and susan are siblings
?- sibling(david, susan).

% Find all grandchildren of mary
?- grandchild(X, mary).

% Get all descendants of john
?- all_descendants(john, Descendants).
```

### Navigating Results

- **See next result**: Press `;` (semicolon)
- **Stop searching**: Press `.` (period) or Enter
- **Exit SWI-Prolog**: Type `halt.`

## 📝 Sample Queries

I put examples at [sample_queries.txt](sample_queries.txt)

## Notes

- Some queries may return duplicate results due to multiple matching paths
- Use findall/3 with list_to_set/2 to get unique results
- The \= operator ensures a person is not matched with themselves
- Recursive queries may take longer for large family trees
- The order of results depends on the order of facts in the database