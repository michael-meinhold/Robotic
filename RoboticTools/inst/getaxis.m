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

function v = getaxis (R, eps)
  % Funktion berechnet Richtung der Drehachse zu einer Rotationsmatrix
  %
  % Syntax: v = getaxis(R, eps)
  %
  % Eingabeparameter:
  %   R: dreireihige reelle Matrix
  %   eps: (optionaler) Skalarwert, der als Toleranz für die für numerische Prüfung dient. default: 1e-9
  %
  % Ausgabeparameter:
  %   v: Richtungsvektor der Drehachse
  %
  % Beschreibung:
  %   Diese Funktion berechnet die Richtung der Drehachse einer gegebenen dreireihigen
  %   Rotationsmatrix unter Nutzung der Formel von Rodrigues. Die Funktion benutzt zur
  %   Prüfung der Orthogonalität / Determinante der Matrix die Funktion 'isrotationmatrix'.
  %   Der Ansatz nutzt die Funktion 'getangle'. Ist Drehwinkel ist ganzzahliges Vielfaches
  %   von 2*pi, ist der Berechnungsansatz nicht anwendbar.
  %   Kann der Richtungsvektor der Drehachse berechnet werden, wird dieser normiert ausgegeben.
  %
  % Beispiele:
  %   R = eye(3);
  %   getaxis(R)  % Gibt 'error' aus
  %
  %   R = [0 1 0; -1 0 0; 0 0 1];
  %   getangle(R)  % Gibt [0; 0; -1] aus
  %
  % Hilfe:
  %   help getaxis
  %
  % Datum: [15.04.2025]
  % Version: [1.0.1]

  % Setzt default Toleranz, falls kein Parameterwert eingegeben
  if (nargin == 1)
    eps = 1.0E-09;
  endif

  if (isrotationmatrix(R, eps) == false)
    error("@getaxis: Matrix ist keine Rotationsmatrix!");
  endif

  theta = getangle (R, eps);

  if (sin(theta) <= eps)
    error("@getaxis: Drehwinkel ist ganzzahliges Vielfaches von 180 Grad. Berechnungsansatz nicht anwendbar!");
  endif

  v = 1/(2 * sin(theta)) * [R(3,2) - R(2,3); R(1,3) - R(3,1); R(2,1) - R(1,2)];
endfunction
