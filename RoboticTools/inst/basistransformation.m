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

## Spaltenvektoren von B1 definieren das Rastkoordinatensystem
## Spaltenvektoren von B2 definieren das Gangkoordinatensystem


function T = basistransformation (B1, B2, eps)
  if (nargin == 2)
    eps = 1.0E-09;
  endif

  if (norm(B1*B1'-eye(3), "fro") >= eps)
    error("@basistransformation: first argument must be orthogonal!");
  endif

  if (norm(B2*B2'-eye(3), "fro") >= eps)
    error("@basistransformation: second argument must be orthogonal!");
  endif

  if (abs(det(B1) - 1.0) >= eps)
    error("@basistransformation: determinant of first argument is not equal to 1!")
  endif

  if (abs(det(B2) - 1.0) >= eps)
    error("@basistransformation: determinant of second argument is not equal to 1!")
  endif

  for i = 1:3
    for j = 1:3
      T(i,j) = dot(B1(:,i), B2(:,j));
    endfor
  endfor
  T;
endfunction
