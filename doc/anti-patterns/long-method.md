# Long Method

Long methods/functions are difficult to reuse and understand because they are usually responsible for more than one thing. Separating those ones to several short ones with proper names helps you to reuse your code and understand it better without reading methods body.

Lines of code with clarification comments usually a sign for possible method extraction because you can name extracted method in a way that will cover comment description and then remove comment. Even comments for one line is a sign for method extraction.

* To shorten a method, just apply **Extract Method** command.
* If local variables and parameters prevent a method extraction, apply **Replace Temp with Query**, **Introduce Parameter Object** or **Preserve Whole Object** commands.
* Conditional statements or loops indicate the possibility of method extraction. Use **Decompose Conditional** command for conditional expressions and **Extract Method** for loops.

***

P.S. We use terminology from a book **Refactoring Improving the Design of Existing Code** by *Martin Fowler*
