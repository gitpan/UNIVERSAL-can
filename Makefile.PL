
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "work around buggy code calling UNIVERSAL::can() as a function",
  "AUTHOR" => "chromatic",
  "BUILD_REQUIRES" => {
    "Test::More" => 0,
    "overload" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "UNIVERSAL-can",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "UNIVERSAL::can",
  "PREREQ_PM" => {
    "Scalar::Util" => 0,
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0,
    "warnings::register" => 0
  },
  "VERSION" => "1.20120726",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


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



