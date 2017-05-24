# cl-qaplib
This is a simple parser and container for QAPLIB dataset files.

# Install
1. if you have Quicklisp installed just extract the contents of cl-qaplib to
a source directory of your liking and recognized by Quicklisp. After that just
do (ql:quickload "cl-qaplib") and it's ready to be used.

2. Otherwise just use ASDF directly: (asdf:oos 'asdf:load-op :cl-qaplib)

3. This library does not depend on any other library and is written in pure CL.

# Quick Usage
From the REPL just call (cl-qaplib:parse-instance <instance-file>) to parse 
a single file. It returns an object containing the instance size, the 
matrices facilities/distances and locations/flows (matrices A and B). To access 
these two matrices, four accessors are provided: facilities and distances for 
matrix A, and locations and flows for matrix B. Aditional methods are also 
provided to make access easier to individual elements in the matrices, e.g., 
ref-distances.

For more details on the problem instances, please consult 
the [QAPLIB website](http://www.seas.upenn.edu/qaplib/)

# License
This project is licensed under the MIT license, see the LICENSE file for more details.
