
use strict;
use warnings;

use ExtUtils::MakeMaker 6.30;


my %WriteMakefileArgs = (
  "ABSTRACT" => "authenticate human by create and validate captcha",
  "AUTHOR" => "Baskar Nallathambi <baskarmusiri\@gmail.com>",
  "BUILD_REQUIRES" => {
    "Catalyst" => 0,
    "Catalyst::Controller" => 0,
    "Catalyst::Runtime" => "5.80",
    "GD::SecurityImage" => 0,
    "FindBin" => 0,
    "Moose" => 0,
    "Test::More" => 0,
    "Test::WWW::Mechanize::Catalyst" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Catalyst-TraitFor-Controller-CAPTCHA",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Catalyst::TraitFor::Controller::CAPTCHA",
  "PREREQ_PM" => {
    "Moose::Role" => 0,
    "MooseX::MethodAttributes::Role" => 0,
    "namespace::autoclean" => 0
  },
  "VERSION" => "1.0",
  "test" => {
    "TESTS" => "t/*.t"
  },
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

$ExtUtils::MakeMaker::VERSION > 6.46 and $WriteMakefileArgs{META_MERGE} = {
        'meta-spec' => { version => 2 },
        'resources' => {
                'repository'  => {
                        type => 'git',
                        url => 'https://github.com/Virendrabaskar/Catalyst-TraitFor-Controller-CAPTCHA.git',
                        web => 'https://github.com/Virendrabaskar/Catalyst-TraitFor-Controller-CAPTCHA'
                }
        }
};

WriteMakefile(%WriteMakefileArgs);



