#!/usr/bin/env perl

use strict; use warnings;

my @rc_files = qw/bashrc vimrc screenrc/;

sub backup_file
{
  my $file = shift;
  print "$file exists, backing up a copy...\n";
  system("cp $file $file." . time() . ".back");
}

foreach my $rc_file (@rc_files)
{
    my $fn = "~/\." . "$rc_file";
    `ls -lrta $fn 2>/dev/null`;
    if (${^CHILD_ERROR_NATIVE} == 0)
    { 
      backup_file($fn);
    }
    `ln -sf ~/.dotfiles/$rc_file ~/.$rc_file`
}
