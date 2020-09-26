#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

eval {    # brace
    require Eval::With::Brace;    # not parsed
};    # brace

eval '    # single quote
    require Eval::With::Single::Quoted;    # not parsed
' or warn $@;    # single quote

my $eval = eval "    # double quote
            require Eval::With::Double::Quoted;    # not parsed
" || {};         # double quote

require Dummy;   # does not exist

exit;
