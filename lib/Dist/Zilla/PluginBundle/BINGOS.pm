package Dist::Zilla::PluginBundle::BINGOS;
BEGIN {
  $Dist::Zilla::PluginBundle::BINGOS::VERSION = '0.08';
}

# ABSTRACT: BeLike::BINGOS when you build your dists

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

sub configure {
  my $self = shift;
  $self->add_bundle('Basic');
  $self->add_plugins(
    'MetaJSON',
    'PodSyntaxTests',
    'PodCoverageTests',
    'PkgVersion',
    'GithubMeta',
    'ReadmeFromPod',
    'PodWeaver',
    'CompileTests',
    'Clean',
    [ 'ChangelogFromGit' =>
        { file_name => 'Changes', tag_regexp => '^\d', max_age => ( 5 * 365 ) }
    ],
  );

}

__PACKAGE__->meta->make_immutable;
no Moose;

qq[BELIKE::BINGOS];


__END__
=pod

=head1 NAME

Dist::Zilla::PluginBundle::BINGOS - BeLike::BINGOS when you build your dists

=head1 VERSION

version 0.08

=head1 SYNOPSIS

   # in dist.ini
   [@BINGOS]

=head1 DESCRIPTION

This is a L<Dist::Zilla> PluginBundle.  It is roughly equivalent to the
following dist.ini:

  [@Basic]

  [MetaJSON]
  [PodSyntaxTests]
  [PodCoverageTests]

  [PodWeaver]
  [PkgVersion]
  [GithubMeta]

  [ChangelogFromGit]
  file_name = Changes
  tag_regexp = ^\d
  max_age = 1825

  [ReadmeFromPod]
  [CompileTests]

  [Clean]

=head2 METHODS

=over

=item C<configure>

See L<Dist::Zilla::PluginBundle::Role::Easy>.

=back

=head1 AUTHOR

Chris Williams <chris@bingosnet.co.uk>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Chris Williams.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

