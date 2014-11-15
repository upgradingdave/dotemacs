(require 'color-theme)
(require 'color-theme-solarized)

(defun dp/theme-dark ()
  (interactive)
  (load-theme 'solarized-dark t))

(defun dp/theme-screencast ()
  (interactive)
  (custom-set-faces
   ;; DARK (large for screencasting)
   '(default ((t (:stipple nil :background "black" :foreground "grey90" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 184 :width normal :family "apple-monaco"))))))

(defun dp/theme-light ()
  (interactive)
  (load-theme 'solarized-light))


