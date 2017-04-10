package POE::Component::SmokeBox::Backend::Test::Idle;

#ABSTRACT: a backend to test idle kills.

use strict;
use warnings;
use base qw(POE::Component::SmokeBox::Backend::Base);

sub _data {
  my $self = shift;
  $self->{_data} =
  {
	check => [ '-e', 1 ],
	index => [ '-e', 1 ],
	smoke => [ '-e', '$|=1; my $module = shift; print $module, qq{\n}; sleep 60;' ],
  };
  return;
}

1;

=pod

=head1 DESCRIPTION

POE::Component::SmokeBox::Backend::Test::Idle is a L<POE::Component::SmokeBox::Backend> plugin used during the
L<POE::Component::SmokeBox> tests.

It contains no moving parts.

=head1 SEE ALSO

L<POE::Component::SmokeBox::Backend>

=cut

