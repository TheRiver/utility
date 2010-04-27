(in-package #:utility)

;;;---------------------------------------------------
;;; Various utilities related to lists.
;;;---------------------------------------------------

(declaim (ftype (function (fixnum list) list) take))
(defun take (amount list)
  "Returns the first AMOUNT of elements from LIST"
  (declare (type fixnum amount))
  (check-type amount (integer 0 *) "a positive integer")
  (when (and (plusp amount) (not (null list)))
    (cons (first list) (take (1- amount) (rest list)))))