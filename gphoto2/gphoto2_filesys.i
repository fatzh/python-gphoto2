// python-gphoto2 - Python interface to libgphoto2
// http://github.com/jim-easterbrook/python-gphoto2
// Copyright (C) 2014  Jim Easterbrook  jim@jim-easterbrook.me.uk
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

%module gphoto2_filesys

%{
#include "gphoto2/gphoto2.h"
%}

%feature("autodoc", "2");

%include "typemaps.i"

// image dimensions use uint32_t
%typemap(in) uint32_t {
  $1 = PyInt_AsLong($input);
}
%typemap(out) uint32_t {
  $result = PyInt_FromLong($1);
}

// image mtime uses time_t
%typemap(in) time_t {
  $1 = PyInt_AsLong($input);
}
%typemap(out) time_t {
  $result = PyInt_FromLong($1);
}

// Some things are defined in .h files but are not in the library
%ignore gp_filesystem_get_storageinfo;

%include "gphoto2/gphoto2-filesys.h"