;;; stante-coffee.el --- Stante Pede Modules: CoffeeScript support -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2012, 2013 Sebastian Wiesner
;;
;; Author: Sebastian Wiesner <lunaryorn@gmail.com>
;; URL: https://gihub.com/lunaryorn/stante-pede.git
;; Keywords: extensions

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation; either version 3 of the License, or (at your option) any later
;; version.

;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
;; details.

;; You should have received a copy of the GNU General Public License along with
;; GNU Emacs; see the file COPYING.  If not, write to the Free Software
;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
;; USA.


;;; Commentary:

;; Provide support for CoffeeScript.
;;
;; CoffeeScript editing is provided by coffee-mode from
;; https://github.com/defunkt/coffee-mode

;;; Code:

(require 'stante-programming)

(after 'coffee-mode
  ;; CoffeeScript should use two spaces for indentation
  (setq coffee-tab-width 2))

(provide 'stante-coffee)

;; Local Variables:
;; coding: utf-8
;; End:

;;; stante-coffee.el ends here
