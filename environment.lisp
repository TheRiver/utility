(in-package #:ut)

;;;--------------------------------------------------------
;;; Various utilities for managing environment variables.
;;;--------------------------------------------------------

(defun get-environment-variable (name &optional default)
  "Returns the given environment variable."
  (declare (type string name))
  (let ((value (sb-ext:posix-getenv name)))
    (if value
	value
	default)))

;;;--------------------------------------------------------

(defun xdg-data-home ()
  (cond
    ((get-environment-variable "XDG_DATA_HOME")
     (make-pathname :directory (get-environment-variable "XDG_DATA_HOME")))
    (t
     (merge-pathnames ".local/share/" (user-homedir-pathname)))))

(defun xdg-config-home ()
  (cond
    ((get-environment-variable "XDG_CONFIG_HOME")
     (make-pathname :directory (get-environment-variable "XDG_CONFIG_HOME")))
    (t
     (merge-pathnames ".config/" (user-homedir-pathname)))))

(defun xdg-cache-home ()
  (cond
    ((get-environment-variable "XDG_CACHE_HOME")
     (make-pathname :directory (get-environment-variable "XDG_CACHE_HOME")))
    (t
     (merge-pathnames ".cache/" (user-homedir-pathname)))))


;;;--------------------------------------------------------