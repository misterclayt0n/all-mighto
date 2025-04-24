(setq doom-theme 'doom-gruvbox-light)
(setq display-line-numbers-type t)
(setq org-directory "~/org/")


(setq doom-font (font-spec :family "Iosevka" :size 16 :weight 'medium))

(custom-set-faces
 '(region ((t :extend nil))))

;; blink this shit
(blink-cursor-mode t)

;; block cursor >>>>
(setq evil-insert-state-cursor '(box))

;; shell command
(map! :leader ("e" #'shell-command))

;; create splits
(map! :leader
      :desc "Split window vertically"   "w|" #'split-window-right
      :desc "Split window horizontally" "w-" #'split-window-below)

;; fuck decoration
(setq font-lock-maximum-decoration 'minimal)

;; relative line numbers
(setq display-line-numbers-type 'relative)

;; fuck line mode man
(setq global-hl-line-modes nil)

;; unnamed plus ma man
(setq select-enable-clipboard nil)

;; copy to clipboard
(map! :leader
      "y" #'(lambda () (interactive)
              (if (use-region-p)
                  (progn
                    (clipboard-kill-ring-save (region-beginning) (region-end))
                    (deactivate-mark))
                (clipboard-kill-ring-save (line-beginning-position) (line-end-position)))))

;; yank from clipboard
(map! :map general-override-mode-map
      "C-S-v" #'(lambda() (interactive)
                  (if (display-graphic-p)
                      (clipboard-yank)
                    (insert-for-yank (gui-get-primary-selection)))))

(setq confirm-kill-emacs nil)

;; open file in split screen
(after! dired
  (map! :map dired-mode-map
        :n "C-<return>" (lambda ()
                          (interactive)
                          (let ((split-width-threshold nil)
                                (split-height-threshold 0))
                            (dired-find-file-other-window)))))

;; rezise windows
(map! :map global-map
      "C-<left>" (lambda () (interactive) (shrink-window-horizontally 2))
      "C-<right>" (lambda () (interactive) (enlarge-window-horizontally 2))
      "C-<down>" (lambda () (interactive) (shrink-window 2))
      "C-<up>" (lambda () (interactive) (enlarge-window 2)))

(setq ido-show-dot-for-dired t)

;; redo
(map! :map global-map
      :n "U" #'undo-redo)

(map! :leader ("tt" #'neotree-toggle))
(map! :leader ("td" #'neotree-dir))

(setq neo-window-position '(right))

(after! org
  (setq org-hide-emphasis-markers t))

;; footer message
(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Mister.")))

;; remove sections on dashboard
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;; dashboard pic
(setq fancy-splash-image "~/.config/doom/images/mister.jpg")

;; tree
(setq treemacs-position 'right)
