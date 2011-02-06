package POE::Component::SmokeBox::Backend::CPANPLUS::YACSmoke;

use strict;
use warnings;
use base qw(POE::Component::SmokeBox::Backend::Base);
use vars qw($VERSION);

$VERSION = '0.42';

sub _data {
  my $self = shift;
  $self->{_data} =
  {
	check => [ '-MCPANPLUS::YACSmoke', '-e', 1 ],
	index => [ '-MCPANPLUS::Backend', '-e', 'CPANPLUS::Backend->new()->reload_indices( update_source => 1 );' ],
	smoke => [ '-MCPANPLUS::YACSmoke', '-e', 'my $module = shift; my $smoke = CPANPLUS::YACSmoke->new(); $smoke->test($module);' ],
  };
  return;
}

1;
__END__

=head1 NAME

POE::Component::SmokeBox::Backend::CPANPLUS::YACSmoke - a backend for CPANPLUS::YACSmoke smokers.

=head1 DESCRIPTION

POE::Component::SmokeBox::Backend::CPAN::Reporter is a L<POE::Component::SmokeBox::Backend> plugin that defines the
C<check>, C<index> and C<smoke> commands for L<CPANPLUS::YACSmoke> based smokers.

=head1 METHODS

=over

=item C<check>

Returns [ '-MCPANPLUS::YACSmoke', '-e', 1 ]

=item C<index>

Returns [ '-MCPANPLUS::Backend', '-e', 'CPANPLUS::Backend->new()->reload_indices( update_source => 1 );' ]

=item C<smoke>

Returns [ '-MCPANPLUS::YACSmoke', '-e', 'my $module = shift; my $smoke = CPANPLUS::YACSmoke->new(); $smoke->test($module);' ]

=back

=head1 AUTHOR

Chris C<BinGOs> Williams

=head1 LICENSE

Copyright C<(c)> Chris Williams.

This module may be used, modified, and distributed under the same terms as Perl itself. Please see the license that came with your Perl distribution for details.

=head1 SEE ALSO

L<POE::Component::SmokeBox::Backend>

=cut

