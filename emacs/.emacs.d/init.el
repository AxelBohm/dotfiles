;; Basic config


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; otherwise emacs will ask on startup
(setq vc-follow-symlinks t)

;; load actual config file
(org-babel-load-file "~/.emacs.d/configuration.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-tags-column 0)
 '(package-selected-packages
   (quote
    (doom-modeline evil-magit magit counsel flycheck outshine volatile-highlights tex-site evil-matchit company-reftex elpy latex-pretty-symbols projectile dashboard page-break-lines auctex-latexmk which-key smartparens-config yasnippet use-package smartparens pretty-mode org-bullets nord-theme evil-leader evil-commentary company auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 1.9))))
 '(org-level-2 ((t (:inherit outline-2 :foreground "#A3BE8C" :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :foreground "#81A1C1" :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :foreground "#8FBCBB" :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
