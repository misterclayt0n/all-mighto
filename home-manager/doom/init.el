(doom! :input

       :completion
       (corfu +orderless)  ; complete with cap(f), cape and a flying feather!
       vertico             ; the search engine of the future

       :ui
       doom                ; what makes DOOM look the way it does
       doom-dashboard      ; a nifty splash screen for Emacs
       hl-todo             ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       modeline            ; snazzy, Atom-inspired modeline, plus API
       ophints             ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       smooth-scroll       ; So smooth you won't believe it's not butter
       (vc-gutter +pretty) ; vcs diff in the fringe
       vi-tilde-fringe     ; fringe tildes to mark beyond EOB
       workspaces          ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere)  ; come to the dark side, we have cookies
       file-templates      ; auto-snippets for empty files
       fold                ; (nigh) universal code folding
       format              ; automated prettiness
       multiple-cursors    ; editing in many places at once
       snippets            ; my elves. They type so I don't have to

       :emacs
       dired               ; making dired pretty [functional]
       electric            ; smarter, keyword-based electric-indent
       ibuffer             ; interactive buffer management
       undo                ; persistent, smarter undo for your inevitable mistakes
       vc                  ; version-control and Emacs, sitting in a tree

       :term
       
       :checkers
       syntax              ; tasing you for every semicolon you forget

       :tools
       editorconfig        ; let someone else argue about tabs vs spaces
       (eval +overlay)     ; run code, run (also, repls)
       lookup              ; navigate your code and its documentation
       magit               ; a git porcelain for Emacs
       make                ; run make tasks from Emacs
       tree-sitter         ; syntax and parsing, sitting in a tree...

       :os
       (:if (featurep :system 'macos) macos)  ; improve compatibility with macOS

       :lang
       cc                  ; C > C++ == 1
       emacs-lisp          ; drown in parentheses
       go                  ; the hipster dialect
       javascript          ; all(hope(abandon(ye(who(enter(here))))))
       markdown            ; writing docs for people to ignore
       nix                 ; I hereby declare "nix geht mehr!"
       org                 ; organize your plain life in plain text
       python              ; beautiful is better than ugly
       rust                ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       sh                  ; she sells {ba,z,fi}sh shells on the C xor
       web                 ; the tubes
       zig                 ; C, but simpler

       :email

       :app
       
       :config
       (default +bindings +smartparens))
