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

function T = basistransformation (B1, B2, eps, varargin)
  % Syntax: T = basistransformation(B1, B2, eps)
  %
  % Eingabeparameter:
  %   B1: Orthogonale Basis (Matrix)
  %   B2: Orthogonale Basis (Matrix)
  %   eps: Toleranz (Wert)
  %
  % Ausgabeparameter:
  %   T: transponierte Matrix (Matrix)
  %
  % Beschreibung:
  %   Diese Funktion berechnet die transponierte Matrix zwischen zwei orthogonalen Basen.
  %   Die Funktion überprüft, ob die Eingabeparameter orthogonale Matrizen sind und ob die
  %   Determinante der Eingabeparameter gleich 1 ist.
  %
  % Optionale Argumente:
  %   'verbose': Aktiviert die Ausgabe von Debug-Informationen
  %   'tolerance': Ändert die Toleranz für die Überprüfung der Orthogonalität
  %
  % Beispiele:
  %   basistransformation([1 0 0; 0 1 0; 0 0 1], [1 0 0; 0 0 1 ; 0 -1 0])
  %   basistransformation([1 0 0; 0 1 0; 0 0 1], [1 0 0; 0 0 1 ; 0 -1 0], 1e-9)
  %   basistransformation([1 0 0; 0 1 0; 0 0 1], [1 0 0; 0 0 1 ; 0 -1 0], 1e-9, 'verbose')
  %
  % Hilfe:
  %   help basistransformation
  %
  % Datum: [01.04.2025]
  % Version: [1.0.1]

  if (nargin == 2)
    eps = 1.0E-09;
  endif

  % Eingabeparameter B1 und B2 werden auf ihre Eigenschaften geprüft
  if (!isnumeric(B1) || !isnumeric(B2))
    error("@basistransformation: Eingabeparameter müssen Matrizen sein!");
  endif

  if (norm(B1*transpose(B1)-eye(3), "fro") >= eps)
    error("@basistransformation: erstes Argument muss orthogonal sein!");
  endif

  if (norm(B2*transpose(B2)-eye(3), "fro") >= eps)
    error("@basistransformation: zweites Argument muss orthogonal sein!");
  endif

  if (abs(det(B1) - 1.0) >= eps)
    error("@basistransformation: Determinante des ersten Arguments ist nicht gleich 1!");
  endif

  if (abs(det(B2) - 1.0) >= eps)
    error("@basistransformation: Determinante des zweiten Arguments ist nicht gleich 1!");
  endif

  T = zeros(3, 3);
  for i = 1:3
    for j = 1:3
      T(i,j) = dot(B1(:,i), B2(:,j));
    endfor
  endfor
  T;

  % Aktiviert die Ausgabe von Debug-Informationen
  if ismember('verbose', varargin)
    disp('Debug-Informationen aktiviert');
    disp('Eingabeparameter:');
    disp('B1:');
    disp(B1);
    disp('B2:');
    disp(B2);
    disp('eps:');
    disp(eps);
  endif
endfunction
