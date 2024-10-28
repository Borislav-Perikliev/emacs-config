(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" default))
 '(display-battery-mode t)
 '(display-line-numbers-type 'relative)
 '(display-time-mode t)
 '(electric-pair-mode t)
 '(global-company-mode t)
 '(global-display-line-numbers-mode t)
 '(global-whitespace-mode t)
 '(ido-everywhere t)
 '(ido-mode t)
 '(ido-ubiquitous-mode t)
 '(menu-bar-mode nil)
 '(org-agenda t)
 '(org-beautify-theme-autoloads t)
 '(org-bullets-mode t)
 '(org-mode t)
 '(package-selected-packages
   '(call-graph move-text drag-stuff mpv org-beautify-theme org-bullets org-emms org-grep org-radiobutton org-rainbow-tags org-rich-yank org-special-block-extras org-starter org-super-agenda org-superstar orglue org-table-color org org-ac idle-org-agenda helm-org emms emms-player-mpv-jp-radios muse company-irony-c-headers company-c-headers company-dict auto-complete-c-headers ac-c-headers py-snippets el-autoyas flycheck-cython flylisp flymake flycheck which-key iedit mc-extras gruber-darker-theme smex magit))
 '(recentf-mode t)
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(semantic-mode t)
 '(server-start t)
 '(set-default-font "Ubuntu Mono-18")
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(which-key-mode t)
 '(yas-global-mode t))
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-space ((t (:background "#181818" :foreground "RoyalBlue3")))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.prg/elpa/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages") t)
(package-initialize)

(require 'magit)
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list "~/.emacs.d/site-lisp/magit/Documentation/")
  (add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp"))

(require 'whitespace)
(setq whitespace-style '(face tabs spaces tab-mark space-mark))
(add-hook 'dired-mode-hook
	  (lambda () (setq-local whitespace-style nil)))

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "M-q") 'rc/duplicate-line)


(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'ahead:include-directories '"/usr/include/c++/14")
  (add-to-list 'ahead:include-directories '"/usr/include/x86_64-linux-gnu")
  (add-to-list 'ahead:include-directories '"/usr/include/c++/14/backward")
  (add-to-list 'ahead:include-directories '"/usr/include/x86_64-linux-gnu/c++/14")
  (add-to-list 'ahead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/14/include"))
(require 'company)
(global-company-mode)
(require 'competitive-programming-snippets)
(competitive-programming-snippets-init)
(use-package drag-stuff
  :init
  (drag-stuff-global-mode)
  (drag-stuff-define-keys))

;;(add-hook 'c-mode-hook 'lsp)
;;(add-hook 'c-mode-hook 'my:ac-c-headers-init())
;;(add-hook 'c++-mode-hook 'lsp)
;;(add-hook 'c++-mode-hook 'my:ac-c-headers-init())
;;(add-to-list 'company-backends 'company-c-headers)
(require 'flycheck)
(require 'flymake)
(require 'flylisp)
(require 'flyspell)
(require 'helm)
(require 'helm-lsp)
(require 'iedit)
(require 'lsp)
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)
(require 'mc-extras)
(require 'which-key)
(require 'yasnippet)

(require 'org-bullets)

(emms-all)
(setq emms-player-list '(emms-player-mpv)
      emms-info-functions '(emms-info-native
			    emms-info-metaflac
			    emms-info-ogginfo))

(setq confirm-kill-emacs 'y-or-n-p)

;;(setq c-default-style "stroustrup")
;(setq c-basic-offset 4)

(set-frame-parameter (selected-frame) 'alpha '(85 . 85))
(add-to-list 'default-frame-alist '(alpha . (85 . 85)))

