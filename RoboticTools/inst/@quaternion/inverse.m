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

function q = inverse (a)
   n = norm (a);
  if ( n > 0 )
    ac = conjugate (a);
    q = quaternion ([(ac.re)/n , (ac.im(1))/n, (ac.im(2))/n, (ac.im(3))/n]);
  else
    error("quaternion: inverse: Inverse doesn't exist. (Norm <= 0)");
  endif
endfunction
