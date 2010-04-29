(in-package #:utility)

;;;-------------------------------------------------------------------
;;; Functions useful for composing other functions together.
;;;-------------------------------------------------------------------

(declaim (ftype (function (function function) function) compose))
(defun compose (outer-function inner-function)
  (declare (optimize (speed 3)))
  "This returns the composition of the two functions,
OUTER-FUNCTION(INNER-FUNCTION(arguments))."
  #'(lambda (&rest arguments)
      (funcall outer-function (apply inner-function arguments))))

(declaim (ftype (function (function &rest function) function) compose-n))
(defun compose-n (function &rest functions)
  "This allows for n different functions to be composed together."
  (declare (type function function)
	   (type list functions))
  (reduce #'compose (cons function functions) :from-end t))

;;;-------------------------------------------------------------------