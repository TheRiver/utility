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

;;;-----------------------------------------------------------------------