;; Basic config

; startup screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message "") ;; Uh, I know what Scratch is for

; for graphical emacs
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode 0)

; Matches parentheses and such in every mode
(show-paren-mode 1)

; stop creating backup~ files
(setq make-backup-files nil)
; stop creating #autosave# files
(setq auto-save-default nil)

; strip trailing whitespace when saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; tabs vs spaces
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

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

; ; Update your local package index
; (unless package-archive-contents
;   (package-refresh-contents))

; ; Install all missing packages
; (dolist (package package-list)
;   (unless (package-installed-p package)
;     (package-install package)))

(use-package nord-theme
  :ensure t)
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(load-theme 'nord t)

(require 'org)

(use-package org-bullets
:ensure t
:init
(setq org-bullets-bullet-list
'("◉" "◎" "<img draggable="false" class="emoji" alt="⚫" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/26ab.svg">" "○" "►" "◇"))
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


; (use-package pdf-tools
;   ; :ensure t
;   :pin manual ;; manually update
;  :config
;  ;; initialise
;  (pdf-tools-install)
;  ;; open pdfs scaled to fit page
;  (setq-default pdf-view-display-size 'fit-page)
;  ;; automatically annotate highlights
;  (setq pdf-annot-activate-created-annotations t)
;  ;; use normal isearch
;  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))



(use-package evil
  :ensure t)
(evil-mode 1)


(use-package evil-leader
  :ensure t)
  (global-evil-leader-mode)
  (evil-leader/set-leader " ")
  (evil-leader/set-key
    "b" 'switch-to-buffer
    "w" 'save-buffer)

(use-package pretty-mode
  :ensure t)
  (global-pretty-mode t)
  (pretty-activate-groups
   '(:sub-and-superscripts :greek :arithmetic-nary))


; auto closing of parenthesis
(use-package smartparens
    :ensure t)

; gc comments stuff out
(use-package evil-commentary
  :ensure t)
(evil-commentary-mode)

;; latex
(use-package tex-site
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (company-mode)
              (smartparens-mode)
              (turn-on-reftex)
              (setq reftex-plug-into-AUCTeX t)
              (reftex-isearch-minor-mode)
              (setq TeX-PDF-mode t)
              (setq TeX-source-correlate-method 'synctex)
              (setq TeX-source-correlate-start-server t)))

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
            #'TeX-revert-document-buffer)

;; to use pdfview with auctex
(setq TeX-view-program-selection '((output-pdf "Zathura"))
       TeX-source-correlate-start-server t)
(setq TeX-view-program-list '(("Zathura" "TeX-pdf-tools-sync-view"))))

(add-hook 'TeX-mode-hook 'prettify-symbols-mode)






(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t))


;; auto completion
(use-package company
  :ensure t
  :init
  (setq company-dabbrev-ignore-case t
        company-show-numbers t)
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  :bind ("C-:" . company-complete)  ; In case I don't want to wait
  :diminish company-mode)


;; snippets
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))
  ; :config
  ; (add-to-list 'yas-snippet-dirs (ha/emacs-subdirectory "snippets")))


;; spell checking
(use-package flyspell
  :ensure t
  :diminish flyspell-mode
  :init
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)

  (dolist (hook '(text-mode-hook org-mode-hook))
    (add-hook hook (lambda () (flyspell-mode 1))))

  (dolist (hook '(change-log-mode-hook log-edit-mode-hook org-agenda-mode-hook))
    (add-hook hook (lambda () (flyspell-mode -1))))

  :config
  (setq ispell-program-name "/usr/local/bin/aspell"
        ispell-local-dictionary "en_US"
        ispell-dictionary "american" ; better for aspell
        ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")
        ispell-list-command "--list"
        ispell-local-dictionary-alist '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "['‘’]"
                                      t ; Many other characters
                                      ("-d" "en_US") nil utf-8))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auctex yasnippet company use-package org-bullets evil-leader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(defun evil-colemak-basics--make-keymap ()
;  "Initialise the keymap baset on the current configuration."
;  (let ((keymap (make-sparse-keymap)))
;    (evil-define-key '(motion normal visual) keymap
;      "n" 'evil-next-line
;      "N" 'evil-join
;      "gn" 'evil-next-visual-line
;      "gN" 'evil-next-visual-line
;      "e" 'evil-previous-line
;      "ge" 'evil-previous-visual-line
;      "E" 'evil-lookup
;      "j" 'evil-forward-word-end
;      "J" 'evil-forward-WORD-end
;      "gj" 'evil-backward-word-end
;      "gJ" 'evil-backward-WORD-end
;      "k" 'evil-search-next
;      "K" 'evil-search-previous
;      "gk" 'evil-next-match
;      "gK" 'evil-previous-match
;      "zi" 'evil-scroll-column-right
;      "zI" 'evil-scroll-right
;      "l" 'evil-insert
;      "L" 'evil-insert-line
;      "i" 'evil-forward-char)))

;(defvar evil-colemak-basics-keymap
;  (evil-colemak-basics--make-keymap)
;  "Keymap for evil-colemak-basics-mode.")

;(defun evil-colemak-basics--refresh-keymap ()
;  "Refresh the keymap using the current configuration."
;  (setq evil-colemak-basics-keymap (evil-colemak-basics--make-keymap)))

;(define-minor-mode evil-colemak-basics-mode
;  "Minor mode with evil-mode enhancements for the Colemak keyboard layout."
;  :keymap evil-colemak-basics-keymap
;  :lighter " hnei")

;;;;###autoload
;(define-globalized-minor-mode global-evil-colemak-basics-mode
;  evil-colemak-basics-mode
;  (lambda () (evil-colemak-basics-mode t))
;  "Global minor mode with evil-mode enhancements for the Colemak keyboard layout.")

;(global-evil-colemak-basics-mode)

; i needs to be unbound first
(define-key evil-normal-state-map "i" nil)

(define-key evil-motion-state-map "n" 'evil-next-line)
(define-key evil-motion-state-map "N" 'evil-join)
(define-key evil-motion-state-map "gn" 'evil-next-visual-line)
(define-key evil-motion-state-map "gN" 'evil-next-visual-line)
(define-key evil-motion-state-map "e" 'evil-previous-line)
(define-key evil-motion-state-map "ge" 'evil-previous-visual-line)
(define-key evil-motion-state-map "E" 'evil-lookup)
(define-key evil-motion-state-map "i" 'evil-forward-char)
(define-key evil-motion-state-map "j" 'evil-forward-word-end)
(define-key evil-motion-state-map "J" 'evil-forward-WORD-end)
(define-key evil-motion-state-map "gj" 'evil-backward-word-end)
(define-key evil-motion-state-map "gJ" 'evil-backward-WORD-end)
(define-key evil-motion-state-map "k" 'evil-search-next)
(define-key evil-motion-state-map "K" 'evil-search-previous)
(define-key evil-motion-state-map "gk" 'evil-next-match)
(define-key evil-motion-state-map "gK" 'evil-previous-match)
(define-key evil-motion-state-map "zi" 'evil-scroll-column-right)
(define-key evil-motion-state-map "zI" 'evil-scroll-right)
(define-key evil-motion-state-map "l" 'evil-insert)
(define-key evil-motion-state-map "L" 'evil-insert-line)

; `i` in visual mode needs extra remap
; (define-key evil-visual-state-map "i" 'evil-next-visual-line)

; (require 'org)         ;; The org-mode goodness
; (require 'init-org-mode)
; (require 'init-python)
