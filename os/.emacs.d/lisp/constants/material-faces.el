;;; material-faces.el --- Material Faces -*- lexical-binding: t -*-

;; Author: sethen
;; Maintainer: sethen


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:


;;; Code:

(require 'material-colors)

(defface material-blue-one-fg `((t (:foreground ,material-blue-one))) "Material blue one foreground foreground face!" :group 'material-faces)
(defface material-blue-two-fg `((t (:foreground ,material-blue-two))) "Material blue two foreground foreground face!" :group 'material-faces)
(defface material-blue-three-fg `((t (:foreground ,material-blue-three))) "Material blue three foreground face!" :group 'material-faces)
(defface material-green-fg `((t (:foreground ,material-green))) "Material green foreground face!" :group 'material-faces)
(defface material-grey-one-fg `((t (:foreground ,material-grey-one))) "Material green foreground face!" :group 'material-faces)
(defface material-grey-two-fg `((t (:foreground ,material-grey-two))) "Material green foreground face!" :group 'material-faces)
(defface material-grey-three-fg `((t (:foreground ,material-grey-three))) "Material green foreground face!" :group 'material-faces)
(defface material-orange-fg `((t (:foreground ,material-orange))) "Material orange foreground face!" :group 'material-faces)
(defface material-purple-fg `((t (:foreground ,material-purple))) "Material purple foreground face!" :group 'material-faces)
(defface material-red-one-fg `((t (:foreground ,material-red-one))) "Material red one foreground face!" :group 'material-faces)
(defface material-red-two-fg `((t (:foreground ,material-red-two))) "Material red two foreground face!" :group 'material-faces)
(defface material-yellow-fg `((t (:foreground ,material-yellow))) "Material yellow foreground face!" :group 'material-faces)
(defface white-fg `((t (:foreground ,material-white))) "White foreground face!" :group 'material-faces)

(provide 'material-faces)

;;; material-faces.el ends here
