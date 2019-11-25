(show-paren-mode 1)

(setq display-line-numbers 'relative)

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-to-list 'auto-mode-alist '("/neomutt" . mail-mode))

;; Function to return first name of email recipient
;; Used by yasnippet
(defun ab/yas-get-first-name-from-to-field ()
  (let ((rlt "NAME") str rlt2)
    (save-excursion
      (goto-char (point-min))
      ;; first line in email could be some hidden line containing NO to field
      (setq str (buffer-substring-no-properties (point-min) (point-max))))
    ;; take name from TO field
    (when (string-match "^To: \"?\\([^ ,]+\\)" str)
      (setq rlt (match-string 1 str)))
    ;;get name in FROM field if available
    (when (string-match "^\\([^ ,\n]+\\).+writes:$" str)
      (progn (setq rlt2 (match-string 1 str))
             ;;prefer name in FROM field if TO field has "@"
             (when (string-match "@" rlt)
               (setq rlt rlt2))
             ))
    (message "rlt=%s" rlt)
    rlt))

(defun ab/visit-references ()
  "go to my references file"
  (interactive)
  (find-file "~/org/Reference.org"))

(setq show-week-agenda-p t)

(global-prettify-symbols-mode 1)

(defun ab/visit-emacs-config ()
  "go to emacs config file"
  (interactive)
  (find-file "~/.doom.d/config.org"))

