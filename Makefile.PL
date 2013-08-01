
use strict;
use warnings;

use 5.008005;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "BeLike::BINGOS when you build your dists",
  "AUTHOR" => "Chris Williams <chris\@bingosnet.co.uk>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dist-Zilla-PluginBundle-BINGOS",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dist::Zilla::PluginBundle::BINGOS",
  "PREREQ_PM" => {
    "Dist::Zilla" => "4.200006",
    "Dist::Zilla::Plugin::ChangelogFromGit" => "0.006",
    "Dist::Zilla::Plugin::Clean" => "0.02",
    "Dist::Zilla::Plugin::GithubMeta" => "0.10",
    "Dist::Zilla::Plugin::MetaJSON" => "4.200006",
    "Dist::Zilla::Plugin::PkgVersion" => "4.200006",
    "Dist::Zilla::Plugin::PodCoverageTests" => "4.200006",
    "Dist::Zilla::Plugin::PodSyntaxTests" => "4.200006",
    "Dist::Zilla::Plugin::PodWeaver" => "3.101641",
    "Dist::Zilla::Plugin::ReadmeFromPod" => "0.14",
    "Dist::Zilla::Plugin::Test::Compile" => "1.112400",
    "Dist::Zilla::Role::PluginBundle::PluginRemover" => "0.102",
    "Moose" => "1.08"
  },
  "TEST_REQUIRES" => {
    "Capture::Tiny" => 0,
    "Test::More" => "0.88",
    "blib" => 0
  },
  "VERSION" => "0.18",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



