#!/usr/bin/env perl

use strict;
use warnings;

use feature qw(say);

our $VERSION = "0.01";

use Data::Dumper qw(Dumper);

=encoding utf-8

=head1 NAME

it's a dummy POD for testing

=head1 SYNOPSIS

Via the command-line program L<findeps>;

    require Nothing;
    use Nothing::Else;
    use parent 'Something';

=head1 DESCRIPTION

Nothing to explain.

=head1 LICENSE

Copyright (C) worthmine.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Yuki Yoshida(L<worthmine|https://github.com/worthmine>)

=cut

require Dummy;    # does not exist anywhere

exit;
