;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; https://drewsh.com/use-package-with-straight
;; (setq straight-use-package-by-default t)

(straight-use-package 'magit)

;; (straight-use-package
 ;; '(batppuccin :type git :host github :repo "bbatsov/batppuccin-emacs"))
;; (load-theme 'batppuccin-mocha t)
(straight-use-package 'catppuccin-theme)
(load-theme 'catppuccin :no-confirm)
(add-to-list 'default-frame-alist '(font . "Fira Code-10"))
(set-fontset-font "fontset-default" '(#xf1900 . #xf19ff) (font-spec :size 26 :name "nasin-nanpa"))
;; ,.,.,.,.,.,.,.,.,.,.,.,.
;; 󱤑󱤧󱥷󱥬󱤑󱤧󱥷󱥬󱤑󱤧󱥷󱥬

(toggle-scroll-bar -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)
(pixel-scroll-precision-mode)

 
