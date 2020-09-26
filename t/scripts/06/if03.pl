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

require Dummy;    # does not exist anywhere

exit;
