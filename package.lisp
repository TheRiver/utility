(defpackage utility
  (:nicknames ut)
  (:use common-lisp)
  (:export #:curry
	   #:curry2
	   #:curry-rest
	   #:once-only
	   #:with-gensyms
	   ;; Compose
	   #:compose
	   #:compose-n
	   ;; Lists
	   #:take
	   #:drop
	   ;; Objects
	   #:with-stored-accessors
	   ;; Files
	   #:temporary-filename)
  (:documentation "A package of various helper functions and macros."))
  