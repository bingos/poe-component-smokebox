package POE::Component::SmokeBox::Backend::CPAN::Reporter::Smoker;

#ABSTRACT: a backend for CPAN::Reporter::Smoker smokers.

use strict;
use warnings;
use base qw(POE::Component::SmokeBox::Backend::Base);

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

=pod

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

=head1 SEE ALSO

L<POE::Component::SmokeBox::Backend>

L<CPAN::Reporter::Smoker>

=cut
