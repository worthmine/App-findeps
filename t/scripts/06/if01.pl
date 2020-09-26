#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

if (1) { require If::Before::Require }    # comment

require Dummy;                            # does not exist anywhere

exit;
