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



function m = quat2mat (q)
  m = [q.re, q.im(1), q.im(2), q.im(3); -q.im(1), q.re, -q.im(3), q.im(2); -q.im(2), q.im(3), q.re, -q.im(1); -q.im(3), -q.im(2), q.im(1), q.re];
  return
endfunction
