#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

use Data::Dumper qw(Dumper);
require Encode;

# use parent "CommentOuted";    # does not exist
my $dummys = 1;        # use parent "CommentOuted"; # will be ignored
use parent "Dummy";    # does not exist

exit;
