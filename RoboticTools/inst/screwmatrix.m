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

function [A, u] = screwmatrix (a, p, phi, lambda)
  % Syntax: screwmatrix (a, p, phi, lambda)
  %
  % Beschreibung:
  %   Diese Funktion berechnet mit Hilfe der Formel von Rodrigues eine orthogonale
  %   dreireihige Matrix 'A' zur Beschreibung einer Schraubung um eine Gerade durch einen
  %   Punkt 'p' sowie anschließender Translation mit Translationsvektor 'u' in
  %   Richtung dieser Gerade.
  %   Bei der Berechnung der Matrix 'A' wird die Funktion 'rodriguesmatrix' benutzt.
  %
  % Eingabeparameter:
  %   Für die Berechnung sind die - nicht notwendig normierte - Schraubachsen-
  %   richtung 'a', ein Punkt 'p' der Schraubachse, der Drehwinkel 'phi' und
  %   der Schraubparameter 'lambda' anzugeben. Der Vektor 'a' ist verschieden
  %   vom Nullvektor zu wählen.
  %
  % Ausgabe:
  %   geordnetes Paar, bestehend aus dreireihiger orthogonaler Matrix 'A' zur
  %   Beschreibung der Drehung sowie dreidimensionalem Translationsvektor 'u'
  %   in Richtung der Schraubachse
  %
  % Beispiel:
  %   a = [1; 2; 3];
  %   p = [1; 2; 3];
  %   phi = pi/3;
  %   t = 1.5;
  %   screwmatrix(a,p,phi,lambda)
  %
  % Hilfe:
  %   help screwmatrix
  %
  % Datum: [29.04.2025]
  % Version: [1.0.1]

  a = a(:).';
  p = p(:).';
  A = rodriguesmatrix (phi, a);
  t = lambda/sqrt(dot(a, a)) * a;
  u = p' - A*(p') + t';
endfunction

