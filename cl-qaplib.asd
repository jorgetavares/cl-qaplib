(defpackage #:cl-qaplib-system 
  (:use #:cl #:asdf))  
 
(in-package #:cl-qaplib-system)  
 
(defsystem :cl-qaplib
  :description "cl-qaplib: parsers and utilities for QAP problem from QAPLIB."
  :version "0.1"  
  :author "Jorge Tavares <jorge.tavares@ieee.org>"  
  :licence "MIT"  
  :serial t
  :components ((:file "package")  
               (:file "qaplib")))
	  
