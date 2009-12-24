package POE::Component::SmokeBox::Smoker;

use strict;
use warnings;
use Params::Check qw(check);
use base qw(Object::Accessor);
use vars qw($VERSION $VERBOSE);

$VERSION = '0.34';

sub new {
  my $package = shift;

  my $tmpl = {
	perl => { defined => 1, required => 1 },
	env  => { defined => 1, allow => [ sub { return 1 if ref $_[0] eq 'HASH'; } ], },
  };

  my $args = check( $tmpl, { @_ }, 1 ) or return;
  my $self = bless { }, $package;
  my $accessor_map = {
	perl => sub { defined $_[0]; },
	env  => sub { return 1 if ref $_[0] eq 'HASH'; }, 
  };
  $self->mk_accessors( $accessor_map );
  $self->$_( $args->{$_} ) for keys %{ $args };
  return $self;
}

sub dump_data {
  my $self = shift;
  my @returns = qw(perl);
  push @returns, 'env' if defined $self->env();
  return map { ( $_ => $self->$_ ) } @returns;
}

1;
__END__

=head1 NAME

POE::Component::SmokeBox::Smoker - encapsulates a smoker object.

=head1 SYNOPSIS

  use POE::Component::SmokeBox::Smoker;

  my $smoker = POE::Component::SmokeBox::Smoker->new(
	perl => '/home/foo/perl-5.10.0/bin/perl', 
	env  => { APPDATA => '/home/foo/perl-5.10.0/', },
  );

  print $smoker->perl();
  my $hashref = $smoker->env();

=head1 DESCRIPTION

POE::Component::SmokeBox::Smoker provides an object based API for SmokeBox smokers. A smoker is defined as
the path to a C<perl> executable that is configured for CPAN Testing and its associated environment settings.

=head1 CONSTRUCTOR

=over

=item C<new>

Creates a new POE::Component::SmokeBox::Smoker object. Takes two parameters:

  'perl', the path to a suitable perl executable, (required);
  'env', a hashref containing %ENV type environment variables;

=back

=head1 METHODS

=over

=item C<perl>

Returns the C<perl> executable path that was set.

=item C<env>

Returns the hashref of %ENV settings, if applicable.

=item C<dump_data>

Returns all the data contained in the object as a list.

=back

=head1 AUTHOR

Chris C<BinGOs> Williams

=head1 LICENSE

Copyright C<(C)> Chris Williams

This module may be used, modified, and distributed under the same terms as Perl itself. Please see the license that came with your Perl distribution for details.

=head1 SEE ALSO

L<POE::Component::SmokeBox>

L<POE::Component::SmokeBox::JobQueue>

L<POE::Component::SmokeBox::Backend>

=cut
