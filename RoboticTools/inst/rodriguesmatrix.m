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

function R = rodriguesmatrix (theta, v)
  % Syntax: rodriguesmatrix (theta, v)
  %
  % Beschreibung:
  %   Diese Funktion berechnet mit Hilfe der Formel von Rodrigues eine orthogonale
  %   dreireihige Matrix zur Beschreibung einer Drehung um eine Achse durch den
  %   Koordinatenursprung des zugrunde gelegten kartesischen Koordinatensystems.
  %
  % Eingabeparameter:
  %   Für die Berechnung sind der Drehwinkel 'theta' und der - nicht notwendig normierte -
  %   Richtungsvektor der Drehachse 'v' anzugeben. Der Richtungsvektor ist verschieden
  %   vom Nullvektor zu wählen.
  %
  % Ausgabe:
  %   orthogonale Matrix 'R' zur Beschreibung der Drehung
  %
  % Beispiel:
  %   theta = pi/3;
  %   v = [1; 2; 3];
  %   rodriguesmatrix(theta,v)
  %
  % Hilfe:
  %   help rodriguesmatrix
  %
  % Datum: [29.04.2025]
  % Version: [1.0.1]

  if (v*transpose(v) == 0)
    error("@rodriguesmatrix: Der Richtungsvektor ist verschieden vom Nullvektor zu wählen.");
  endif

  d = v/sqrt (dot(v,v));
  d = d(:).';   #erzwinge d als Zeilenvektor
  R = cos(theta)*eye(3) + (1-cos(theta))*(d'*d)+sin(theta)*[0,-d(3),d(2);d(3),0,-d(1);-d(2),d(1),0];
endfunction
