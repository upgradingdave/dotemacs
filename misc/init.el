; packages causing trouble or that I no longer use:
;;malabar-mode
;;slime-js 
;;multiple-cursors
;;js2-mode 
;;restclient 

; NOTE: Order of the packages is important here! After installing each package, the autoloads are run (I think) and so, for example, if the stater-kit package is installed first, then it will run (and therefore all my custom init scripts will run) before all the other packages are installed. 

; packages I want
(setq package-list   
      '(paredit color-theme color-theme-solarized unbound rainbow-delimiters auto-complete magit clojure-mode cider zencoding-mode php-mode js-comint gist ace-jump-mode markdown-mode feature-mode yasnippet command-frequency twittering-mode cl-lib expand-region starter-kit))

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(put 'dired-find-alternate-file 'disabled nil)
