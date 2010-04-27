(in-package #:utility)

;;;---------------------------------------------------
;;; Various utilities related to lists.
;;;---------------------------------------------------
;;; Type declaration

(declaim (ftype (function (fixnum list) list) take drop))

;;;---------------------------------------------------

(defun take (amount list)
  "Returns the first AMOUNT of elements from LIST"
  (declare (type fixnum amount)
	   (type list list)
	   (optimize (speed 3)))
  (check-type amount (integer 0 *) "a none-negative integer")
  (when (and (plusp amount) (not (null list)))
    (cons (first list) (take (1- amount) (rest list)))))

(defun drop (amount list)
  "Returns the LIST minus the given AMOUNT of items from the front."
  (declare (type fixnum amount)
	   (type list list)
	   (optimize (speed 3)))
  (check-type amount (integer 0 *) "a none-negative integer")
  (cond
    ((or (zerop amount) (null list))
     list)
    (t
     (drop (1- amount) (rest list)))))