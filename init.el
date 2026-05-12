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

(defvar os-windows (string-equal system-type "windows-nt") "Running on Windows.")

;; https://drewsh.com/use-package-with-straight
(setq straight-use-package-by-default t)

(straight-use-package 'magit)


(setq treesit-font-lock-level 4)
(straight-use-package 'nix-ts-mode)

(use-package treesit-auto
  :custom
  (treesit-auto-install t)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))


;; (straight-use-package '(batppuccin :type git :host github
				   ;; :repo "bbatsov/batppuccin-emacs"))
;; (load-theme 'batppuccin-mocha t)
(straight-use-package 'catppuccin-theme)
(load-theme 'catppuccin :no-confirm)
(add-to-list 'default-frame-alist '(font . "Fira Code-10"))
(set-fontset-font "fontset-default" '(#xf1900 . #xf19ff) (font-spec :size 26 :name "nasin-nanpa"))
(when os-windows (set-fontset-font "fontset-default" '(#xf1900 . #xf19ff)
				   (font-spec :size 16 :name "nasin-nanpa")))
;; ,.,.,.,.,.,.,.,.,.,.,.,.
;; 󱤑󱤧󱥷󱥬󱤑󱤧󱥷󱥬󱤑󱤧󱥷󱥬

(toggle-scroll-bar -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)
(pixel-scroll-precision-mode)


(defun conf () (interactive) (find-file "/synced/Nix/cfg"))
(defun cfg () (interactive) (find-file "~/.emacs.d"))
(defun configs() (interactive)
       (find-file "/synced/Nix/cfg/modules/packages/mpv.nix")
       (split-window-horizontally)
       (find-file "~/.emacs.d/init.el"))

       
