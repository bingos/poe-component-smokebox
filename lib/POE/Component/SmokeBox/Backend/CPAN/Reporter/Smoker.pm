package POE::Component::SmokeBox::Backend::CPAN::Reporter::Smoker;

use strict;
use warnings;
use base qw(POE::Component::SmokeBox::Backend::Base);
use vars qw($VERSION);

$VERSION = '0.42';

sub _data {
  my $self = shift;
  $self->{_data} =
  {
        check => [ '-e', 'use CPAN::Reporter::Smoker 0.17;' ],
        index => [ '-MCPAN', '-MCPAN::HandleConfig', '-e', 'CPAN::HandleConfig->load; CPAN::Shell::setup_output; CPAN::Index->force_reload();' ],
        smoke => [ '-MCPAN::Reporter::Smoker', '-e', 'my $module = shift; start( list => [ $module ] );' ],
  };
  return;
}

1;
__END__

=head1 NAME

POE::Component::SmokeBox::Backend::CPAN::Reporter::Smoker - a backend for CPAN::Reporter::Smoker smokers.

=head1 DESCRIPTION

POE::Component::SmokeBox::Backend::CPAN::Reporter::Smoker is a L<POE::Component::SmokeBox::Backend> plugin that defines the
C<check>, C<index> and C<smoke> commands for L<CPAN::Reporter::Smoker> based smokers.

=head1 METHODS

=over

=item C<check>

Returns [ '-e', 'use CPAN::Reporter::Smoker 0.17;' ]

=item C<index>

Returns [ '-MCPAN', '-MCPAN::HandleConfig', '-e', 'CPAN::HandleConfig->load; CPAN::Shell::setup_output; CPAN::Index->force_reload();' ]

=item C<smoke>

Returns [ '-MCPAN::Reporter::Smoker', '-e', 'my $module = shift; start( list => [ $module ] );' ]

=back

=head1 AUTHOR

Chris C<BinGOs> Williams

=head1 LICENSE

Copyright C<(c)> Chris Williams.

This module may be used, modified, and distributed under the same terms as Perl itself. Please see the license that came with your Perl distribution for details.

=head1 SEE ALSO

L<POE::Component::SmokeBox::Backend>

L<CPAN::Reporter::Smoker>

=cut
