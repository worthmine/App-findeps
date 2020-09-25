#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

use lib 't/lib';
use Data::Dumper qw(Dumper);
require Encode;

# use CommentOuted; # will be ignored
my $dummys = 1;    # use CommentOuted; # will be ignored
use Dummy;         # does not exist

exit;
