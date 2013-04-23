;; My emacs java development environment

;; maven
(add-to-list 'load-path "~/code/elisp/maven-mode")
(require 'mvn-mode)

;; Semantic
(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode
                                  global-semantic-idle-completions-mode))
(semantic-mode 1)

;; Malabar Mode
(add-to-list 'load-path
             (expand-file-name
              "~/src/emacs/malabar-mode/malabar-1.5-SNAPSHOT/lisp"))

(require 'malabar-mode)
(setq malabar-groovy-lib-dir
      (expand-file-name
       "~/src/emacs/malabar-mode/malabar-1.5-SNAPSHOT/lib"))

(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

(add-hook 'malabar-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'malabar-compile-file-silently
                      nil t)))

;; ffip
(require 'find-file-in-project)
(add-to-list 'ffip-patterns "*.xml")
(add-to-list 'ffip-patterns "*.java")
(add-to-list 'ffip-patterns "*.json")
(add-to-list 'ffip-patterns "*.jsp")
(add-to-list 'ffip-patterns "*.conf")
(setq ffip-find-options "-not -regex \".*target.*\"")
(setq ffip-project-file "pom.xml")
(global-set-key (kbd "C-x f") 'find-file-in-project)


;; Useful elisp java functions

(defun java/cwd-to-package ()
  "Assuming you're using maven directory structure defaults,
return the package name of the current working directory. In
other words, start in cwd, traverse up dir tree until 'java' dir
is found, then use directory path to create a package name. For
example, if cwd is
`/home/user/project/src/test/java/my/project/helpers`, then the
package name will be `my.project.helpers`"
  (interactive)
  (let* ((topdir "java")
         (dirprefix (expand-file-name
                     (concat (locate-dominating-file default-directory topdir) topdir "/")))
         (curr (directory-file-name (expand-file-name ".")))
         (valid-dir (string-match dirprefix curr)))
    (if valid-dir
        (replace-regexp-in-string
         "/"
         "."
         (substring curr (match-end 0))) "")))

