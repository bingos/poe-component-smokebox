package POE::Component::SmokeBox::Backend::Base;

use strict;
use warnings;
use vars qw($VERSION);

$VERSION = '0.34';

sub new {
  my $package = shift;
  my %opts = @_;
  $opts{lc $_} = delete $opts{$_} for keys %opts;
  my $self = bless \%opts, $package;
  $self->_data();
  return $self;
}

sub _data {
  my $self = shift;
  $self->{_data} = 
  {
  	check => [ 'DUMMY' ],
  	index => [ 'DUMMY' ],
	smoke => [ 'DUMMY' ],
  };
  return;
}

sub check {
  my $self = shift;
  return $self->{_data}->{'check'} if $self->{_data}->{'check'};
}

sub index {
  my $self = shift;
  return $self->{_data}->{'index'} if $self->{_data}->{'index'};
}

sub smoke {
  my $self = shift;
  return $self->{_data}->{'smoke'} if $self->{_data}->{'smoke'};
}

1;
__END__

=head1 NAME

POE::Component::SmokeBox::Backend::Base - Base class for Backend smokers.

=head1 SYNOPSIS

  package POE::Component::SmokeBox::Backend::Example;

  use strict;
  use warnings;
  use base qw(POE::Component::SmokeBox::Backend::Base);

  sub _data {
    my $self = shift;
    $self->{_data} =
    {
  	check => [ '-MSome::Funky::Module', '-e', '1' ],
  	index => [ '-MSome::Funky::Module', '-e', 'reload_indices();' ],
	smoke => [ '-MSome::Funky::Module', '-e', 'my $module = shift; test($module);' ],
    };
    return;
  }

=head1 DESCRIPTION

POE::Component::SmokeBox::Backend::Base is a base class for L<POE::Component::SmokeBox::Backend> smoker definitions.
The idea is to inherit this base class and overload the definition for the C<_data> method to define the applicable
command line arguments for C<check>, C<index> and C<smoke> commands that L<POE::Component::SmokeBox::Backend> uses.

=head1 CONSTRUCTOR

=over

=item C<new>

Creates a new POE::Component::SmokeBox::Backend::* object.

=back

=head1 METHODS

=over

=item C<check>

Returns an arrayref of command line options that get passed to C<perl> to check that a particular module is installed.

  [ '-MSome::Funky::Module', '-e', '1' ]

=item C<index>

Returns an arrayref of command line options that get passed to C<perl> to perform a reindex of the module database that
a smoker uses.

  [ '-MSome::Funky::Module', '-e', 'reload_indices();' ]

=item C<smoke>

Returns an arrayref of command line options that get passed to C<perl> to actually test a distribution in a smoker. The 
distribution to smoke will be passed as $ARGV[0].

  [ '-MSome::Funky::Module', '-e', 'my $module = shift; test($module);' ]

=item C<_data>

An internal method that gets called from C<new()> to initialise the internal data of the object. Overload this method to
set your data in sub-classes.

=back

=head1 AUTHOR

Chris C<BinGOs> Williams <chris@bingosnet.co.uk>

=head1 LICENSE

Copyright C<(c)> Chris Williams.

This module may be used, modified, and distributed under the same terms as Perl itself. Please see the license that came with your Perl distribution for details.

=head1 SEE ALSO

L<POE::Component::SmokeBox::Backend>

L<POE::Component::SmokeBox::Backend::CPAN::YACSmoke>

L<POE::Component::SmokeBox::Backend::CPAN::Reporter>

L<POE::Component::SmokeBox::Backend::CPANPLUS::YACSmoke>

=cut
