grammar MM {
    token TOP { <paragraph>+ }
    token paragraph { [<bold> | <italic> | <bold-italic> | <code-inline> | . ]+ }
    token code-inline { '`' <-[`\n]>+ '`' }
    token bold-italic { '***' <-[*\n]>+ '***' }
    token bold   { '**' <-[*\n]>+ '**' }
    token italic { '*'  <-[*\n]>+ '*' }
}


my $parse = MM.parse: 'This is **bold** and this is *italic* and... ***this*** is `code`';

say $parse;
