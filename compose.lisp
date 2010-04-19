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

;;;-------------------------------------------------------------------