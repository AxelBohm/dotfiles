(show-paren-mode 1)

(setq display-line-numbers-type 'relative)

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-to-list 'auto-mode-alist '("/neomutt" . mail-mode))

;; Function to return first name of email recipient
;; Used by yasnippet

(defun ab/visit-references ()
  "go to my references file"
  (interactive)
  (find-file "~/org/Reference.org"))

(setq show-week-agenda-p t)

(global-prettify-symbols-mode 1)

(map! "M-o" 'other-window)

(setq truncate-lines nil)

(defun ab/visit-emacs-config ()
  "go to emacs config file"
  (interactive)
  (find-file "~/.doom.d/config.org"))

(map! :leader "e c" #'ab/visit-emacs-config)

(defun ab/reload-init-file ()
  "reload config file"
  (interactive)
  (load-file "~/.doom.d/config.el"))

(map! :leader "e r" 'ab/reload-init-file)

(map! :leader
      "b" #'switch-to-buffer
      "q" #'kill-buffer
      "s h" #'evil-window-split
      "s v" #'evil-window-vsplit
      "e c" #'ab/visit-emacs-config
      "r" #'ab/visit-references
      "n" #'other-window
      "w" #'save-buffer)

(defun ab/open-shell-in-split ()
  ;; open eshell
  (interactive)
  ;; (evil-window-split)
  (eshell))

(map! :leader "s s" 'ab/open-shell-in-split)

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

(after! evil
  (use-package! evil-matchit
    :config
    (global-evil-matchit-mode)))

(defun ab/switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(map! :leader "SPC" #'ab/switch-to-previous-buffer)

(after! org
  (add-hook 'org-mode-hook 'turn-off-auto-fill)
  (setq org-hide-emphasis-markers nil
        org-return-follows-link t
        ;; fill-column nil                          ;; doom tries to hard wrap all the time which I don't like
        ;; org-highlight-latex-and-related '(latex) ;; highlight latex fragments
        ;; org-tags-column -80                   ;; position of tags
        ;; org-tag-faces '(("major" :foreground "#81A1C1"))
        ;; org-tag-faces nil
        org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)")
                            (sequence "TODO(t)" "DIDN'T SUCCEED(s)" "|" "DOESN'T WORK(x)"  "TOO HARD(h)" "DONE(d)"))
        org-todo-keyword-faces '(("WAITING" :foreground "#8FBCBB" :weight bold))))


(map! :leader
      "o s l" 'org-store-link
      "o a" 'org-agenda
      "o c" 'org-capture)

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

(after! org (setq org-startup-truncated 'nil))

(after! org
  (setq org-agenda-span 14)
  (setq org-agenda-start-on-weekday nil)
  (setq org-agenda-start-day "-0d"))

(after! org
  (setq org-export-use-babel t)
  (map! :map org-mode-map
        :leader
        (:prefix "e"
          (:prefix ("p" . "latex")
            :desc "to latex"            "l" #'org-pandoc-export-to-latex
            :desc "to latex & open"     "L" #'org-pandoc-export-to-latex-and-open
            :desc "to latex pdf"        "p" #'org-pandoc-export-to-latex-pdf
            :desc "to latex pdf & open" "P" #'org-pandoc-export-to-latex-pdf-and-open))
        (:prefix ("o" . "src")
          :desc "previous block"        "p" #'org-babel-previous-src-block
          :desc "next block"            "n" #'org-babel-next-src-block
          :desc "execute block"         "e" #'org-babel-execute-src-block)))

(map! :map org-mode-map
      :leader
      "o t" 'org-toggle-heading      ;; toogle wheter heading or not
      "o w" 'widen                   ;; show everythig
      "o n" 'org-narrow-to-subtree)  ;; show only what's within heading

(defun ab/org-show-just-me (&rest _)
  "Fold all other trees, then show entire current subtree."
  (interactive)
  (org-overview)
  (org-reveal)
  (org-show-subtree))

(map! :map org-mode-map
      :leader "o r" 'ab/org-show-just-me)            ;; Mnemonic: restrict

(map! :map org-mode-map
      "M-e" #'org-metaup
      "M-n" #'org-metadown)

(defun ab/open-index-file ()
  "Open the master org TODO list."
  (interactive)
  (find-file org-index-file)
  (end-of-buffer))

(map! :leader "i" #'ab/open-index-file)

(map! :map org-mode-map
        :leader
        "g h" 'org-previous-visible-heading      ;; Go Heading of current section
        "g e" 'org-previous-visible-heading      ;; Go e (= colemak up)
        "g u" 'outline-up-heading                ;; Go Up in hierarchy
        "g n" 'org-next-visible-heading          ;; Go Next heading
        )

(map! :map org-mode-map
   :n ")" 'org-next-visible-heading
   :n "(" 'org-previous-visible-heading
   :leader "g u" 'outline-up-heading)               ;; Go Up in hierarchy

(defun ab/mark-done-and-archive ()
  "Mark the state of an org-mode item as DONE and archive it."
  (interactive)
  (org-todo 'done)
  (org-archive-subtree))

(map! :map org-mode-map :leader "o d" 'ab/mark-done-and-archive)

(after! org
  (add-hook 'org-capture-mode-hook 'evil-insert-state))

;; (setq org-refile-targets '((nil :maxlevel . 6)
;;                            (org-agenda-files :maxlevel . 6)))
;; (setq org-completion-use-ido t)
;; (setq org-outline-path-complete-in-steps nil) ;; has to be nil for ido to work
;; (setq org-refile-use-outline-path 'file)

(after! org
  (setq org-capture-templates
        '(("l" "todo with Link" entry
           (file+headline org-index-file "Inbox")
           "*** TODO %?\n  %i\n  See: %a\n")

          ("n" "Note"  entry
           (file+headline org-index-file "Inbox")
           "*** %?\n\n")

          ("t" "Todo" entry
           (file+headline org-index-file "Inbox")
           "*** TODO %?\n"))))

(after! org
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
    (org-capture)))

(server-start)

(after! org
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
   '(org-level-2 ((t (:inherit outline-2 :foreground "#A3BE8C" :height 1.3))))
   '(org-level-3 ((t (:inherit outline-3 :foreground "#81A1C1" :height 1.2))))
   '(org-level-4 ((t (:inherit outline-4 :foreground "#8FBCBB" :height 1.0))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
   ))

(after! org
  (setq org-ellipsis " ..."))

(after! org
  (setq org-pretty-entities 1))

(after! org
  (add-hook 'org-mode-hook
            '(lambda ()
               (delete '("\\.pdf\\'" . default) org-file-apps)
               (add-to-list 'org-file-apps '("\\.pdf\\'" . "zathura %s")))))

(use-package! org-alert
  :init
  (setq alert-default-style 'libnotify)
  (setq org-alert-interval 3600)
  :config
  (org-alert-enable))

(after! latex
  (setq tex-fontify-script t
        TeX-save-query nil
        ;; don't show ^ or _ for scripts
        font-latex-fontify-script 'invisible)
  ;; (add-to-list 'TeX-command-list '("LatexMk" "latexmk -pdflatex='pdflatex -file-line-error -synctex=1' -pdf %t" TeX-run-TeX nil))

  ;; use Zathura as pdf viewer
  (setq TeX-view-program-selection '((output-pdf "Zathura"))
        TeX-source-correlate-start-server t))

(map! :map LaTeX-mode-map
      :leader
      "m l" 'TeX-command-run-all
      "m v" 'Tex-view
      "m f" 'Tex-fold-env
      "m n" 'LaTeX-narrow-to-environment)

(use-package! yasnippet
  :config
  (setq yas-snippet-dirs '("~/.doom.d/snippets"))
  (map! :i "C-e" 'yas-expand)
  (map!
   :leader "s n" 'yas-new-snippet              ;; Snippet New
   :leader "s g" 'yas-visit-snippet-file))      ;; Snippet Go

(use-package! flycheck
  :config
  (global-flycheck-mode)
  ;; (flycheck-display-errors-delay .3)
  (setq-default flycheck-disabled-checkers '(tex-chktex)))

(after! magit
  :config
  (use-package evil-magit)
  ;; This library makes it possible to reliably use the Emacsclient as the $EDITOR of child processes.
  (use-package with-editor))

(map! :leader "g g" 'magit-status)

;; (after! ess)
;; (use-package ess-smart-underscore
;;   :after ess)

(use-package! company
  :bind (("C-n" . company-complete))
  :init
  (setq company-dabbrev-ignore-case t
        company-idle-delay 0.1
        company-tooltip-limit 5
        company-tooltip-minimum-width 40
        company-minimum-prefix-length 2)
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  ;; Add yasnippet support for all company backends
  ;; https://github.com/syl20bnr/spacemacs/pull/179
  (defvar company-mode/enable-yas t
    "Enable yasnippet for all backends.")
  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

  (map! :i "C-n" 'company-complete)) ;; doesn't work

(map! (:when (featurep! :completion company)
        :i "C-n"      #'+company/complete
        :i "C-SPC"    #'+company/complete))

(after! flyspell
  :config
  (map! :leader "s c" 'flyspell-mode)      ;; toggle spell checking
  (map! :n "z=" 'ispell-word)

  (setq ispell-program-name "hunspell"
        ispell-silently-savep t            ;; save persal dictionary without asking
        ispell-local-dictionary "en_US"
        ;; ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")
        ispell-list-command "--list"
        ispell-local-dictionary-alist '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "['‘’]"
                                         t ; Many other characters
                                         ("-d" "en_US") nil utf-8))))

(defun ab/save-word ()
  (interactive)
  (let ((current-location (point))
        (word (flyspell-get-word)))
    (when (consp word)
      (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))

(map! :n "z g" 'ab/save-word)

(use-package! counsel
  :config
  (ivy-mode 1)
  ;; Virtual buffers correspond to bookmarks and recent files list
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (global-set-key "\C-s" 'swiper)

  (map! :leader "f f" 'counsel-find-file)
  ;; make projectile use ivy as completion system
  ;; (setq projectile-completion-system 'ivy)

  ;; Deletes current input, resets the candidates list to the currently restricted matches.
  (define-key minibuffer-local-map (kbd "S-SPC") 'ivy-restrict-to-matches))

(use-package! smartparens
  :config
  (sp-local-pair 'org-mode "$" "$")
  (sp-local-pair 'latex-mode "$" "$")   ;; omg, I want this so badly
  (sp-local-pair 'latex-mode "\\langle" "\\rangle" :trigger "\\l(")
  (sp-local-pair 'latex-mode "\\lVert" "\\rVert" :trigger "\\l(")

  (sp-local-pair 'latex-mode "\\left(" "\\right)" :trigger "\\l(")
  (sp-local-pair 'latex-mode "\\left[" "\\right]" :trigger "\\l(")
  (sp-local-pair 'latex-mode "\\left\\{" "\\right\\}" :trigger "\\l(")
  (sp-local-pair 'latex-mode "\\left\\langle" "\\right\\rangle" :trigger "\\l(")

  (smartparens-global-mode 1)) ;; I always want this

;; (after! mu4e
;;   (setq +mu4e-backend 'offlineimap)
;;   ;; (set-email-account! "EduPolitech"
;;   ;;   `((mu4e-sent-folder       . "/edu-politech/Sent Mail")
;;   ;;     (mu4e-drafts-folder     . "/edu-politech/Drafts")
;;   ;;     (mu4e-trash-folder      . "/edu-politech/Trash")
;;   ;;     (mu4e-refile-folder     . "/edu-politech/All Mail")
;;   ;;     (smtpmail-smtp-user     . ,(password-store-get "mail/edu-politech"))
;;   ;;     (user-mail-address      . ,(password-store-get "mail/edu-politech"))
;;   ;;     (mu4e-compose-signature . "---\nEdu Politech"))
;;   ;;   t)
;;   (set-email-account! "MainMail"
;;     `((mu4e-sent-folder       . "~/.mail/uniwien/Sent")
;;       (mu4e-drafts-folder     . "~/.mail/uniwien/Drafts")
;;       (mu4e-trash-folder      . "~/.mail/uniwien/Trash")
;;       (mu4e-refile-folder     . "/All Mail")
;;       (smtpmail-smtp-user     . ,(auth-source-pass-get "user" "mail/mainmail"))
;;       (user-mail-address      . ,(auth-source-pass-get "user" "mail/mainmail"))
;;       (mu4e-compose-signature . "---\nMain Mail")))
;;   (set-email-account! "Paradox"
;;     `((mu4e-sent-folder       . "/paradox/Sent Mail")
;;       (mu4e-drafts-folder     . "/paradox/Drafts")
;;       (mu4e-trash-folder      . "/paradox/Trash")
;;       (mu4e-refile-folder     . "/paradox/All Mail")
;;       (smtpmail-smtp-user     . ,(auth-source-pass-get "user" "mail/paradox"))
;;       (user-mail-address      . ,(auth-source-pass-get "user" "mail/paradox"))
;;       (mu4e-compose-signature . "---\nParadox"))
;;     t))
