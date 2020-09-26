#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

require If::After::Require if 1;    # comment

require Dummy;                      # does not exist anywhere

exit;
