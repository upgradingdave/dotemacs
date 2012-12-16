;;; Ensure the following snippet is added to `.emacs.d/init.el`

;;(require 'package)
;;(add-to-list 'package-archives
;;             '("marmalade" . "http://marmalade-repo.org/packages/") t)
;;(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;;; Load favorite packages from elpa
(defvar my-packages '(starter-kit js2-mode magit php-mode slime-js js-comint ace-jump-mode 
                                  unbound markdown-mode feature-mode yasnippet clojure-mode nrepl
                                  gist)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; yasnippet
(require 'yasnippet)
(yas/initialize)
;; Change prompt from the default: 
;; (yas/x-prompt yas/dropdown-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt)
(setq yas/prompt-functions '(yas/completing-prompt yas/ido-prompt yas/no-prompt))
(setq yas/root-directory 
      '("~/.emacs.d/dparoulek/snippets"))
(mapc 'yas/load-directory yas/root-directory)

;; ecukes
;;(add-to-list 'load-path "~/code/elisp/ecukes")
;;(require 'ecukes)

;;maven
(add-to-list 'load-path "~/code/elisp/maven-mode")
(require 'mvn-mode)

(require 'unbound)

(dired default-directory)
