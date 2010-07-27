(in-package #:utility)

;;;-------------------------------------------------------------------
;;; Various utilities for handling objects.
;;;-------------------------------------------------------------------

(defmacro with-stored-accessors ((&rest accessor-list) object
				 &body body)
  "Allows you to gain access to the various accessors of an object, as
if this where WITH-ACCESSORS, but all of the accessors listed will
have their values saved before BODY is executed, and restored to their
original values once body is done. This is always done in the order
that the accessors are listed in the ACCESSOR-LIST."
  (once-only (object)
    (with-gensyms (store)
      `(with-accessors (,@accessor-list) ,object
	 (let ((,store ()))
	   ,@(mapcar #'(lambda (item)
			 `(push ,(first item) ,store))
		     accessor-list)
	   (unwind-protect (progn
			     ,@body)
	   ,@(mapcar #'(lambda (item)
			 `(setf ,(first item) (pop ,store)))
		     (reverse accessor-list))))))))