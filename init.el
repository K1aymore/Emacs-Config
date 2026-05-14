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
  (global-treesit-auto-mode))

(add-to-list 'treesit-auto-recipe-list
			 (make-treesit-auto-recipe
			  :lang 'c
			  :ts-mode 'c-ts-mode
			  :remap 'c-mode
			  :url "https://github.com/tree-sitter/tree-sitter-c"
			  :requires 'cpp
			  :abi14-revision "v0.23.6"
			  :ext "\\.c\\'"))
(add-to-list 'treesit-auto-recipe-list
			 (make-treesit-auto-recipe
			  :lang 'cpp
			  :ts-mode 'c++-ts-mode
			  :remap 'c++-mode
			  :requires 'c
			  :url "https://github.com/tree-sitter/tree-sitter-cpp"
			  :revision "v0.22.0" ;; BUG: newer grammar breaks syntax highlighting in `c++-ts-mode'
			  ;; :abi-14-revision "a0d1092dd724f7a6a62ac6bc755e65e6fceb19d4"
			  :ext "\\.cpp\\'"))
(add-to-list 'treesit-auto-recipe-list
			 (make-treesit-auto-recipe
			  :lang 'rust
			  :ts-mode 'rust-ts-mode
			  :remap 'rust-mode
			  :url "https://github.com/tree-sitter/tree-sitter-rust"
			  :abi14-revision "v0.23.3"
			  :ext "\\.rs\\'"))
(add-to-list 'treesit-auto-recipe-list
			 (make-treesit-auto-recipe
			  :lang 'gitcommit
			  :ts-mode 'git-commit-ts-mode
			  :url "https://github.com/gbprod/tree-sitter-gitcommit"
			  :abi14-revision "v0.4.0"
			  :ext "\\COMMIT_EDITMSG\\'"))
(treesit-auto-add-to-auto-mode-alist 'all)

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
(global-display-line-numbers-mode 1)
(pixel-scroll-precision-mode 1)
(setq mouse-wheel-progressive-speed nil);
(setq-default tab-width 4)
(global-visual-line-mode 1)
(global-visual-wrap-prefix-mode 1) ;; keep indentation

(semantic-mode 1)
(global-semantic-idle-completions-mode 1)



(defun conf () (interactive) (find-file "/synced/Nix/cfg"))
(defun cfg () (interactive) (find-file "~/.emacs.d/init.el"))
(defun configs() (interactive)
	   (find-file "/synced/Nix/cfg/modules/packages/mpv.nix")
	   (split-window-horizontally)
	   (find-file "~/.emacs.d/init.el"))
