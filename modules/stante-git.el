;;; stante-git.el --- Stante Pede Modules: Git support
;;; -*- coding: utf-8; lexical-binding: t -*-
;;
;; Copyright (c) 2012 Sebastian Wiesner
;;
;; Author: Sebastian Wiesner <lunaryorn@gmail.com>
;; URL: https://gihub.com/lunaryorn/stantepede.git
;; Version: 1.0.0
;; Keywords: convenience vc tools

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

;; Add support for the version control system Git (see http://git-scm.com/).

;; Git frontend
;; ------------
;;
;; Provide the great Magit frontend (see https://github.com/magit/magit).

;; Please read the manual at http://magit.github.com/magit/magit.html for more
;; information and bookmark the cheatsheet at
;; http://daemianmack.com/magit-cheatsheet.html.

;; Github support
;; --------------
;;
;; Provide Github support in Magit and add support for creating Gists.
;;
;; Github support for Magit is provided by magithub from
;; https://github.com/nex3/magithub).

;; Keybindings
;; -----------
;;
;; C-x g brings up the Magit status window.
;;
;; C-x G l lists your Gists.  Navigate with arrow keys and press return to open
;; a Gist in a new buffer.
;;
;; C-x G c creates a new Gist from the current region, or from the whole buffer
;; if no mark is set.  With prefix argument, create a private Gist.  The newly
;; created Gist is opened in the default browser (see `gist-view-gist').

;;; Code:

(require 'stante-lib-autoloads)

(package-install-if-needed 'magit)
(package-install-if-needed 'magithub)
(package-install-if-needed 'gist)

;; Open newly created Gists in browser.
(eval-after-load 'gist
  #'(setq gist-view-gist t))

;; Keybindings
(global-set-key (kbd "C-x g") 'magit-status)

(define-prefix-command 'gist-map)
(define-key gist-map (kbd "c") 'gist-region-or-buffer)
(define-key gist-map (kbd "l") 'gist-list)
(global-set-key (kbd "C-x G") 'gist-map)

(provide 'stante-git)

;;; stante-git.el ends here