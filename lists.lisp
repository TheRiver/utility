;;; utility: a simple library of utility functions
;;; Copyright (C) 2010-2012 Rudy Neeser
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;
;;; Additional permission under GNU GPL version 3 section 7
;;; 
;;; Linking this library statically or dynamically with other modules is
;;; making a combined work based on this library. Thus, the terms and
;;; conditions of the GNU General Public License cover the whole
;;; combination.
;;; 
;;; As a special exception, the copyright holders of this library give you
;;; permission to link this library with independent modules to produce an
;;; executable, regardless of the license terms of these independent
;;; modules, and to copy and distribute the resulting executable under
;;; terms of your choice, provided that you also meet, for each linked
;;; independent module, the terms and conditions of the license of that
;;; module. An independent module is a module which is not derived from or
;;; based on this library. If you modify this library, you may extend this
;;; exception to your version of the library, but you are not obligated to
;;; do so. If you do not wish to do so, delete this exception statement
;;; from your version.

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