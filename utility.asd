;;; -*- Mode: Lisp; -*-

(defpackage #:utility-asdf
  (:use :common-lisp :asdf))

(in-package #:utility-asdf)

(defsystem :utility
    :description "Various utility functions for my use."
    :version "1"
    :author "Rudy Neeser <rudy.neeser@gmail.com>"
    :license "GPLv3 + Classpath exception"
    :serial t
    :components ((:file "package")
		 (:file "curry")))
		 