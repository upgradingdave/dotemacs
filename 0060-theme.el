(require 'color-theme)
(require 'color-theme-solarized)
;;(load-theme 'solarized-light t)
(load-theme 'solarized-dark t)

(defun default-theme ()
  (interactive)
  (load-theme 'solarized-dark t))

(defun screencast-theme ()
  (interactive)
  (custom-set-faces
   ;; DARK (large for screencasting)
   '(default ((t (:stipple nil :background "black" :foreground "grey90" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 184 :width normal :family "apple-monaco"))))))