(map! :leader "e c" #'ab/visit-emacs-config)

(defun ab/reload-init-file ()
  "reload config file"
  (interactive)
  (load-file user-init-file))

(map! :leader "e r" #'ab/reload-init-file)

(map! :leader
      "b" #'switch-to-buffer
      "q" #'kill-buffer
      "s h" #'evil-window-split
      "s v" #'evil-window-vsplit
      "e r" #'reload-init-file
      "e c" #'ab/visit-emacs-config
      "r" #'ab/visit-references
      "n" #'other-window
      "w" #'save-buffer)

;; (defun ab/open-shell-in-split ()
;;   (interactive)
;;   (evil-window-split)
;;   (eshell))

;; (map! :leader "s s" 'ab/open-shell-in-split)

(defgroup evil-colemak nil
  "Basic key rebindings for evil-mode with the Colemak keyboard layout."
  :prefix "evil-colemak-"
  :group 'evil)

(defcustom evil-colemak-char-jump-commands nil
  "The set of commands to use for jumping to characters.
        By default, the built-in evil commands evil-find-char (and
        variations) are used"
  :group 'evil-colemak
  :type '(choice (const :tag "default" nil)))

(defun evil-colemak--make-keymap ()
  "Initialise the keymap baset on the current configuration."
  (let ((keymap (make-sparse-keymap)))
    (evil-define-key '(motion normal visual) keymap
      "n" 'evil-next-line
      "gn" 'evil-next-visual-line
      "gN" 'evil-next-visual-line
      "e" 'evil-previous-line
      "ge" 'evil-previous-visual-line
      "E" 'evil-lookup
      "i" 'evil-forward-char
      "j" 'evil-forward-word-end
      "J" 'evil-forward-WORD-end
      "gj" 'evil-backward-word-end
      "gJ" 'evil-backward-WORD-end
      "k" 'evil-search-next
      "K" 'evil-search-previous
      "gk" 'evil-next-match
      "gK" 'evil-previous-match
      "zi" 'evil-scroll-column-right
      "zI" 'evil-scroll-right)
    (evil-define-key '(normal visual) keymap
      "N" 'evil-join
      "gN" 'evil-join-whitespace)
    (evil-define-key 'normal keymap
      "l" 'evil-insert
      "L" 'evil-insert-line)
    (evil-define-key 'visual keymap
      "L" 'evil-insert)
    (evil-define-key '(visual operator) keymap
      "l" evil-inner-text-objects-map)
    (evil-define-key 'operator keymap
      "i" 'evil-forward-char)
    keymap))
;; ~I~ is still available

(defvar evil-colemak-keymap
  (evil-colemak--make-keymap)
  "Keymap for evil-colemak-mode.")

(defun evil-colemak-refresh-keymap ()
  "Refresh the keymap using the current configuration."
  (setq evil-colemak-keymap (evil-colemak--make-keymap)))

      ;;;###autoload
(define-minor-mode evil-colemak-mode
  "Minor mode with evil-mode enhancements for the Colemak keyboard layout."
  :keymap evil-colemak-keymap
  :lighter " hnei")

      ;;;###autoload
(define-globalized-minor-mode global-evil-colemak-mode
  evil-colemak-mode
  (lambda () (evil-colemak-mode t))
  "Global minor mode with evil-mode enhancements for the Colemak keyboard layout.")
(global-evil-colemak-mode)

(with-eval-after-load 'evil-maps
  (define-key evil-window-map "n" 'evil-window-down)
  (define-key evil-window-map "e" 'evil-window-up)
  (define-key evil-window-map "i" 'evil-window-right))

(defun ab/switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(map! :leader "SPC" #'ab/switch-to-previous-buffer)

(after! org
  (setq org-hide-emphasis-markers t
        org-return-follows-link t
        org-tags-column 0             ;; position of tags
        ;; org-tag-faces '(("major" :foreground "#81A1C1"))
        ;; org-tag-faces nil
        org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)")
                            (sequence "TODO(t)" "DIDN'T SUCCEED(s)" "|" "DOESN'T WORK(x)"  "TOO HARD(h)" "DONE(d)")))
  (map! :leader
        "o l" 'org-store-link
        "o a" 'org-agenda
        "o c" 'org-capture))

(after! org
  (setq org-directory "~/org")

  (defun org-file-path (filename)
    "Return the absolute address of an org file, given its relative name."
    (concat (file-name-as-directory org-directory) filename))

  ;; (setq org-inbox-file "~/org/inbox.org")
  (setq org-index-file (org-file-path "index.org"))
  (setq org-archive-location
        (concat (org-file-path "archive.org") "::* From %s")))

(after! org
  (setq org-agenda-files (list org-index-file
                               (org-file-path "Reference.org"))))
;; (setq org-agenda-files (list org-directory))

(after! org (setq org-startup-truncated 'nil))

(after! org
  (setq org-agenda-span 14)
  (setq org-agenda-start-on-weekday nil)
  (setq org-agenda-start-day "-0d"))

(map!
 (:after org
   :leader
   "o t" 'org-toggle-heading      ;; toogle wheter heading or not
   "o w" 'widen                   ;; show everythig
   "o n" 'org-narrow-to-subtree)) ;; show only what's within heading

(defun ab/org-show-just-me (&rest _)
  "Fold all other trees, then show entire current subtree."
  (interactive)
  (org-overview)
  (org-reveal)
  (org-show-subtree))

(map! (:after org
        :leader "o c" 'ab/org-show-just-me))            ;; Mnemonic: Collapse

(defun ab/open-index-file ()
  "Open the master org TODO list."
  (interactive)
  (find-file org-index-file)
  (end-of-buffer))

(map! :leader "i" #'ab/open-index-file)

(map! (:after org
        :leader
        "g h" 'org-previous-visible-heading      ;; Go Heading of current section
        "g e" 'org-previous-visible-heading      ;; Go e (= colemak up)
        "g u" 'outline-up-heading                ;; Go Up in hierarchy
        "g n" 'org-next-visible-heading))        ;; Go Next heading

;; (map! (:after org
;;   ")" 'org-next-visible-heading
;;   "(" 'org-previous-visible-heading
;;   :leader "g u" 'outline-up-heading))               ;; Go Up in hierarchy

(defun ab/mark-done-and-archive ()
  "Mark the state of an org-mode item as DONE and archive it."
  (interactive)
  (org-todo 'done)
  (org-archive-subtree))

;; (define-key org-mode-map (kbd "C-c C-x C-s") 'ab/mark-done-and-archive)
(map! :leader "o d" 'ab/mark-done-and-archive)

(add-hook 'org-capture-mode-hook 'evil-insert-state)

(setq org-refile-targets '((nil :maxlevel . 6)
                           (org-agenda-files :maxlevel . 6)))
(setq org-completion-use-ido t)
(setq org-outline-path-complete-in-steps nil) ;; has to be nil for ido to work
(setq org-refile-use-outline-path 'file)

(setq org-capture-templates
      '(("l" "todo with Link" entry
         (file+headline org-index-file "Inbox")
         "*** TODO %?\n  %i\n  See: %a\n")

        ("n" "Note"  entry
         (file+headline org-index-file "Inbox")
         "*** %?\n\n")

        ("t" "Todo" entry
         (file+headline org-index-file "Inbox")
         "*** TODO %?\n")))

(defadvice org-switch-to-buffer-other-window
    (after supress-window-splitting activate)
  "Delete the extra window if we're in a capture frame"
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-other-windows)))

(defadvice org-capture-finalize
    (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame"
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame)))

(defun activate-capture-frame ()
  "run org-capture in capture frame"
  (select-frame-by-name "capture")
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (org-capture))

(server-start)

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :foreground "#A3BE8C" :height 1.3))))
 '(org-level-3 ((t (:inherit outline-3 :foreground "#81A1C1" :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :foreground "#8FBCBB" :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 )

(setq org-ellipsis " ...")

(setq org-pretty-entities 1)

(add-hook 'org-mode-hook
          '(lambda ()
             (delete '("\\.pdf\\'" . default) org-file-apps)
             (add-to-list 'org-file-apps '("\\.pdf\\'" . "zathura %s"))))

;; (use-package outshine)

(def-package! org-alert
  :init
  (setq alert-default-style 'libnotify)
  (setq org-alert-interval 3600)
  :config
  (org-alert-enable))

(after! latex
  (setq tex-fontify-script t
        ;; don't show ^ or _ for scripts
        font-latex-fontify-script 'invisible)

  ;; use Zathura as pdf viewer
  (setq TeX-view-program-selection '((output-pdf "Zathura"))
        TeX-source-correlate-start-server t))

(evil-leader/set-key
 "l l" 'TeX-command-run-all
 "l v" 'Tex-view
 "l n" 'LaTeX-narrow-to-environment)

(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1)
  (define-key evil-insert-state-map (kbd "C-e") 'yas-expand)
  (map! :leader "s n" 'yas-new-snippet)              ;; Snippet New
  (map! :leader "s g" 'yas-visit-snippet-file))      ;; Snippet Go

(use-package flycheck
  :defer t
  :diminish
  :config
  (global-flycheck-mode)
  ;; (flycheck-display-errors-delay .3)
  (setq-default flycheck-disabled-checkers '(tex-chktex)))

(use-package magit
  :defer t
  :config
  (use-package evil-magit)
  ;; This library makes it possible to reliably use the Emacsclient as the $EDITOR of child processes.
  (use-package with-editor))

(map! :leader "g g" 'magit-status)

(use-package ess
  :defer t
  )
;; (use-package ess-smart-underscore
;;   :after ess)