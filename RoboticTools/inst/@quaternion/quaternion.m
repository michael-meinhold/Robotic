## -*- texinfo -*-
## @deftypefn  {} {} quaternion ()
## @deftypefnx {} {} quaternion (@var{x})
## Create a quaternion object representing the Quaternion
##
## @example
## x0 + x1 * i + x2 * j + x3 * k
## @end example
##
## @noindent
## from a vector of coefficients x=[x0 x1 x2 x3].
## @end deftypefn

function q = quaternion (x)
    if (nargin > 1)
      print_usage ();
    endif

    if (nargin == 0)  # q=quaternion()
     q.re = 0;
     q.im = struct ("x", 0, "y", 0, "z", 0);
     q = class (q, "quaternion");
    else
      if (isa (x, "quaternion"))
        q = x;
      elseif (isreal (x) && isvector (x))
        q.re = x(1);
        q.im = struct ("x", x(2), "y", x(3), "z", x(4));
        q = class (q, "quaternion");
        q = class (q, "quaternion");
      else
        error ("@quaternion: A must be a real vector");
      endif
    endif

endfunction
