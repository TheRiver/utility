(in-package #:utility)


;;;-----------------------------------------------------------------------
;;; A simple function that returns a curried version of another function.
;;;-----------------------------------------------------------------------

(declaim (ftype (function (function &rest t) (function (&rest t))) curry))
(defun curry (function &rest arguments)
  (declare (optimize (speed 3)))
  (lambda (&rest args)
    (apply function (append arguments args))))