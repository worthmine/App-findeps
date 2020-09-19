package App::findeps;
use 5.012_001;
use strict;
use warnings;

our $VERSION = "0.01";

use Carp qw(carp croak);
use File::Find qw(find);
use ExtUtils::Installed;
use List::Util qw(first);

my $RE    = qr/\w+\.((?i:p[ml]|t|cgi|psgi))$/;
my @local = find( sub { $_[0] and $_[0] =~ /\.p[ml]$/ }, 'lib' );

sub scan {
    my %args = @_;
    my $deps = {};
    while ( my $file = shift @{ $args{files} } ) {
        $file =~ $RE;
        my $ext = $1 || croak 'Unvalid extension was set';
        open my $fh, '<', $file or die "Can't open < $file: $!";
        while (<$fh>) {
            chomp;
            next unless length $_;
            last if /^__(?:END|DATA)__$/;
            next if /^\s*#.*$/;
            my ( $name, $version ) = scan_line($_);
            next if !defined $name;
            next if first { $_ =~ /$name.p[ml]/io } @local;
            $deps->{$name} = $version unless defined $version;
        }
        close $fh;
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
    local $_ = shift;
    return unless /(?:use\s*(?:base|parent|autouse)?|require)\s+(['"]?)([^'"\s;]+)\1/o;
    my $name = $2;
    return if $name =~ /^5/;
    return if first { $_ eq $name } @pragmas;

    my $installed = ExtUtils::Installed->new( skip_cwd => 1 );
    my $module    = first { $_ eq $name } $installed->modules();
    my $version   = eval { $installed->version($module) } || undef;
    return ( $name, "$version" )     if $version;
    return ( $name, $version || '' ) if $name =~ /\.p[lm]$/;
    $version = eval "no strict 'subs';require $name;\$${name}::VERSION";
    return ( $name, $version );
}

1;

__END__

=encoding utf-8

=head1 NAME

App::findeps - It's new $module

=head1 SYNOPSIS

    use App::findeps;

=head1 DESCRIPTION

App::findeps is ...

=head1 LICENSE

Copyright (C) worthmine.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

worthmine E<lt>worthmine@gmail.comE<gt>

=cut

