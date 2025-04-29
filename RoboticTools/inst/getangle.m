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

function theta = getangle (R, eps)
  % Funktion berechnet Drehwinkels zu einer Rotationsmatrix
  %
  % Syntax: theta = getangle(R, eps)
  %
  % Eingabeparameter:
  %   R: dreireihige reelle Matrix
  %   eps: (optionaler) Skalarwert, der als Toleranz für die für numerische Prüfung dient. default: 1e-9
  %
  % Ausgabeparameter:
  %   theta: Drehwinkel der Rotationsmatrix
  %
  % Beschreibung:
  %   Diese Funktion berechnet den Drehwinkel einer gegebenen dreireihigen Rotationsmatrix
  %   unter Nutzung der Formel von Rodrigues. Die Funktion benutzt zur Prüfung der
  %   Orthogonalität / Determinante der Matrix die Funktion 'isrotationmatrix'.
  %   Der Drehwinkel wird in Radiant berechnet.
  %
  % Beispiele:
  %   R = eye(3);
  %   getangle(R) # Gibt 0 aus
  %
  %   R = [0 1 0; -1 0 0; 0 0 1];
  %   getangle(R) # Gibt 1.5708 aus
  %
  % Hilfe:
  %   help getangle
  %
  % Datum: [15.04.2025]
  % Version: [1.0.1]

  % Setzt default Toleranz, falls kein Parameterwert eingegeben
  if (nargin == 1)
    eps = 1.0E-09;
  endif

  if (isrotationmatrix(R, eps) == false)
    error("@getangle: Matrix ist keine Rotationsmatrix!");
  endif

  theta = acos (1/2*(R(1,1) + R(2,2) + R(3,3) - 1));
endfunction

