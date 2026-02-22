;; TODO: make alt-backspace remove up until first non-whitespace,
;; not including the word, as is the defualt

;; Start fullscreen
(push '(fullscreen . maximized) default-frame-alist)

;; Customize user interface.
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode 1)
(setq column-number-mode t)

;; Theme.
(load-theme 'modus-operandi)
(set-face-attribute 'default nil :height 130) ; 130 = 13pt

;; Use spaces, not tabs, for indentation.
(setq-default indent-tabs-mode nil)

;; Highlight matching pairs of parentheses.
(setq show-paren-delay 0)
(show-paren-mode)

;; Write customizations to a separate file instead of this file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;; Enable installation of packages from MELPA.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install packages.
(dolist (package '(slime
                   slime-company
                   company
                   paredit
                   rainbow-delimiters
                   centaur-tabs
                   drag-stuff
                   winum))
  (unless (package-installed-p package)
    (package-install package)))

;; Configure SBCL as the Lisp program for SLIME.
(add-to-list 'exec-path "/usr/local/bin")
(setq inferior-lisp-program "sbcl")

;; Enable Paredit.
;(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
;(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
;(add-hook 'ielm-mode-hook 'enable-paredit-mode)
;(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
;(add-hook 'lisp-mode-hook 'enable-paredit-mode)
;(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
;(require 'paredit)
;(defun override-slime-del-key ()
;  (define-key slime-repl-mode-map
;    (read-kbd-macro paredit-backward-delete-key) nil))
;(add-hook 'slime-repl-mode-hook 'override-slime-del-key)

;; Enable Rainbow Delimiters.
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'ielm-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'slime-repl-mode-hook 'rainbow-delimiters-mode)

;; Customize Rainbow Delimiters.
(require 'rainbow-delimiters)
(set-face-foreground 'rainbow-delimiters-depth-1-face "#c66")  ; red
(set-face-foreground 'rainbow-delimiters-depth-2-face "#6c6")  ; green
(set-face-foreground 'rainbow-delimiters-depth-3-face "#69f")  ; blue
(set-face-foreground 'rainbow-delimiters-depth-4-face "#cc6")  ; yellow
(set-face-foreground 'rainbow-delimiters-depth-5-face "#6cc")  ; cyan
(set-face-foreground 'rainbow-delimiters-depth-6-face "#c6c")  ; magenta
(set-face-foreground 'rainbow-delimiters-depth-7-face "#ccc")  ; light gray
(set-face-foreground 'rainbow-delimiters-depth-8-face "#999")  ; medium gray
(set-face-foreground 'rainbow-delimiters-depth-9-face "#666")  ; dark gray

;; Enable Vertico for vertical completion UI
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Fuzzier finding in vertico
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t))

;; Enable Marginalia for rich annotations (shortcuts/descriptions)
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; Just kill processes on exit
(setq confirm-kill-processes 'nil)

;; Allow Mx slime-load-system and Mx slime-open-system
(add-to-list 'slime-contribs 'slime-asdf)
(add-to-list 'slime-contribs 'slime-sbcl-exts)
(add-to-list 'slime-contribs 'slime-fancy)

;; Fuzzy slime autocomplete
;(setq slime-complete-symbol*-fancy t)
;(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

;; Treemacs (directory tree)
;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :ensure t
  :defer t

  :config
  (progn
    (setq treemacs-width 30
          treemacs-width-is-initially-locked t)
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t))

  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs-toggle)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

;(treemacs-start-on-boot)

;; Right-click context menu
(context-menu-mode 1)

;; Show tabs for buffers in window
;; (global-tab-line-mode 1)
;; Alternatively: look into centaur tabs

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("M-<left>" . centaur-tabs-backward)
  ("M-<right>" . centaur-tabs-forward))

;; Select windows by pressing e.g. M-1
(setq winum-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "C-`") 'winum-select-window-by-number)
      (define-key map (kbd "C-²") 'winum-select-window-by-number)
      (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
      (define-key map (kbd "M-1") 'winum-select-window-1)
      (define-key map (kbd "M-2") 'winum-select-window-2)
      (define-key map (kbd "M-3") 'winum-select-window-3)
      (define-key map (kbd "M-4") 'winum-select-window-4)
      (define-key map (kbd "M-5") 'winum-select-window-5)
      (define-key map (kbd "M-6") 'winum-select-window-6)
      (define-key map (kbd "M-7") 'winum-select-window-7)
      (define-key map (kbd "M-8") 'winum-select-window-8)
      map))

(require 'winum)
(winum-mode)

;; Enable autosave
;; Maybe look into super-save later.
(auto-save-visited-mode 1)
(setq auto-save-visited-interval 60)

;; Save automatically before C-c C-k
(defun custom-slime-save-and-compile-file ()
  "Save the current buffer and then run slime-compile-and-load-file."
  (interactive)
  (when (buffer-modified-p)
    (save-buffer))
  (slime-compile-and-load-file))

(with-eval-after-load 'slime
  (define-key slime-mode-map (kbd "C-c C-k") 'custom-slime-save-and-compile-file))

;; Delete trailing whitespace on save.
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1)

;; Fix indents on save for lisp files.
;; https://www.emacswiki.org/emacs/indent-file.el
(defun indent-whole-buffer ()
    "indent whole buffer and untabify it"
    (interactive)
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max)))
(defun indent-file-when-save ()
    "indent file when save."
    (make-local-variable 'after-save-hook)
    (add-hook 'after-save-hook
        (lambda ()
            (if (buffer-file-name)
                (indent-whole-buffer))
            (save-buffer))))
(add-hook 'lisp-mode-hook 'indent-file-when-save)

;(add-hook 'lisp-mode-hook
;          (lambda ()
;            (add-hook 'before-save-hook 'indent-region nil t)))

;; Overwrite selected text.
(delete-selection-mode 1)

;; Auto-insert closing parens when typing (
(electric-pair-mode 1)

;; Allow M-<up> and M-<down> to swap lines around.
(require 'drag-stuff)
(drag-stuff-global-mode t)
(define-key drag-stuff-mode-map (drag-stuff--kbd 'up) 'drag-stuff-up)
(define-key drag-stuff-mode-map (drag-stuff--kbd 'down) 'drag-stuff-down)
