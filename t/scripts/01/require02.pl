#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

use Data::Dumper qw(Dumper);

# require 'CommentOuted' # will be ignored
my $dummys = 1;        # require 'CommentOuted' # will be ignored
require 'Dummy.pm';    # does not exist

exit;
