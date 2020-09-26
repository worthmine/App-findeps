#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

if (1) {
    require Require::With::If;    # not parsed
}

if (1) {    # comment
    require Require::With::If::Commented;    # not parsed
}    # comment

if (1) {    # first
    if (1) {    # second
        if (1) {    # third
            require Require::With::Nested::If;    # not parsed
        }
    }
}

require Dummy;                                    # does not exist anywhere

exit;
