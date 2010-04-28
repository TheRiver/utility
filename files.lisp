(in-package #:utility)

;;;-------------------------------------------------------------------------
;;; Various utilities for handling files.
;;;-------------------------------------------------------------------------

(declaim (ftype (function (pathname) pathname) temporary-filename))
(defun temporary-filename (default-pathname)
  "Produces names for temporary files. Give a pathname to either a
  directory, or to a file, and this will return a unique file-name."
  (declare (type pathname default-pathname))
  (loop
     for i = 0 then (1+ i)
     for name = default-pathname then (make-pathname :defaults default-pathname
						     :name (format nil "~a-~d"
								   (pathname-name default-pathname)
								   i))
     while (probe-file name)
     finally (return name)))
  
	   

;;;-------------------------------------------------------------------------