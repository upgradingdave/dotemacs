;; Copy this file into ~/.emacs.d/init.el

(require 'package)
(package-initialize)
(add-to-list 'package-archives
              '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
              '("melpa" . "http://melpa.milkbox.net/packages/") t)

(unless package-archive-contents
  (package-refresh-contents))

(when (not (package-installed-p 'starter-kit))
  (package-install 'stater-kit))
