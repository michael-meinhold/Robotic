## Copyright (C) 2024   Michael Meinhold
##
##This file is part of robotictools.
##
##    robotictools is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    robotictools is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with robotictools.  If not, see <http://www.gnu.org/licenses/>.

function c = isrotationmatrix (R, eps)
  % Funktion zur Prüfung einer dreireihigen Matrix, ob hierdurch eine Drehung beschrieben ist
  %
  % Syntax: c = isrotationmatrix(R, eps)
  %
  % Eingabeparameter:
  %   R: dreireihige reelle Matrix
  %   eps: (optionaler) Skalarwert, der als Toleranz für die für numerische Prüfung dient. default: 1e-9
  %
  % Ausgabeparameter:
  %   c: ein boolescher Wert ('true' oder 'false'), der angibt, ob R eine Drehung beschreibt
  %
  % Beschreibung:
  %   Die Funktion 'isrotationmatrix' überprüft, ob eine gegebene dreireihige reelle Matrix R eine Rotationsmatrix ist.
  %   Die Funktion führt (innerhalb der Toleranz eps) zwei Checks durch:
  %   1. Orthogonalitätscheck: Überprüft, ob R * transpose(R) die Einheitsmatrix ist
  %   2. Determinantencheck: Überprüft, ob die Determinante von R gleich 'Eins' ist
  %   Wenn beide Bedingungen erfüllt sind, gibt die Funktion 'true' zurück, andernfalls 'false'.
  %
  % Beispiele:
  %   R = eye(3);
  %   isrotationmatrix(R) # Gibt 'true' aus
  %
  %   R = [-1 0 0; 0 1 0; 0 0 1];
  %   isrotationmatrix(R) # Gibt 'false' aus wegen det(R)=-1
  %
  %   R = [0.999 0 0.001; 0 1 0; -0.001 0 0.999];
  %   isrotationmatrix(R, 1e-2) # Gibt 'true' aus
  %
  % Hilfe:
  %   help isrotationmatrix
  %
  % Datum: [15.04.2025]
  % Version: [1.0.1]

  % Setzt default Toleranz, falls kein Parameterwert eingegeben
  if (nargin == 1)
    eps = 1.0E-09;
  endif

  % Prüft, ob R eine dreireihige Matrix ist
  if rows(R) != 3 || columns(R) != 3
    error("@isrotationmatrix: R muss eine dreireihige Matrix sein!");
  endif

  % Orthogonalitätscheck
  orthogonality_check = R * transpose(R) - eye(3);
  norm_orth = norm(orthogonality_check, "fro");
  if norm_orth >= eps
    c = false;
    return;
  endif

  % Determinantencheck
  det_R = det(R);
  if abs(det_R - 1.0) >= eps
    c = false;
    return;
  endif

  % Wenn alle Checks bestanden, dann ist R eine Rotationsmatrix
  c = true;
endfunction
