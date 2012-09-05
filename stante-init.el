;;; stante-init.el --- Stante Pede entry point
;;; -*- coding: utf-8; lexical-binding: t -*-
;;
;; Copyright (c) 2012 Sebastian Wiesner
;;
;; Author: Sebastian Wiesner <lunaryorn@gmail.com>
;; URL: https://gihub.com/lunaryorn/stantepede.git
;; Version: 1.0.0
;; Keywords: convenience

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

;; Perform initial Stante Pede setup.

;; Stante Pede paths
;; -----------------
;;
;; Set some variables to provide standard paths to modules and users:
;;
;; `stante-dir' contains the path of the Stante Pede root directory, typically
;; "~/.emacs.d/".
;;
;; `stante-modules-dir' contains the path of the directory containing the
;; modules.  This directory is added to `load-path' so that modules can be
;; loaded directly with `require'.
;;
;; `stante-var-dir' points to a directory, where modules can store variable data
;; files, like autosave files, recent file lists or whatever.

;; All of theses paths end with a slash to allow for concatenation (see
;; `concat') with relative file names.

;; Package support
;; ---------------

;; Enable support for packages and add the MELPA archive. See
;; http://melpa.milkbox.net/packages.

;; Custom file
;; -----------
;;
;; Move customize settings to `stante-dir'/custom.el to keep "init.el" free
;; of noise (see `custom-file').  Also load this file, if present.


;;; Code:

;; Stante directories
(defconst stante-dir (expand-file-name "~/.emacs.d/")
  "The root directory of Stante Pede")
(defconst stante-modules-dir (concat stante-dir "modules/")
  "The directory containing all Stante Pede modules")
(defconst stante-var-dir (concat stante-dir "var/")
  "This folder stores auomatically generated files.")

;; Stante files
(defconst stante-custom-file (concat stante-dir "custom.el")
  "The location of the `custom-file' for Stante Pede.")
(defconst stante-autoload-file (concat stante-modules-dir "stante-autoloads.el")
  "The location of the file containing the autoload definition of
  Stante Pede functions.")

(add-to-list 'load-path stante-modules-dir)

;; Create cache directory
(unless (file-exists-p stante-var-dir)
  (make-directory stante-var-dir))

;; Move settings from customize UI out of place.
(eval-after-load 'cus-edit
  '(setq custom-file stante-custom-file))
(when (file-exists-p stante-custom-file)
  (load stante-custom-file))

;; Enable packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Bring autoload definitions into scope
(when (file-exists-p stante-autoload-file)
  (load stante-autoload-file))

;;; stante-init.el ends here
