(in-package #:utility)


;;;-----------------------------------------------------------------------
;;; A simple function that returns a curried version of another function.
;;;-----------------------------------------------------------------------

(declaim (ftype (function (function &rest t) (function (&rest t))) curry))
(defun curry (function &rest arguments)
  "CURRY returns a function that, when called with N arguments, will
  call CURRY's original FUNCTION argument, followed by CURRY's
  remaining ARGUMENTS, and then the N arguments."
  (declare (optimize (speed 3)))
  #'(lambda (&rest args)
      (apply function (append arguments args))))


(declaim (ftype (function (function t) function) curry2))
(defun curry2 (function 2nd-arg)
  "CURRY accepts a function that takes to arguments, and a
  2nd-argument to that function. It returns a function that takes one
  argument."
  (declare (optimize (speed 3)))
  #'(lambda (1st-arg)
      (funcall function 1st-arg 2nd-arg)))

(declaim (ftype (function (function &rest t) function) curry-rest))
(defun curry-rest (function &rest rest-args)
  "CURRY-REST accepts a list of arguments which will be applied to the
  given function as its REST arguments. The returned partial function
  will still allow its initial arguments to be given."
  (declare (optimize (speed 3)))
  #'(lambda (&rest arguments)
      (apply function (append arguments rest-args))))

;;;-----------------------------------------------------------------------