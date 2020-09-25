#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

use Data::Dumper qw(Dumper);
require Encode;

# use base 'CommentOuted'; # will be ignored
my $dummys = 1;      # use base 'CommentOuted'; # will be ignored
use base 'Dummy';    # does not exist

exit;
