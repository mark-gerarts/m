(in-package :lem-user)

;; Show command completion list immediately, without pressing TAB.
(add-hook *prompt-after-activate-hook*
          (lambda ()
            (call-command 'lem/prompt-window::prompt-completion nil)))

(add-hook *prompt-deactivate-hook*
          (lambda ()
            (lem/completion-mode:completion-end)))

(load-theme "windows-95-light")

(lem/line-numbers:toggle-line-numbers)

(lem/auto-save::auto-save-mode t)

(add-hook (variable-value 'before-save-hook :global t)
          #'delete-trailing-whitespace)
