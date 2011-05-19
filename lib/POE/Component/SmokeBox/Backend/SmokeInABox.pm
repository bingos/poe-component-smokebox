package POE::Component::SmokeBox::Backend::SmokeInABox;

use strict;
use warnings;
use base qw(POE::Component::SmokeBox::Backend::Base);
use vars qw($VERSION);

$VERSION = '0.48';

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
__END__

=head1 NAME

POE::Component::SmokeBox::Backend::SmokeInABox - a backend for Smoke In A Box smokers.

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

=head1 AUTHOR

Chris C<BinGOs> Williams

=head1 LICENSE

Copyright E<copy> Chris Williams.

This module may be used, modified, and distributed under the same terms as Perl itself. Please see the license that came with your Perl distribution for details.

=head1 SEE ALSO

L<POE::Component::SmokeBox::Backend>

=cut

