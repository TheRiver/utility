(defpackage utility
  (:nicknames ut)
  (:use common-lisp)
  (:export #:curry
	   #:curry2
	   #:curry-rest
	   #:compose
	   #:once-only
	   #:with-gensyms
	   ;; Files
	   #:temporary-filename)
  (:documentation "A package of various helper functions and macros."))
  