;; My emacs java development environment

(add-to-list 'load-path (expand-file-name "~/src/emacs/malabar-mode/malabar-1.5-SNAPSHOT/lisp"))

(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)
(require 'malabar-mode)
(setq malabar-groovy-lib-dir (expand-file-name "~/src/emacs/malabar-mode/malabar-1.5-SNAPSHOT/lib"))
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

(add-hook 'malabar-mode-hook
          (lambda () 
            (add-hook 'after-save-hook 'malabar-compile-file-silently
                      nil t)))

(global-set-key (kbd "C-c m t") '(malabar-run-maven-command "test") )

;; Useful elisp java functions

(defun java/cwd-to-package ()
  "Assuming you're using maven directory structure defaults,
return the package name of the current working directory"
  (interactive)
  (let* ((curr (directory-file-name (expand-file-name ".")))
         (valid-dir (string-match "/src/main/java/" curr)))
    (if valid-dir
        (replace-regexp-in-string
         "/"
         "."
         (substring curr (match-end 0)))
      "")))

