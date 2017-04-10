package POE::Component::SmokeBox::Backend::SmokeInABox;

#ABSTRACT: a backend for Smoke In A Box smokers.

use strict;
use warnings;
use base qw(POE::Component::SmokeBox::Backend::Base);

sub _data {
  my $self = shift;
  $self->{_data} =
  {
	check => [ '-e', 1 ],
	index => [ 'bin/cpanp-boxed', '-x', '--update_source' ],
	smoke => [ 'bin/yactest-boxed' ],
  };
  return;
}

1;

=pod

=head1 DESCRIPTION

POE::Component::SmokeBox::Backend::SmokeInABox is a L<POE::Component::SmokeBox::Backend> plugin that defines the
C<check>, C<index> and C<smoke> commands for Smoke In A Box based smokers.

Change directory to the Smoke In A Box directory beforing running L<minismokebox>.

=head1 METHODS

=over

=item C<check>

Returns [ '-e', 1 ]

=item C<index>

Returns [ 'bin/cpanp-boxed', '-x', '--update_source' ]

=item C<smoke>

Returns [ 'bin/yactest-boxed' ]

=back

=head1 SEE ALSO

L<POE::Component::SmokeBox::Backend>

=cut

