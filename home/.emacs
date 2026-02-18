;;; Emacs4CL 0.5.0 <https://github.com/susam/emacs4cl>

;; Start fullscreen
(push '(fullscreen . maximized) default-frame-alist)

;; Customize user interface.
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
(setq inhibit-startup-screen t)

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
(dolist (package '(slime paredit rainbow-delimiters))
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

;; Custom additions

;; Enable Vertico for vertical completion UI
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Enable Marginalia for rich annotations (shortcuts/descriptions)
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; Just kill processes on exit
(setq confirm-kill-processes 'nil)

;; Allow Mx slime-load-system and Mx slime-open-system
(add-to-list 'slime-contribs 'slime-asdf)

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

(treemacs-start-on-boot)

;; Right-click context menu
(context-menu-mode 1)

;; Show tabs for buffers in window
(global-tab-line-mode 1)
;; Alternatively: look into centaur tabs
