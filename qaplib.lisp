;;;;
;;;; cl-qaplib
;;;;

(in-package :cl-qaplib)

;;;
;;; protocol and definitions for parsing 
;;; and handling a single instance
;;;

(defgeneric size (instance)
  (:documentation "Number of objects."))

;; both terms are supplied for matrix A
(defgeneric facilities (instance)
  (:documentation "Facilities/distances (matrix A)."))

(defgeneric distances (instance)
  (:documentation "Facilities/distances (matrix A)."))

;; both terms are supplied for matrix B
(defgeneric locations (instance)
  (:documentation "Locations/flows (matrix B)."))

(defgeneric flows (instance)
  (:documentation "Locations/flows (matrix B)."))

;; matrices accessors
(defgeneric ref-facilities (instance i j)
  (:documentation "Return element i,j from matrix A."))

(defgeneric ref-locations (instance i j)
  (:documentation "Return element i,j from matrix B."))

(defgeneric ref-distances (instance i j)
  (:documentation "Return element i,j from matrix A."))

(defgeneric ref-flows (instance i j)
  (:documentation "Return element i,j from matrix B."))


;; classes 

(defclass qap ()
  ((size     :initarg :size     :reader size)
   (matrix-a :initarg :matrix-a :reader matrix-a)
   (matrix-b :initarg :matrix-b :reader matrix-b)))


;; methods

(defmethod facilities ((instance qap))
  (matrix-a instance))

(defmethod distances ((instance qap))
  (matrix-a instance))

(defmethod locations ((instance qap))
  (matrix-b instance))

(defmethod flows ((instance qap))
  (matrix-b instance))

(defmethod ref-facilities ((instance qap) i j)
  (aref (matrix-a instance) i j))

(defmethod ref-locations ((instance qap) i j)
  (aref (matrix-b instance) i j))

(defmethod ref-distances ((instance qap) i j)
  (aref (matrix-a instance) i j))

(defmethod ref-flows ((instance qap) i j)
  (aref (matrix-b instance) i j))

(defmethod print-object ((instance qap) stream)
   (print-unreadable-object (instance stream :type t)
    (with-slots (size matrix-a matrix-b) instance
      (format stream "~a~%~a~%~a" size matrix-a matrix-b)))) 
  

;; functions

(defun make-qap (size matrix-a matrix-b)
  (make-instance 'qap :size size :matrix-a matrix-a :matrix-b matrix-b))

(defun parse-instance (filename)
  (with-open-file (input filename :direction :input)
    (let* ((size (read input))
	   (matrix-a (make-array `(,size ,size)))
	   (matrix-b (make-array `(,size ,size))))
      (macrolet ((read-matrix (matrix)		  
		    `(loop for i below size
			do (loop for j below size
			      do (setf (aref ,matrix i j) (read input))))))
	(read-matrix matrix-a)
	(read-matrix matrix-b)
	(make-qap size matrix-a matrix-b)))))
