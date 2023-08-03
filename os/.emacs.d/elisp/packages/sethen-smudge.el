(require 'use-package)

(use-package smudge
  :custom
  (smudge-oauth2-client-id "c9e3d73df8c54cf3800b407eb890cf51")
  (smudge-oauth2-client-secret "b85462351a62458bab1b84bf380e3ecd")
  (smudge-transport 'connect))

(provide 'sethen-smudge)
