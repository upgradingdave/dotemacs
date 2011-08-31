;; Custom Theme Stuff

;; Full Screen
;;(set-frame-parameter nil 'fullscreen 'fullboth)
;; Specify size of windows at startup
;; The following is correct for my macbook pro
;; THE VALUES FOR WIDTH AND HEIGHT ARE NOT PIXELS!!! 
;; They are cols and rows and depend on font size
;; 89 columns, 31 rows, with 18.4pt monaco is exactly 1021x764
;; (just a hair smaller than 1024x768 pixels)
(defun custom-theme-dim-frame (top left width height)
  (progn
    (setq initial-frame-alist `((top . ,top) (left . ,left) (width . ,width) (height . ,height)))
    (setq default-frame-alist `((top . ,top) (left . ,left) (width . ,width) (height . ,height)))
    )
  )

;; Change the encoding to utf-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;svn 
;; load psvn on startup to get the little green and orange circle icons
;;(load-file (expand-file-name "~/.emacs.d/thirdparty/psvn/psvn.el"))
;;(require 'psvn)

(defun custom-theme-select (themeid)
  "Switch between custom themes. 
   THEMEID can be one of:
   1 => normal, default
   2 => screencasting theme
   3 => white background, black text"
  (interactive "nTheme Id: ")
  (cond 
   ((eq themeid 1)
    (custom-set-faces
     '(default ((t (:stipple nil :background "black" :foreground "grey90" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :family "apple-monaco"))))
     '(show-paren-match ((((class color) (background dark)) (:background "MidnightBlue"))))))
   ((eq themeid 2)
    (custom-set-faces
     ;; DARK (large for screencasting)
     '(default ((t (:stipple nil :background "black" :foreground "grey90" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 184 :width normal :family "apple-monaco")))))
    (custom-set-variables
     '(ecb-options-version "2.40")
     '(ecb-use-speedbar-instead-native-tree-buffer (quote dir))
     '(eshell-prompt-function (lambda nil (if (= (user-uid) 0) " # " " $ ")))
     '(whitespace-empty (quote whitespace-tab))
     '(whitespace-indentation (quote whitespace-tab))
     '(whitespace-space-before-tab (quote whitespace-tab))
     '(whitespace-trailing (quote whitespace-tab))))
   ((eq themeid 3)
    (custom-set-faces
     '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :family "apple-monaco"))))
     '(show-paren-match ((((class color) (background dark)) (:background "MidnightBlue"))))))
   )
  )

(defun custom-theme-screencast ()
  "Configure environment for screencasting"
  (interactive)
  (progn
    (custom-theme-dim-frame 1 1 89 32)
    (custom-theme-select 2))
  )

(defun custom-theme-default ()
  "Configure environment for screencasting"
  (interactive)
  (progn
    (custom-theme-dim-frame 1 1 180 64)
    (custom-theme-select 1))
  )

(defun custom-theme-light ()
  "Configure environment for screencasting"
  (interactive)
  (custom-theme-dim-frame 1 1 180 64)
  (custom-theme-select 3)
  )

(custom-theme-default)
