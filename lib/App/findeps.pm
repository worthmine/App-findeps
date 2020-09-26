package App::findeps;

use 5.012005;
use strict;
use warnings;

our $VERSION = "0.05";

use Carp qw(carp croak);
use ExtUtils::Installed;
use List::Util qw(first);
use FastGlob qw(glob);

our $Upgrade    = 0;
our $myLib      = 'lib';
our $toCpanfile = 0;
my $RE = qr/\w+\.((?i:p[ml]|t|cgi|psgi))$/;

sub scan {
    my %args = @_;
    my %pairs;
    while ( my $file = shift @{ $args{files} } ) {
        $file =~ $RE;
        my $ext = $1 || croak 'Unvalid extension was set';
        open my $fh, '<', $file or die "Can't open < $file: $!";
        while (<$fh>) {
            chomp;
            next unless length $_;
            last if /^__(?:END|DATA)__$/;
            next if /^\s*#.*$/;
            state $pod;
            if ( !$pod and /^=(\w+)/ ) {
                $pod = $1;
            } elsif ( $pod and /^=cut$/ ) {
                undef $pod;
                next;
            }
            next if $pod;
            scan_line( \%pairs, $_ );
        }
        close $fh;
    }
    my $deps  = {};
    my @local = &glob("$myLib/*.p[lm]");
    while ( my ( $name, $version ) = each %pairs ) {
        next                      if !defined $name;
        next                      if exists $deps->{$name};
        next                      if first { $_ =~ /$name\.p[lm]$/ } @local;
        $deps->{$name} = $version if !defined $version or $Upgrade or $toCpanfile;
    }
    return $deps;
}

# subroutines #----#----#----#----#----#----#----#----#----#----#----#----#
my @pragmas = qw(
    attributes autodie autouse
    base bigint bignum bigrat blib bytes
    charnames constant diagnostics encoding
    feature fields filetest if integer less lib locale mro
    open ops overload overloading parent re
    sigtrap sort strict subs
    threads threads::shared utf8 vars vmsish
    warnings warnings::register
);

sub scan_line {
    my $pairs = shift;
    local $_ = shift;
    s/#.*$//;
    my @names   = ();
    my $qr4name = qr/[a-zA-Z][a-zA-Z\d]+(?:::\w+){0,}/;
    if (/use\s+(?:base|parent)\s+qw[\("']\s*((?:$qr4name\s*){1,})[\)"']/) {
        push @names, split /\s+/, $1;
    } elsif (/use\s+(?:base|parent|autouse)\s+(['"])?($qr4name)\1?/) {
        $names[0] = $2;
    } elsif (/(eval|if)\s*(['"{])\s*(require|use)\s+($qr4name).*(?:\2|})/) {
        my ( $cmd, $name, $func ) = ( $1, $4, $3 );
        my $res = qx"corelist -v 5.012005 $name";
        warn "$name is ${func}d inside of $cmd" if !$res;

    } elsif (/^\s*(?:require|use)\s+($qr4name)/) {
        $names[0] = $1;
    } elsif (/^\s*require\s+(["'])($qr4name)\.p[lm]\1/) {
        $names[0] = $2;
    }
    for my $name (@names) {
        next unless length $name;
        next if exists $pairs->{$name};
        next if $name eq 'Plack::Builder';
        next if first { $name eq $_ } @pragmas;
        $pairs->{$name} = get_version($name);
    }
    return %$pairs;
}

sub get_version {
    my $name      = shift;
    my $installed = ExtUtils::Installed->new( skip_cwd => 1 );
    my $module    = first { $_ eq $name } $installed->modules();
    my $version   = eval { $installed->version($module) };
    return "$version" if $version;
    eval "require $name" or return undef;
    return eval "no strict 'subs';\$${name}::VERSION" || 0;
}

1;

__END__

=encoding utf-8

=head1 NAME

App::findeps - the Module to find dependencies for files you've selected

=head1 SYNOPSIS

Via the command-line program L<findeps>;

    $ findeps Plack.psgi | cpanm
    $ findeps index.cgi | cpanm
    $ findeps t/00_compile.t | cpanm

=head1 DESCRIPTION

App::findeps is a base module for executing L<findeps>

=head1 TODO

is moved to L<github issue|https://github.com/worthmine/App-findeps/issues>

=head1 SEE ALSO

L<findeps>

=head1 LICENSE

Copyright (C) worthmine.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Yuki Yoshida(L<worthmine|https://github.com/worthmine>)

=cut
