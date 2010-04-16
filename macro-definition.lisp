(in-package #:utility)

;;;-------------------------------------------------------------------
;;; Various Macros useful for defining other macros.
;;;-------------------------------------------------------------------

;;; once-only taken from practical common lisp.
(defmacro once-only ((&rest names) &body body)
  (let ((gensyms (loop for n in names collect (gensym))))
    `(let (,@(loop for g in gensyms collect `(,g (gensym))))
       `(let (,,@(loop for g in gensyms for n in names collect ``(,,g ,,n)))
	  ,(let (,@(loop for n in names for g in gensyms collect `(,n ,g)))
		,@body)))))


;;;-------------------------------------------------------------------

(defmacro with-gensyms ((&rest variable-names) &body body)
  `(let ,(mapcar #'(lambda (name)
		     (list name '(gensym)))
		 variable-names)
     ,@body))

;;;-------------------------------------------------------------------