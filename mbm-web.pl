#!/usr/bin/env perl
# created on 2016-10-09

use warnings;
use strict;
use 5.010;
use IO::Handle ();
use URI;
use Capture::Tiny qw/capture_merged/;

use Mojolicious::Lite;

get '/' => sub {
  my $self   = shift;
  my $url    = URI->new( $self->param('url') );
  my $merged = capture_merged {
    system( 'mbm', 'add', $url->as_string ) == 0 or die "system failed: $?";
  };

  $self->render( text => $merged );
};

app->start;

# start with:
# morbo --listen 'http://localhost:4321' mbm-web.pl

# bookmarklet:
# javascript:javascript:(function(){window.open('http://localhost:4321?url='+encodeURIComponent(location.href),'_blank','menubar=no,height=390,width=600,toolbar=no,scrollbars=no,status=no,dialog=1');})();

