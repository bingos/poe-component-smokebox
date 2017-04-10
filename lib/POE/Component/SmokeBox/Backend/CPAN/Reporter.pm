package POE::Component::SmokeBox::Backend::CPAN::Reporter;

#ABSTRACT: a backend for CPAN/CPAN::Reporter smokers.

use strict;
use warnings;
use base qw(POE::Component::SmokeBox::Backend::Base);

sub _data {
  my $self = shift;
  $self->{_data} =
  {
        check => [ '-MCPAN::Reporter', '-e', 1 ],
        index => [ '-MCPAN', '-MCPAN::HandleConfig', '-e', 'CPAN::HandleConfig->load; CPAN::Shell::setup_output; CPAN::Index->force_reload();' ],
        smoke => [ '-MCPAN', '-e', 'my $module = shift; $CPAN::Config->{test_report} = 1; CPAN::Index->reload; $CPAN::META->reset_tested; test($module);' ],
  };
  return;
}

1;

=pod

=head1 DESCRIPTION

POE::Component::SmokeBox::Backend::CPAN::Reporter is a L<POE::Component::SmokeBox::Backend> plugin that defines the
C<check>, C<index> and C<smoke> commands for L<CPAN>/L<CPAN::Reporter> based smokers.

=head1 METHODS

=over

=item C<check>

Returns [ '-MCPAN::Reporter', '-e', 1 ]

=item C<index>

Returns [ '-MCPAN', '-MCPAN::HandleConfig', '-e', 'CPAN::HandleConfig->load; CPAN::Shell::setup_output; CPAN::Index->force_reload();' ]

=item C<smoke>

Returns [ '-MCPAN', '-e', 'my $module = shift; $CPAN::Config->{test_report} = 1; CPAN::Index->reload; $CPAN::META->reset_tested; test($module);' ]

=back

=head1 SEE ALSO

L<POE::Component::SmokeBox::Backend>

=cut
