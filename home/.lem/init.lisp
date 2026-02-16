(in-package :lem-user)

;; Show command completion list immediately, without pressing TAB.
(add-hook *prompt-after-activate-hook*
          (lambda ()
            (call-command 'lem/prompt-window::prompt-completion nil)))

(add-hook *prompt-deactivate-hook*
          (lambda ()
            (lem/completion-mode:completion-end)))

;; Set the color theme.
(load-theme "lem-default")

;; Enable line numbers
(lem/line-numbers:toggle-line-numbers)
