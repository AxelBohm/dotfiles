;; Basic config

; startup screen
(setq inhibit-startup-screen t)

; for graphical emacs
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1) 

; stop creating backup~ files
(setq make-backup-files nil) 
; stop creating #autosave# files
(setq auto-save-default nil) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

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

; ; Update your local package index
; (unless package-archive-contents
;   (package-refresh-contents))

; ; Install all missing packages
; (dolist (package package-list)
;   (unless (package-installed-p package)
;     (package-install package)))


(use-package org-bullets
:ensure t
:init
(setq org-bullets-bullet-list
'("◉" "◎" "<img draggable="false" class="emoji" alt="⚫" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/26ab.svg">" "○" "►" "◇"))
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package evil)
  (evil-mode 1)


(use-package evil-leader)
  (global-evil-leader-mode)
  (evil-leader/set-leader " ")
  (evil-leader/set-key
    "b" 'switch-to-buffer
    "w" 'save-buffer)
