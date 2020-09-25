#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

use lib 't/lib';
use Data::Dumper qw(Dumper);

# require 'CommentOuted.pl'; # will be ignored
my $dummys = 1;        # require 'CommentOuted.pl'; # will be ignored
require "Dummy.pl";    # does not exist

exit;
