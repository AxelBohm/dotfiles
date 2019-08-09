;; Basic config


(set-face-background 'region "blue3")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; ; List the packages you want
; (setq package-list '(evil
;                      org-bullets
;                      evil-leader))
; Activate all the packages (in particular autoloads)
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(org-babel-load-file "~/.emacs.d/configuration.org")

